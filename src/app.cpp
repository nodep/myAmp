#include <stdio.h>
#include <stdlib.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "app.h"
#include "adc.h"
#include "programs.h"
#include "graphtext.h"

App::App()
{
	display.init();
	fill(display, colBlack);

	//ts.init();

	// init the ADC sources
	adc.set_muxpos(0, ADC_MUXPOS_AIN7_gc, 0);
	adc.set_muxpos(1, ADC_MUXPOS_AIN10_gc, 32);
	adc.set_muxpos(2, ADC_MUXPOS_AIN11_gc, 32);
	adc.set_muxpos(3, ADC_MUXPOS_AIN12_gc, 32);
	adc.set_muxpos(4, ADC_MUXPOS_AIN13_gc, 32);

	Preset::dump_eeprom_presets();

	//hline(display, 0, 0, 320, colRed);
	//set_large_font(FreeSans9pt7b);			print_large(display, "P",  5, 0, colYellow);
	//set_large_font(FreeSans12pt7b);			print_large(display, "P", 20, 0, colYellow);
	//set_large_font(FreeSans18pt7b);			print_large(display, "P", 37, 0, colYellow);
	//set_large_font(FreeSans24pt7b);			print_large(display, "P", 55, 0, colYellow);
	//set_large_font(FreeSansBold9pt7b);		print_large(display, "P", 80, 0, colYellow);
	//set_large_font(FreeSansBold12pt7b);		print_large(display, "P", 95, 0, colYellow);
	//set_large_font(FreeSansBold18pt7b);		print_large(display, "P", 115, 0, colYellow);
	//set_large_font(FreeSansBold24pt7b);		print_large(display, "P", 135, 0, colYellow);
	//while (1);

	// wait until the ADC stabilizes
	for (int8_t i = 0; i < 10; i++)
	{
		while (!adc.has_fresh_set())
			;
	}

	// draw the pedals
	draw_exp_pedal(50, 185);
	draw_ftsw_pedal(170, 180);

	// load the active preset
	Preset preset;
	preset.load_active_prog();
	fv1.set_preset(preset);
	refresh_preset();
}

void App::poll()
{
	Preset current_preset = fv1.get_active_preset();

	if (adc.has_fresh_set())
	{
		// convert ADC result to voltage
		refresh_voltage(adc.results[0] / ADC_VOLTAGE_FACTOR);

		if (adc.has_changed[1])
			current_preset.pots[0] = 0x1000 - (adc.results[1] >> 4);

		if (adc.has_changed[2])
			current_preset.pots[1] = 0x1000 - (adc.results[2] >> 4);

		if (adc.has_changed[3])
			current_preset.pots[2] = 0x1000 - (adc.results[3] >> 4);

		if (adc.has_changed[4])
			current_preset.mix = 0xff - (adc.results[4] >> 8);
	}

	if (rotenc.get_button_event() == RotEnc::beLong)
		current_preset.save();

	const auto delta = rotenc.get_delta();
	if (delta)
	{
		int16_t new_prog_num = current_preset.prog_num + delta;
		if (new_prog_num < 0)
			new_prog_num = NUM_FV1_PROGRAMS - 1;
		if (new_prog_num >= NUM_FV1_PROGRAMS)
			new_prog_num = 0;

		// load the preset if it changed
		if (current_preset.prog_num != new_prog_num)
		{
			current_preset.load(new_prog_num);
			current_preset.save_active_prog();
		}
	}

	if (fv1.set_preset(current_preset))
	{
		//dprint("prog=%u P0=%u P1=%u P2=%u mix=%u\n",
		//		current_preset.prog_num,
		//		current_preset.pots[0],
		//		current_preset.pots[1],
		//		current_preset.pots[2],
		//		current_preset.mix);

		refresh_preset();
	}
}

void App::refresh_voltage(const double battery_voltage)
{
	static uint16_t prev_refresh = 0;
	if (Watch::has_ms_passed_since(2000, prev_refresh))
	{
		// calc the length of the voltage bar
		static uint16_t prev_charge = 0;
		uint16_t curr_charge = 0;
		if (battery_voltage > MIN_VOLTAGE)
		{
			constexpr double factor = Display::Height / (MAX_VOLTAGE - MIN_VOLTAGE);
			curr_charge = static_cast<uint16_t>((battery_voltage - MIN_VOLTAGE) * factor);
			if (curr_charge > Display::Height)
				curr_charge = Display::Height;
		}

		// draw the bar if it changed
		if (curr_charge < prev_charge)
			fill_rect(display, 0, Display::Height - prev_charge, VOLTAGE_BAR_WIDTH, prev_charge - curr_charge, colBlack);
		else if (curr_charge > prev_charge)
			fill_rect(display, 0, Display::Height - curr_charge, VOLTAGE_BAR_WIDTH, curr_charge - prev_charge, colGreen);

		// print the voltage
		static char prev_buff[6] = {0};
		char buff[6];
		sprintf(buff, "%.1fV", battery_voltage);
		if (strcmp(buff, prev_buff) != 0)
		{
			Window<40, 8> win(colBlack);
			set_large_font(Org_01);
			print_large(win, buff, 0, 0, colYellow);
			display.blit(win, VOLTAGE_BAR_WIDTH + 2, Display::Height - win.Height - 2);
			strcpy(prev_buff, buff);
		}

		prev_charge = curr_charge;
		prev_refresh = Watch::now();
	}
}

