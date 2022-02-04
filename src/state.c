#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <avr/io.h>

#include "hw_setup.h"
#include "timer.h"
#include "leds.h"
#include "rotenc.h"
#include "state.h"
#include "avrdbg.h"

static uint16_t led_change		= 0;
static uint8_t  release_ok		= 0;
static bool		is_normal		= true;
static bool		should_reset	= false;
static bool		btn_down_prev	= false;
static uint16_t btn_change		= 0;

void state_poll(const uint16_t now)
{
	const uint16_t btn_dur = now - btn_change;
	const bool btn_down = rotenc_switch();

	if (btn_down_prev != btn_down)
	{
		// button released?
		if (btn_down_prev)
		{
			if (btn_dur > MS2TICKS(2000)  &&  !is_normal)
			{
				should_reset = true;
			}
			else if (btn_dur > MS2TICKS(50))
			{
				if (release_ok)
					is_normal = !is_normal;
				
				release_ok = !release_ok;
			}
		}

		btn_down_prev = btn_down;
		btn_change = now;
	}

	if (is_normal)
	{
		led_show_rotenc(false, false);
	}
	else if (now - led_change > MS2TICKS(200))
	{
		static bool ledon = false;

		led_show_rotenc(ledon, ledon);
		
		ledon = !ledon;

		led_change = now;
	}
}

bool state_is_normal(void)
{
	return is_normal;
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
