#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <util/delay.h>

#include "powsup.h"
#include "avrdbg.h"
#include "hw_setup.h"
#include "utils.h"

void powsup_init(void)
{
	// setup the ADC to monitor the input power
	ADMUX = _BV(REFS0)		// reference is AVCC
			| _BV(ADLAR)	// we are only interested in the high
							// 8 bits of the 10 bit conversion result
			| 7;			// ADC channel 7

	ADCSRA = _BV(ADEN)		// enable ADC
			| _BV(ADPS1) | _BV(ADPS0);	// division 8
			
	// configure the pins to control the power amp
	SetBit(PORT(PS_MUTE_PORT), PS_MUTE_BIT);
	SetBit(DDR(PS_MUTE_PORT), PS_MUTE_BIT);
	
	ClrBit(PORT(PS_RESET_PORT), PS_RESET_BIT);
	SetBit(DDR(PS_RESET_PORT), PS_RESET_BIT);
}

void powsup_poll(void)
{
	static uint8_t prev = 0xff;

	// start a conversion
	SetBit(ADCSRA, ADSC);

	// wait for it to finish		
	while (ADCSRA & _BV(ADSC))
		;

	// read the result
	const uint8_t curr = ADCH;
	
	if (curr != prev)
	{
		dprint("%i\n", (int) curr);
		prev = curr;
	}
}
