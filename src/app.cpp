#include <stdio.h>
#include <stdlib.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "app.h"

App::App()
{
	for (uint32_t ticks = 0; ticks < 120000; ticks += 5000)
	{
		auto ms = Watch::ticks2ms_long(ticks);
		auto ticks2 = Watch::ms2ticks_long(ms);
		dprint("%lu %lu %lu\n", ticks, ms, ticks2);
	}

	//for (uint16_t ms = 0; ms < 65000; ms += 500)
	//{
	//	auto ticks = Watch::ms2ticks_long(ms);
	//	auto ms2 = Watch::ticks2ms(ticks);
	//	dprint("%u %u %u\n", ms, ticks, ms2);
	//}

	while (true)
	{
		static int16_t sum = 0;
		const int16_t delta = rotenc.get_delta();
		if (delta != 0)
		{
			sum += delta;
			dprint("delta %i  sum=%i\n", delta, sum);
		}

		const auto ev = rotenc.get_button_event();
		if (ev != RotEnc::beNone)
		{
			dprint("ev %i\n", (int)ev);
		}
	}
	display.init();
	fill(display, colBlack);

	ts.init();
}