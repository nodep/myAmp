#include <stdint.h>

#include <avr/io.h>

#include "hw_setup.h"
#include "powsup.h"
#include "timer.h"
#include "avrdbg.h"
#include "leds.h"
#include "rotenc.h"
#include "utils.h"

enum powamp_state_e
{
	st_reset,		// the amp is in reset
	st_mute,		// the amp is muted
	st_running,		// the amp is working
	st_down,		// the amp has been shut down due to brownout
};

static uint8_t powamp_state = st_reset;
static uint16_t powamp_reset_started = 0;

void powsup_init(void)
{
	// setup the ADC to monitor the input power
	ADMUX = _BV(REFS0)		// reference is AVCC
			| 7;			// ADC channel 7

	ADCSRA = _BV(ADEN)		// enable ADC
			| _BV(ADPS2) /*| _BV(ADPS1) | _BV(ADPS0)*/;	// division 16
			
	// configure the pins that control the power amp
	SetBit(PORT(PS_MUTE_PORT), PS_MUTE_BIT);
	SetBit(DDR(PS_MUTE_PORT), PS_MUTE_BIT);
	
	ClrBit(PORT(PS_RESET_PORT), PS_RESET_BIT);
	SetBit(DDR(PS_RESET_PORT), PS_RESET_BIT);
	
	powamp_reset_started = timer_ticks();
}

uint16_t powsup_get_adc(void)
{
	// start a conversion
	SetBit(ADCSRA, ADSC);

	// wait for it to finish
	loop_until_bit_is_clear(ADCSRA, ADSC);

	// read the result
	return ADC;
}

#define MAX_DROP	10

static uint16_t powsup_brownout(void)
{
	static uint16_t maxADC = 0;
	static uint16_t prev_ticks = 0;
	const uint16_t curr_tick = timer_ticks();

	// we need to slowly decrease the max ADC point to account
	// for battery voltage dropping
	if ((prev_ticks & 0xC000) != (curr_tick & 0xC000)  &&  maxADC > 0)
		--maxADC;

	const uint16_t currADC = powsup_get_adc();

	if (powamp_state == st_running)
	{
		// new max?
		if (maxADC < currADC)
			maxADC = currADC;

		// do we have a drop over the allowed max?
		if (maxADC - currADC > MAX_DROP)
		{
			// mute
			SetBit(PORT(PS_MUTE_PORT), PS_MUTE_BIT);
			
			// reset
			ClrBit(PORT(PS_RESET_PORT), PS_RESET_BIT);
			
			powamp_state = st_down;
			
			dprint("down; max: %i curr: %i\n", maxADC, currADC);
		}
	}
	else if (powamp_state == st_down  &&  rotenc_button())
	{
		// back to running (for testing)
		powamp_state = st_running;

		// back from reset
		SetBit(PORT(PS_RESET_PORT), PS_RESET_BIT);

		// un-mute
		ClrBit(PORT(PS_MUTE_PORT), PS_MUTE_BIT);

		// reset the max
		maxADC = currADC;
		
		dprint("back up\n");
	}

	// blink during power down
	if (powamp_state == st_down)
		led_show_program(curr_tick >> 10);
	
	prev_ticks = curr_tick;
	
	return currADC;
}

#define WAIT_RESET	MS2TICKS(200)
#define WAIT_MUTE	MS2TICKS(100)

void powsup_poll(void)
{
	// gradually wake up the power amp to avoid pops
	if (powamp_state < st_running)
	{
		const uint16_t reset_dur = timer_ticks() - powamp_reset_started;

		// wake up the power amp from reset?
		if (powamp_state == st_reset  &&  reset_dur >= WAIT_RESET)
		{
			SetBit(PORT(PS_RESET_PORT), PS_RESET_BIT);
			powamp_state = st_mute;
			dprint("unreset\n");
		}

		// un-mute?
		if (powamp_state == st_mute  &&  reset_dur >= WAIT_MUTE)
		{
			ClrBit(PORT(PS_MUTE_PORT), PS_MUTE_BIT);
			powamp_state = st_running;
			dprint("unmute\n");
		}
	}

	const uint16_t currADC = powsup_brownout();

	// 25v 707
	// 24v 679
	// 23v 652
	// 22v 624
	// 21v 595
	// 20.4v 577
	static uint16_t started = 0;
	
	if (currADC < VOLTS2ADC(21.6))
	{
		if (started == 0)
			started = timer_ticks();
		else {
			//dprinti((started - timer_ticks()) & _BV(10));
			//led_flash(true, false);
		}
	
		if (currADC < VOLTS2ADC(20.4))
		{
		}
		else if (currADC < VOLTS2ADC(21))
		{
		}
		else
		{
		}
	}
}

void powsup_reset(void)
{
	powamp_state = st_reset;
	powamp_reset_started = timer_ticks();

	// mute
	SetBit(PORT(PS_MUTE_PORT), PS_MUTE_BIT);
	
	// reset
	ClrBit(PORT(PS_RESET_PORT), PS_RESET_BIT);

	dprint("reset started\n");
}
