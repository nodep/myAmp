#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include "timer.h"

void timer_init(void)
{
	TCCR0A = 0x00;
	TCCR0B = _BV(CS02) | _BV(CS00);		// 1024 prescler
}

uint16_t timer_ticks(void)
{
	static uint16_t overflowCnt = 0;

	uint8_t new_tcnt = TCNT0;

	// did we have an overflow?
	if (TIFR0 & _BV(TOV0))
	{
		// did the overflow happen between reading TCNT0
		// and checking for overflow (TIFR0)?
		if (TCNT0 == 0  &&  new_tcnt == 0xff)
			new_tcnt = 0;

		overflowCnt += 0x100;
		
		// clear TOV0
		TIFR0 |= _BV(TOV0);
	}

	return overflowCnt | new_tcnt;
}
