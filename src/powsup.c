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

static uint8_t  powamp_state = st_reset;
static uint16_t powamp_reset_started = 0;

void powsup_init(void)
{
	// setup the ADC to monitor the input power
	ADMUX = _BV(REFS0)		// reference is AVCC
			| 7;			// ADC channel 7

	ADCSRA = _BV(ADEN)		// enable ADC
			| _BV(ADPS2);	// division 16

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

// this function attempts to reset the power amp
// when it notices a drop in input power voltage
static void powsup_brownout(const uint16_t now)
{
	static uint16_t maxADC = 0;
	static uint16_t prev_ticks = 0;

	// we need to slowly decrease the max ADC point to account
	// for battery voltage dropping
	if ((prev_ticks & 0xC000) != (now & 0xC000)  &&  maxADC > 0)
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

			// start flashing
			led_flash_start(now, 0xff, 0, 0);

			dprint("down; max: %i curr: %i\n", maxADC, currADC);
		}
	}
	else if (powamp_state == st_down  &&  rotenc_button())
	{
		// back to reset then to running
		powsup_reset(now);

		// reset the max
		maxADC = currADC;

		dprint("back up\n");
	}

	prev_ticks = now;
}

#define WAIT_RESET	MS2TICKS(300)
#define WAIT_MUTE	MS2TICKS(500)

void powsup_poll(const uint16_t now)
{
	// gradually wake up the power amp to avoid pops
	if (powamp_state < st_running)
	{
		const uint16_t reset_dur = now - powamp_reset_started;

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

	powsup_brownout(now);
}

void powsup_reset(const uint16_t now)
{
	powamp_state = st_reset;
	powamp_reset_started = now;

	// mute
	SetBit(PORT(PS_MUTE_PORT), PS_MUTE_BIT);

	// reset
	ClrBit(PORT(PS_RESET_PORT), PS_RESET_BIT);

	dprint("reset started\n");
}
