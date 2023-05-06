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

		current_preset.pots[0] = 0x1000 - (adc.results[1] >> 4);
		current_preset.pots[1] = 0x1000 - (adc.results[2] >> 4);
		current_preset.pots[2] = 0x1000 - (adc.results[3] >> 4);

		current_preset.mix = 0xff - (adc.results[4] >> 8);
	}

	if (fv1.set_preset(current_preset))
	{
		dprint("P0=%u P1=%u P2=%u mix=%u\n", 	current_preset.pots[0],
												current_preset.pots[1],
												current_preset.pots[2],
												current_preset.mix);
	}
}