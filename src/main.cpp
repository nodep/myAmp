#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <avr/eeprom.h>

#include "hw.h"
#include "avrdbg.h"
#include "watch.h"

#include "graph.h"
#include "graphtext.h"

#include "powamp.h"
#include "app.h"
#include "adc.h"
#include "rotenc.h"
#include "programs.h"

int main()
{
	init_hw();

	App app;

	while (true)
	{
		app.poll();

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
	}
}