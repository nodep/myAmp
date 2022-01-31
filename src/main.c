#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/interrupt.h>

#include "hw_setup.h"
#include "avrdbg.h"
#include "utils.h"
#include "leds.h"
#include "rotenc.h"
#include "banks.h"

#define FV_FREQ(freq) (uint16_t)(((F_CPU/2)/(freq))-1)


// Set by program_refresh() and read by the I2C ISR.
// It is an offsets of the high byte of the FV-1 programs pointer (fv1Banks)
// to the correct byte based on the selected bank and program
uint8_t hiOffset = 0;

// implemented in assembly in i2c_eeprom.s
void sendProgram(void);

void timer_init(void)
{
	TCCR1A = 0x00;
	TCCR1B = _BV(CS10) | _BV(CS12);		// 1024 prescler
}

void i2c_init(void)
{
	// the i2c address of the EEPROM we are emulating
	TWAR = 0xA0;

	TWCR = _BV(TWEA)	// enable the ACK
		|  _BV(TWEN)	// enable TWI
		|  _BV(TWIE);	// enable interrupts
}

void init_fvclk(void)
{
	TCCR1A = _BV(COM1B0);	// output clock on B2
	TCCR1B = _BV(WGM12) |	// CTC
			 _BV(CS10);		// prescaler 1
			 
	SetBit(DDR(FV_CLK_PORT), FV_CLK_BIT);
	
	OCR1A = FV_FREQ(32768);
}

void init_hw(void)
{
	dbgInit();

	timer_init();

	led_init();

	rotenc_init();

	i2c_init();

	// FV-1 program selector
	SetBit(DDR(S0_PORT), S0_BIT);
	ClrBit(PORT(S0_PORT), S0_BIT);

	SetBit(DDR(S1_PORT), S1_BIT);
	ClrBit(PORT(S1_PORT), S1_BIT);

	SetBit(DDR(S2_PORT), S2_BIT);
	ClrBit(PORT(S2_PORT), S2_BIT);

	// internal/external selector
	SetBit(DDR(T0_PORT), T0_BIT);
	ClrBit(PORT(T0_PORT), T0_BIT);

	// clock for FV-1
	init_fvclk();

	// these are unused
	SetBit(DDR(WP_PORT), WP_BIT);
	ClrBit(PORT(WP_PORT), WP_BIT);

	SetBit(DDR(A0_PORT), A0_BIT);
	ClrBit(PORT(A0_PORT), A0_BIT);
}

void refresh_program(const int16_t delta)
{
    // rotPos encoding:
    // bits 0 and 1: intermediary positions on the rotary encoder
    // bits 2, 3 and 4: selected program
    // bits 5, 6 and 7: selected bank
    
	static int16_t rotPos = 0;
	const int16_t maxRotPos = (NUM_BANKS << 5) | 0b11111;

	rotPos += delta;
	if (rotPos > maxRotPos)
		rotPos -= maxRotPos;
	else if (rotPos < 0)
		rotPos += maxRotPos;

	static uint8_t prevProgram = 0xff;
	static uint8_t prevBank =    0xff;

	const uint8_t program = (rotPos >> 2) & 7;
	const uint8_t bank = 	(rotPos >> 5) & 7;

	if (program != prevProgram  ||  bank != prevBank)
	{
		led_show(program, bank);

		// get the current value of the PORTx register
		uint8_t sxPort = PORT(S0_PORT) & ~(_BV(S0_BIT) | _BV(S1_BIT) | _BV(S2_BIT) | _BV(T0_BIT));

		sxPort |= (program & 1) << 3;
		sxPort |= (program & 2) << 1;
		sxPort |= (program & 4) >> 1;

		// is this an external program?
		if (bank > 0)
        {
			hiOffset = program * 2 + (bank - 1) * 0x10;
			sxPort |= _BV(T0_BIT);
        }
		
		dprint("p=%i b=%i\n", program, bank);

		// return the value to the PORTx register
		PORT(S0_PORT) = sxPort;

		// wait for the transfer to complete before returning
		if (bank > 0)
			sendProgram();

		prevProgram = program;
		prevBank = bank;
	}
}

int main()
{
	init_hw();

	dprint("I live...\n");

	const uint16_t minChangeInterval = MS2TICKS(50);
	uint16_t prevChange = TCNT1 - minChangeInterval;

	refresh_program(0);		// init the program selector

	int16_t delta = 0;
    
	while (1)
	{
		delta += rotenc_delta();

		// if we have a delta and the program change timeout has passed
		if (delta != 0  &&  (TCNT1 - prevChange) >= minChangeInterval)
		{
			prevChange = TCNT1;

			refresh_program(delta);
			delta = 0;
		}
	}
}