void App::refresh_preset()
{
	const auto start = Watch::now();
	static uint8_t prev_prog = 0xff;

	const Preset& preset = fv1.get_active_preset();

	// names
	char name[LONGEST_NAME];
	if (prev_prog != preset.prog_num)
	{
		{
			// center the program name
			Window<WIN_WIDTH, NAME_HEIGHT> win(colBlack);
			set_large_font(FreeSansBold12pt7b);
			fv1_programs[preset.prog_num].copy_name(name);
			const Coord width = get_text_width_large(name);
			const Coord x_offset = width < win.Width ? (win.Width - width) / 2 : 0;
			print_large(win, name, x_offset, 0, colWhite);
			display.blit(win, VOLTAGE_BAR_WIDTH + WIN_OFFSET, 10);
		}

		// param names
		Window<HBAR_WIDTH, PARAM_NAME_HEIGHT> win(colBlack);
		set_large_font(FreeSans9pt7b);
		Coord y_offset = HBAR_YOFFSET + 3;
		for (uint8_t pot = 0; pot < 3; pot++)
		{
			fill(win, colBlack);
			fv1_programs[preset.prog_num].copy_param_name(name, pot);
			if (*name)
				print_large(win, name, 0, 0, colWhite);
			display.blit(win, VOLTAGE_BAR_WIDTH + WIN_OFFSET, y_offset);

			y_offset += HBAR_ADVANCE;
		}

		// we only need to print this once
		static bool dry_wet_printed = false;
		if (!dry_wet_printed)
		{
			fill(win, colBlack);
			print_large(win, "dry/wet", 0, 0, colWhite);
			display.blit(win, VOLTAGE_BAR_WIDTH + WIN_OFFSET, y_offset + MIX_YOFFSET);

			dry_wet_printed = true;
		}

		prev_prog = preset.prog_num;
	}

	// load the saved preset to compare it with the current
	Preset saved_preset;
	saved_preset.load(preset.prog_num);

	for (uint8_t pot = 0; pot < 3; pot++)
	{
		if (fv1_programs[preset.prog_num].is_param_used(pot))
			pot_progbars[pot].draw(display, preset.pots[pot], saved_preset.pots[pot] == preset.pots[pot] ? colWhite : colRed);
		else
			pot_progbars[pot].draw(display, 0, colBlack);
	}

	mix_progbar.draw(display, preset.mix, saved_preset.mix == preset.mix ? colWhite : colRed);

	const auto diff = Watch::now() - start;
	if (diff)
		dprint("%i %i\n", diff, Watch::ticks2ms(diff));
}

void App::draw_ftsw_pedal(const Coord x, const Coord y)
{
	// frame
	vline(display, x +   0, y +  2,  38, colWhite);
	hline(display, x +   2, y +  0, 118, colWhite);
	vline(display, x + 120, y +  2,  38, colWhite);
	hline(display, x +   2, y + 40, 118, colWhite);

	// buttons & leds
	auto draw_button = [&](const Coord xb, const Coord yb) {
			draw_pixel(display, xb + 2, yb - 4, colWhite);

			vline(display, xb + 0, yb + 1, 4, colWhite);
			hline(display, xb + 1, yb + 0, 4, colWhite);
			vline(display, xb + 5, yb + 1, 4, colWhite);
			hline(display, xb + 1, yb + 5, 4, colWhite);
		};

	draw_button(x + 18, y + 18);
	draw_button(x + 42, y + 18);
	draw_button(x + 72, y + 18);
	draw_button(x + 96, y + 18);

	// display
	vline(display, x + 54, y + 14,  8, colWhite);
	hline(display, x + 54, y + 14, 12, colWhite);
	vline(display, x + 66, y + 14,  8, colWhite);
	hline(display, x + 54, y + 21, 12, colWhite);
}

void App::draw_exp_pedal(const Coord x, const Coord y)
{
	// The Expression Pedal

	// base
	draw_line(display, x +  0, y + 32, x +  4, y + 18, colWhite);
	draw_line(display, x +  4, y + 18, x + 76, y + 24, colWhite);
	draw_line(display, x + 76, y + 24, x + 80, y + 32, colWhite);
	draw_line(display, x +  0, y + 32, x + 80, y + 32, colWhite);

	// line between pedal and base
	draw_line(display, x + 26, y + 12, x + 26, y + 20, colWhite);
	
	// pedal
	draw_line(display, x + 76, y + 24, x + 12, y +  8, colWhite);
	draw_line(display, x + 12, y +  8, x + 16, y +  0, colWhite);
	draw_line(display, x + 16, y +  0, x + 80, y + 12, colWhite);
	draw_line(display, x + 80, y + 12, x + 76, y + 24, colWhite);

	// feet
	draw_line(display, x +  6, y + 33, x +  6, y + 37, colWhite);
	draw_line(display, x +  6, y + 37, x + 16, y + 37, colWhite);
	draw_line(display, x + 16, y + 37, x + 16, y + 33, colWhite);

	draw_line(display, x + 64, y + 33, x + 64, y + 37, colWhite);
	draw_line(display, x + 64, y + 37, x + 74, y + 37, colWhite);
	draw_line(display, x + 74, y + 37, x + 74, y + 33, colWhite);
}