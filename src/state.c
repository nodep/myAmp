#include <stdint.h>
#include <stdbool.h>

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

void state_poll(const uint16_t now)
{
	const rotenc_button_event_e button_event = rotenc_poll_button_event();
	
	if (button_event == be_double)
	{
		if (is_selecting_prog)
		{
			led_flash_start(now, 3, 2, 0);
			is_selecting_prog = false;
		}
		else
		{
			led_flash_stop();
			is_selecting_prog = true;
		}
	}
	else if (button_event == be_single)
	{
		if (!is_selecting_prog)
			should_reset_clock = true;
	}
	else if (button_event == be_long)
	{
		powsup_reset();
	}
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
