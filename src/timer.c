#include <stdint.h>

#include <avr/io.h>

#include "timer.h"

static uint16_t wrap_around_counter = 0;

void timer_init(void)
{
	// We are using the hardware 8 bit timer (the 16 bit timer is busy with th FV-1 clock)
	// We are using the greatest prescaler (1024),
	// and are simulating a 16 bit counter with overflow catch
	
	// The timer is running at 11718.75Hz on a 12MHz quartz
	// The tick duration is 85.333 micro seconds
	// 16 bit counter wrap-around is every 5.592 seconds
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
		
		if (wrap_around_counter < 0xffff)
			++wrap_around_counter;
		
		// clear TOV0
		TIFR0 |= _BV(TOV0);
	}
	
	return overflowCnt | new_tcnt;
}

uint16_t timer_wrap_arounds(void)
{
	return wrap_around_counter;
}