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
#include "avrdbg.h"

static bool is_selecting_prog	= true;
static bool should_reset		= false;

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
	static bool		btn_down_prev	= false;
	static uint16_t btn_change		= 0;
	static bool 	first_short_ok	= false;

	const uint16_t btn_dur = now - btn_change;
	const bool btn_down = rotenc_switch();

	if (btn_down_prev != btn_down)
	{
		// button released?
		if (btn_down_prev)
		{
			if (btn_dur > MS2TICKS(50)  &&  btn_dur < MS2TICKS(1000))
			{
				if (first_short_ok)
					is_selecting_prog = !is_selecting_prog;
				
				first_short_ok = !first_short_ok;
			}
		}
		else	// button pressed
		{
			if (first_short_ok)
				first_short_ok = (btn_dur < MS2TICKS(1000));
		}

		btn_down_prev = btn_down;
		btn_change = now;
	}
	else if (btn_down  &&  btn_dur > MS2TICKS(1500)  &&  !is_selecting_prog)
	{
		should_reset = true;
	}
	
	state_rotenc_led_flash(now);
}

bool state_is_selecting_prog(void)
{
	return is_selecting_prog;
}

bool state_should_reset(void)
{
	if (should_reset)
	{
		should_reset = false;
		return true;
	}

	return false;
}
