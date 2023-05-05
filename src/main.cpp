#include <stdio.h>
#include <stdlib.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "watch.h"

#include "graph.h"
#include "graphtext.h"

#include "powamp.h"
#include "app.h"
#include "adc.h"
#include "rotenc.h"

int main()
{
	init_hw();

	//s_led::high();
	//ts.calibrate(d);

	App app;

	while (true)
	{
		//powamp_poll();
		auto prev_cnt = app.adc.mux_cnt;
		app.adc.poll();

		if (prev_cnt != app.adc.mux_cnt  &&  app.adc.mux_cnt == 0)
		{
			static uint16_t prev = 0;
			dprint("dur=%u ", Watch::now() - prev);
			//dprint("%u %u %u %u %u\n", app.adc.results[0], app.adc.results[1], app.adc.results[2], app.adc.results[3], app.adc.results[4]);
			double v = app.adc.results[0] * 24.4 / 43840.0;
			dprint(" v=%f\n", v);
			prev = Watch::now();
			prev_cnt = app.adc.mux_cnt;
		}

		static uint16_t num = 1;
		const PedalEvent event = app.pedals.get_event();
		if (event != evNone)
		{
			if (event == evFtswBtn1Down)
				num++;
			else if (event == evFtswBtn2Down)
				num--;
			else if (event == evFtswBtn3Down)
				num += 10;
			else if (event == evFtswBtn4Down)
				num -= 10;

			if (app.pedals.ftsw_present)
				app.pedals.set_ftsw_number(num);
		}

		//if (Watch::has_ms_passed_since(100, started))
		//{
		//	set_pots<dp_mix_i2c>(dp_mix_address, rdac, rdac);
		//	started = Watch::cnt();
		//}

		//refresh_screen();
		//_delay_ms(500);

		/*
		auto prev_cnt = Watch::cnt();
		while (Watch::has_ms_passed_since(500, prev_cnt))
			;
		fv1_t0::toggle();
		*/

		/*
		TS_Point p = ts.get_point();

		if (p.valid())
		{
			fill_rect(d, p.x, p.y, 3, 3, customRGB(rand() & 0x1f, rand() & 0x3f, rand() & 0x1f));
			//char buff[30];
			//sprintf(buff, "%i %i", p.x, p.y);
			//fill_rect(d, 100, 100, 100, 100, colBlack);
			//print_large(d, buff, 100, 100, colWhite);
		}
		*/
	}
}