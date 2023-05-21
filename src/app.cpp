#include <stdio.h>
#include <stdlib.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "app.h"
#include "adc.h"

App::App()
{
	display.init();
	fill(display, colBlack);

	ts.init();

	adc.set_muxpos(0, ADC_MUXPOS_AIN7_gc, 0);
	adc.set_muxpos(1, ADC_MUXPOS_AIN10_gc, 12);
	adc.set_muxpos(2, ADC_MUXPOS_AIN11_gc, 12);
	adc.set_muxpos(3, ADC_MUXPOS_AIN12_gc, 12);
	adc.set_muxpos(4, ADC_MUXPOS_AIN13_gc, 12);
}

void App::poll()
{
	auto current_preset = fv1.get_active_preset();

	if (adc.has_fresh_set())
	{
		battery_voltage = adc.results[0] / 1796.721311;

		if (adc.is_new[1])
			current_preset.pots[0] = 0x1000 - (adc.results[1] >> 4);

		if (adc.is_new[2])
			current_preset.pots[1] = 0x1000 - (adc.results[2] >> 4);

		if (adc.is_new[3])
			current_preset.pots[2] = 0x1000 - (adc.results[3] >> 4);

		if (adc.is_new[4])
			current_preset.mix = 0xff - (adc.results[4] >> 8);
	}

	const auto delta = rotenc.get_delta();
	if (delta)
	{
		int16_t new_prog_num = current_preset.prog_num + delta;
		if (new_prog_num < 0)
			new_prog_num = num_fv1_programs - 1;
		if (new_prog_num >= num_fv1_programs)
			new_prog_num = 0;

		current_preset.prog_num = new_prog_num;
	}

	if (fv1.set_preset(current_preset))
	{
		dprint("prog=%u P0=%u P1=%u P2=%u mix=%u\n",
				current_preset.prog_num,
				current_preset.pots[0],
				current_preset.pots[1],
				current_preset.pots[2],
				current_preset.mix);
	}
}