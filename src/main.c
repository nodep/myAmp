#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include "hw_setup.h"
#include "avrdbg.h"
#include "utils.h"
#include "leds.h"
#include "rotenc.h"
#include "banks.h"
#include "timer.h"
#include "fvclk.h"
#include "state.h"

// Set by program_refresh() and read by the I2C ISR.
// It is an offsets of the high byte of the FV-1 programs pointer (fv1Banks)
// to the correct byte based on the selected bank and program
uint8_t hiOffset = 0;

// implemented in assembly in i2c_eeprom.s
void sendProgram(void);

void i2c_init(void)
{
	// the i2c address of the EEPROM we are emulating
	TWAR = 0xA0;

	TWCR = _BV(TWEA)	// enable the ACK
		|  _BV(TWEN)	// enable TWI
		|  _BV(TWIE);	// enable interrupts
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
	fvclk_init();
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

	static uint8_t prevProgram	= 0xff;
	static uint8_t prevBank		= 0xff;

	const uint8_t program = (rotPos >> 2) & 7;
	const uint8_t bank = 	(rotPos >> 5) & 7;

	if (program != prevProgram  ||  bank != prevBank)
	{
		led_show_prog_bank(program, bank);

		// get the current value of the PORTx register
		uint8_t sxPort = PORT(S0_PORT) & ~(_BV(S0_BIT) | _BV(S1_BIT) | _BV(S2_BIT));

		// put the bits in their right order
		sxPort |= (program & 1) << 3;
		sxPort |= (program & 2) << 1;
		sxPort |= (program & 4) >> 1;

		// is this an external program?
		if (bank > 0)
			hiOffset = program * 2 + (bank - 1) * 0x10;

		dprint("p=%i b=%i\n", program, bank);

		// set the values on output pins
		if (bank == 0)
			ClrBit(PORT(T0_PORT), T0_BIT);
		else
			SetBit(PORT(T0_PORT), T0_BIT);

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

	const uint16_t minChangeInterval = MS2TICKS(100);
	uint16_t prevChange = timer_ticks() - minChangeInterval;

	refresh_program(0);		// init the program selector

	int16_t delta = 0;

	while (true)
	{
		delta += rotenc_delta();

		const uint16_t now = timer_ticks();

		state_poll(now);

		if (state_should_reset())
			fvclk_reset();
		
		// if we have a delta and the change timeout has passed
		if (delta != 0  &&  now - prevChange >= minChangeInterval)
		{
			if (state_is_normal())
				refresh_program(delta);
			else
				fvclk_change(delta);

			prevChange = now;
			delta = 0;
		}
	}
}
