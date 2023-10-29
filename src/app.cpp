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

enum UpdatedPart : uint8_t
{
	upPot0		= 0b00000001,
	upPot1		= 0b00000010,
	upPot2		= 0b00000100,
	upMix		= 0b00001000,
	upName		= 0b00010000,

	upAll		= 0b11111111,
};

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
	refresh_preset(preset, upAll);
}

void App::poll()
{
	Preset current_preset = fv1.get_active_preset();
	uint8_t updated = 0;

	if (adc.has_fresh_set())
	{
		// convert ADC result to voltage
		battery_voltage = adc.results[0] / ADC_VOLTAGE_FACTOR;

		if (adc.has_changed[1])
		{
			current_preset.pots[0] = 0x1000 - (adc.results[1] >> 4);
			updated |= upPot0;
		}

		if (adc.has_changed[2])
		{
			current_preset.pots[1] = 0x1000 - (adc.results[2] >> 4);
			updated |= upPot1;
		}

		if (adc.has_changed[3])
		{
			current_preset.pots[2] = 0x1000 - (adc.results[3] >> 4);
			updated |= upPot2;
		}

		if (adc.has_changed[4])
		{
			current_preset.mix = 0xff - (adc.results[4] >> 8);
			updated |= upMix;
		}
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
			updated |= upAll;
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

		refresh_preset(current_preset, updated);
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

void App::refresh_preset(const Preset& preset, uint8_t updated)
{
	constexpr uint16_t WIN_WIDTH = 298;
	constexpr uint16_t WIN_WIDTH_HALF = WIN_WIDTH / 2;
	constexpr uint16_t WIN_OFFSET = 10;
	constexpr uint16_t HBAR_WIDTH = WIN_WIDTH_HALF - 4;
	constexpr uint16_t NAME_HEIGHT = 24;
	constexpr uint16_t PARAM_NAME_HEIGHT = 18;
	constexpr uint16_t HBAR_HEIGHT = 21;
	constexpr uint16_t HBAR_ADVANCE = HBAR_HEIGHT + 8;
	constexpr uint16_t HBAR_YOFFSET = 50;
	constexpr uint16_t MIX_YOFFSET = 8;

	const auto start = Watch::now();

	if (updated)
	{
		draw_rect(display, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF, HBAR_YOFFSET, WIN_WIDTH / 2, HBAR_HEIGHT + 4, colRed);
		draw_rect(display, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF, HBAR_YOFFSET + HBAR_ADVANCE, WIN_WIDTH / 2, HBAR_HEIGHT + 4, colRed);
		draw_rect(display, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF, HBAR_YOFFSET + HBAR_ADVANCE*2, WIN_WIDTH / 2, HBAR_HEIGHT + 4, colRed);
		draw_rect(display, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF, HBAR_YOFFSET + HBAR_ADVANCE*3 + MIX_YOFFSET, WIN_WIDTH / 2, HBAR_HEIGHT + 4, colRed);
	}

	// names
	char buff[LONGEST_NAME];
	if (updated & upName)
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
	}

	Window<HBAR_WIDTH, HBAR_HEIGHT> win(colBlack);
	auto draw_pot = [&](const uint8_t pot, const Coord y_offset)
		{
			const Coord progress = static_cast<Coord>(preset.pots[pot] / (double(0x1000) / HBAR_WIDTH));
			hbar(win, WIN_WIDTH, win.Height, progress, colDarkGray);

			display.blit(win, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF + 2, y_offset + 2);
		};

	if (updated & upPot0)
		draw_pot(0, HBAR_YOFFSET);
	if (updated & upPot1)
		draw_pot(1, HBAR_YOFFSET + HBAR_ADVANCE);
	if (updated & upPot2)
		draw_pot(2, HBAR_YOFFSET + HBAR_ADVANCE*2);

	if (updated & upMix)
	{
		// dry/wet
		const Coord progress = static_cast<Coord>(preset.mix / (double(0x100) / HBAR_WIDTH));
		hbar(win, WIN_WIDTH, win.Height, progress, colDarkGray);

		display.blit(win, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF + 2, HBAR_YOFFSET + HBAR_ADVANCE*3 + MIX_YOFFSET + 2);
	}

	const auto diff = Watch::now() - start;
	if (diff)
		dprint("%i %i\n", diff, Watch::ticks2ms(diff));
}