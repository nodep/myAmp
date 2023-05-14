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
}

void App::poll()
{
	auto current_preset = fv1.get_active_preset();

	if (adc.has_fresh_set())
	{
		battery_voltage = adc.results[0] / 1796.721311;

		const int16_t pot0 = 0x1000 - (adc.results[1] >> 4);
		const int16_t pot1 = 0x1000 - (adc.results[2] >> 4);
		const int16_t pot2 = 0x1000 - (adc.results[3] >> 4);

		if (abs(pot0 - current_preset.pots[0]) > 2)
			current_preset.pots[0] = pot0;

		if (abs(pot1 - current_preset.pots[1]) > 2)
			current_preset.pots[1] = pot1;

		if (abs(pot2 - current_preset.pots[2]) > 2)
			current_preset.pots[2] = pot2;

		current_preset.mix = 0xff - (adc.results[4] >> 8);
	}

	const auto delta = rotenc.get_delta();
	if (delta)
	{
		int16_t new_prog_num = current_preset.prog_num + delta;
		if (new_prog_num < 0)
		{
		}
	}

	if (fv1.set_preset(current_preset))
	{
		dprint("P0=%u P1=%u P2=%u mix=%u\n", 	current_preset.pots[0],
												current_preset.pots[1],
												current_preset.pots[2],
												current_preset.mix);
	}
}