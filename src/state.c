#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <avr/io.h>

#include "hw_setup.h"
#include "timer.h"
#include "leds.h"
#include "rotenc.h"
#include "state.h"
#include "fvclk.h"
#include "powsup.h"
#include "avrdbg.h"

static bool is_selecting_prog	= true;
static bool should_reset_clock	= false;

static void state_rotenc_led_flash(const uint16_t now)
{
	static uint16_t led_change = 0;

	if (is_selecting_prog)
	{
		led_show_rotenc(false, false);
	}
	else
	{
		const uint16_t act_dur = now - led_change;
		const uint16_t flash_dur = ((FV_FREQ_MAX - fvclk_get_freq()) >> 4) + 100;
		
		if (act_dur > MS2TICKS(flash_dur))
		{
			static bool ledstate = true;

			led_show_rotenc(ledstate, !ledstate);
			
			ledstate = !ledstate;

			led_change = now;
		}
	}
}

void state_poll(const uint16_t now)
{
	const rotenc_button_event_e button_event = rotenc_poll_button_event();
	
	if (button_event == be_double)
	{
		is_selecting_prog = !is_selecting_prog;
	}
	else if (button_event == be_single)
	{
		should_reset_clock = true;
	}
	else if (button_event == be_long)
	{
		powsup_reset();
	}

	state_rotenc_led_flash(now);
}

bool state_is_selecting_prog(void)
{
	return is_selecting_prog;
}

bool state_should_reset_fvclk(void)
{
	if (should_reset_clock)
	{
		should_reset_clock = false;
		return true;
	}

	return false;
}
