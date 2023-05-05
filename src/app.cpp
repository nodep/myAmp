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