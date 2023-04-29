#include <stdio.h>

#include <avr/io.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "fv1.h"

void fv1_init()
{
	fv1_clip::dir_in();
	
	fv1_t0::dir_out();
	fv1_t0::low();

	fv1_s0::dir_out();
	fv1_s0::low();
	
	fv1_s1::dir_out();
	fv1_s1::low();
	
	fv1_s2::dir_out();
	fv1_s2::low();

	// init the PWM outputs on 
}
