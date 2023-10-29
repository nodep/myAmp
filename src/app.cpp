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

	adc.set_muxpos(0, ADC_MUXPOS_AIN7_gc, 0);
	adc.set_muxpos(1, ADC_MUXPOS_AIN10_gc, 32);
	adc.set_muxpos(2, ADC_MUXPOS_AIN11_gc, 32);
	adc.set_muxpos(3, ADC_MUXPOS_AIN12_gc, 32);
	adc.set_muxpos(4, ADC_MUXPOS_AIN13_gc, 32);

	Preset::dump_eeprom_presets();

	//hline(display, 0, 0, 320, colRed);
	//set_large_font(FreeSansBold9pt7b);		print_large(display, "P",  5, 0, colYellow);
	//set_large_font(FreeSansBold12pt7b);		print_large(display, "P", 20, 0, colYellow);
	//set_large_font(FreeSansBold18pt7b);		print_large(display, "P", 37, 0, colYellow);
	//set_large_font(FreeSansBold24pt7b);		print_large(display, "P", 55, 0, colYellow);
	//while (1);

	// wait until the ADC stabilizes
	for (int8_t i = 0; i < 10; i++)
	{
		while (!adc.has_fresh_set())
			;
	}

	// load the active preset
	Preset preset;
	preset.load(Preset::get_active_prog());
	fv1.set_preset(preset);
	refresh_preset();
}

void App::poll()
{
	Preset current_preset = fv1.get_active_preset();

	if (adc.has_fresh_set())
	{
		// convert ADC result to voltage
		battery_voltage = adc.results[0] / ADC_VOLTAGE_FACTOR;

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
			Preset::save_active_prog(new_prog_num);
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

	refresh_voltage();
}

void App::refresh_voltage()
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
		if (curr_charge != prev_charge)
		{
			vbar(display, Display::Height, VOLTAGE_BAR_WIDTH, curr_charge, colGreen);
			prev_charge = curr_charge;
			//dprint("V=%f c=%i\n", battery_voltage, curr_charge);
		}

		prev_refresh = Watch::now();
	}
}

void App::refresh_preset()
{
	const auto start = Watch::now();
	static uint8_t prev_prog = 0xff;

	const Preset& preset = fv1.get_active_preset();

	// names
	char buff[LONGEST_NAME];
	if (prev_prog != preset.prog_num)
	{
		{
			Window<WIN_WIDTH, NAME_HEIGHT> win(colBlack);
			set_large_font(FreeSansBold12pt7b);
			fv1_programs[preset.prog_num].copy_name(buff);
			const uint16_t width = get_text_width_large(buff);
			const uint16_t x_offset = width < win.Width ? (win.Width - width) / 2 : 0;
			print_large(win, buff, x_offset, 0, colWhite);
			display.blit(win, VOLTAGE_BAR_WIDTH + WIN_OFFSET, 10);
		}

		// param names
		{
			Window<HBAR_WIDTH, PARAM_NAME_HEIGHT> win(colBlack);
			set_large_font(FreeSans9pt7b);
			Coord y_offset = HBAR_YOFFSET + 3;
			for (uint8_t pot = 0; pot < 3; pot++)
			{
				fill(win, colBlack);
				fv1_programs[preset.prog_num].copy_param_name(buff, pot);
				if (*buff)
					print_large(win, buff, 0, 0, colWhite);
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
		}

		prev_prog = preset.prog_num;
	}

	// load the saved preset to compare it with the current
	Preset saved_preset;
	saved_preset.load(preset.prog_num);

	constexpr Coord pbar_x0 = VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF + 2;
	Coord y_offset = HBAR_YOFFSET + 2;
	for (uint8_t pot = 0; pot < 3; pot++)
	{
		if (fv1_programs[preset.prog_num].is_param_used(pot))
			pot_progbars[pot].draw(display, pbar_x0, y_offset, preset.pots[pot], colGreen, saved_preset.pots[pot] == preset.pots[pot] ? colWhite : colRed);
		else
			pot_progbars[pot].draw(display, pbar_x0, y_offset, 0, colGreen, colBlack);

		y_offset += HBAR_ADVANCE;
	}

	mix_progbar.draw(display, pbar_x0, HBAR_YOFFSET + HBAR_ADVANCE*3 + MIX_YOFFSET + 2, preset.mix, colYellow, saved_preset.mix == preset.mix ? colWhite : colRed);

	const auto diff = Watch::now() - start;
	if (diff)
		dprint("%i %i\n", diff, Watch::ticks2ms(diff));
}