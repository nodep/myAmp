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
	}
}