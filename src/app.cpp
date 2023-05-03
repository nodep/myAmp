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
	fv1.init();

	display.init();
	fill(display, colBlack);

	ts.init();
}