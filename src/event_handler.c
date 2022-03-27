#include <stdint.h>
#include <stdbool.h>

#include "hw_setup.h"
#include "timer.h"
#include "leds.h"
#include "rotenc.h"
#include "fvclk.h"
#include "powsup.h"
#include "avrdbg.h"
#include "event_handler.h"

static bool is_selecting_prog	= true;
static bool should_reset_clock	= false;

void event_poll(const uint16_t now)
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
		if (is_selecting_prog)
		{
			// show voltage
			const uint16_t currADC = powsup_get_adc();
			uint8_t leds;
			if (VOLTS2ADC(3.3 * 6) > currADC)
				leds = 0b10000000;
			else if (VOLTS2ADC(3.5 * 6) > currADC)
				leds = 0b10100000;
			else if (VOLTS2ADC(3.7 * 6) > currADC)
				leds = 0b10101000;
			else if (VOLTS2ADC(3.9 * 6) > currADC)
				leds = 0b11101000;
			else if (VOLTS2ADC(4.1 * 6) > currADC)
				leds = 0b11111000;
			else
				leds = 0b11111100;

			led_show_with_timeout(now, leds, MS2TICKS(1000));

			dprint("adc:%u\n", currADC);
		}
		else
		{
			should_reset_clock = true;
		}
	}
	else if (button_event == be_long)
	{
		powsup_reset();
	}
	else if (!led_is_flashing()  &&  !led_is_showing_with_timeout())
	{
		static uint16_t last_flash = 0;
		
		const uint16_t currADC = powsup_get_adc();
		const uint16_t now_high = timer_ticks_high();
		const uint16_t since_last_flash = now_high - last_flash;
		
		uint8_t flash_repeats = 0;

		if (VOLTS2ADC(3.3 * 6) > currADC  &&  since_last_flash > 0)
			flash_repeats = 8;
		else if (VOLTS2ADC(3.4 * 6) > currADC  &&  since_last_flash > 1)
			flash_repeats = 6;
		else if (VOLTS2ADC(3.5 * 6) > currADC  &&  since_last_flash > 2)
			flash_repeats = 4;
		else if (VOLTS2ADC(3.6 * 6) > currADC  &&  since_last_flash > 3)
			flash_repeats = 2;

		if (flash_repeats)
		{
			dprint("n:%u l:%u\n", now_high, last_flash);
			
			led_flash_start(now, 0xff, 3, flash_repeats);
		
			last_flash = now_high;
		}
	}
}

bool event_is_selecting_prog(void)
{
	return is_selecting_prog;
}

bool event_should_reset_fvclk(void)
{
	if (should_reset_clock)
	{
		should_reset_clock = false;
		return true;
	}

	return false;
}
