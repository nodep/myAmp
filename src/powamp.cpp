#include <stdio.h>

#include <avr/io.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "powamp.h"

void powamp_init()
{
	pa_fault::dir_in();
	pa_otw_clip::dir_in();

	// hold the power amp in reset and keep it muted
	pa_reset::low();
	pa_mute::high();

	pa_reset::dir_out();
	pa_mute::dir_out();
}

void powamp_poll()
{
	static enum: uint8_t {bs_reset, bs_muted, bs_on} boot_sequence = bs_reset;
	static uint16_t started = Watch::now();

	// bring the power amp out of reset
	if (boot_sequence == bs_reset  &&  Watch::has_ms_passed_since(300, started))
	{
		pa_reset::high();
		boot_sequence = bs_muted;
	}

	// unmute
	if (boot_sequence == bs_muted  &&  Watch::has_ms_passed_since(600, started))
	{
		pa_mute::low();
		boot_sequence = bs_on;
	}
}
