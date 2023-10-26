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

	set_large_font(FreeMono12pt7b);

	//ts.init();

	adc.set_muxpos(0, ADC_MUXPOS_AIN7_gc, 0);
	adc.set_muxpos(1, ADC_MUXPOS_AIN10_gc, 32);
	adc.set_muxpos(2, ADC_MUXPOS_AIN11_gc, 32);
	adc.set_muxpos(3, ADC_MUXPOS_AIN12_gc, 32);
	adc.set_muxpos(4, ADC_MUXPOS_AIN13_gc, 32);

	Preset::dump_eeprom_presets();

	refresh_display(fv1.get_active_preset());
}

void App::poll()
{
	Preset current_preset = fv1.get_active_preset();

	if (adc.has_fresh_set())
	{
		// convert ADC result to voltage
		battery_voltage = adc.results[0] / 1796.721311;

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
			new_prog_num = num_fv1_programs - 1;
		if (new_prog_num >= num_fv1_programs)
			new_prog_num = 0;

		// load the preset if it changed
		if (current_preset.prog_num != new_prog_num)
			current_preset.load(new_prog_num);
	}

	if (fv1.set_preset(current_preset))
	{
		dprint("prog=%u P0=%u P1=%u P2=%u mix=%u\n",
				current_preset.prog_num,
				current_preset.pots[0],
				current_preset.pots[1],
				current_preset.pots[2],
				current_preset.mix);

		refresh_display(current_preset);
	}

	refresh_voltage();
}

void App::refresh_voltage()
{
	static uint16_t prev_refresh = 0;
	if (Watch::has_ms_passed_since(2000, prev_refresh))
	{
		// the voltage bar
		static uint16_t prev_charge = 0;
		uint16_t curr_charge = 0;
		const double MIN_VOLTAGE = 3.2 * 6;
		if (battery_voltage > MIN_VOLTAGE)
		{
			curr_charge = static_cast<uint16_t>((battery_voltage - MIN_VOLTAGE) * 40);
			if (curr_charge > Display::Height)
				curr_charge = Display::Height;
		}

		if (curr_charge != prev_charge)
		{
			fill_rect(display, 0, 0, 3, Display::Height - curr_charge, colBlack);
			fill_rect(display, 0, Display::Height - curr_charge, 3, curr_charge, colGreen);
			prev_charge = curr_charge;
			dprint("V=%f c=%i\n", battery_voltage, curr_charge);
		}

		prev_refresh = Watch::now();
	}
}

void App::refresh_display(const Preset& preset)
{
	char buff[10];
	sprintf(buff, "pRG=%i", preset.prog_num);
	Window<80, 20> win(colRed);
	print_large(win, buff, 0, 0, colWhite);
	display.blit(win, 4, 0);
}
