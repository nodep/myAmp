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
#include "graphtext.h"

#include "app.h"

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
			{
				app.display.off();
				num++;
			}
			else if (event == evFtswBtn2Down)
			{
				app.display.on();
				num--;
			}
			else if (event == evFtswBtn3Down)
				num += 11;
			else if (event == evFtswBtn4Down)
				num -= 11;

			if (app.pedals.ftsw_present)
				app.pedals.set_ftsw_number(num);

			dprint("start...");
			print_large(app.display, "text", 20, 20, colWhite);
			dprint("end\n");
		}
	}
}