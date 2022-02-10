#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw_setup.h"
#include "avrdbg.h"
#include "utils.h"
#include "leds.h"
#include "rotenc.h"
#include "banks.h"
#include "timer.h"
#include "fvclk.h"
#include "sendprog.h"
#include "state.h"

void i2c_init(void)
{
	// the i2c address of the EEPROM we are emulating
	TWAR = 0xA0;

	TWCR = _BV(TWEA)	// enable the ACK
		|  _BV(TWEN);	// enable TWI
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

void program_change(const int16_t delta)
{
    // rotPos encoding:
    // bits 0 and 1: intermediary positions on the rotary encoder
    // bits 2 to 7: selected program
    
	static int16_t rotPos = 0;
	const int16_t maxRotPos = (((NUM_EXT_PROGRAMS + 8) - 1) << 2) | 0b11;

	rotPos += delta;
	if (rotPos > maxRotPos)
		rotPos -= maxRotPos;
	else if (rotPos < 0)
		rotPos += maxRotPos;

	static uint8_t prevProgram	= 0xff;

	const uint8_t program = (rotPos >> 2) & 0b111111;
	
	if (program != prevProgram)
	{
		// show the selected program
		led_show_program(program);

		// get the current value of the PORTx register
		uint8_t sxPort = PORT(S0_PORT) & ~(_BV(S0_BIT) | _BV(S1_BIT) | _BV(S2_BIT));

		// put the bits in their right order
		sxPort |= (program & 1) << 3;
		sxPort |= (program & 2) << 1;
		sxPort |= (program & 4) >> 1;

		dprint("prog %i\n", program);

		// set the values on output pins
		if (program < 8)
			ClrBit(PORT(T0_PORT), T0_BIT);
		else
			SetBit(PORT(T0_PORT), T0_BIT);

		PORT(S0_PORT) = sxPort;

		// send the program over I2C
		if (program > 7)
			send_program(&fv1programs[program - 8][0]);

		prevProgram = program;
	}
}

int main()
{
	init_hw();

	dprint("I live...\n");

	const uint16_t minChangeInterval = MS2TICKS(100);
	uint16_t prevChange = timer_ticks() - minChangeInterval;

	program_change(0);		// init the program selector

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
			if (state_is_selecting_prog())
				program_change(delta);
			else
				fvclk_change(delta);

			prevChange = now;
			delta = 0;
		}
	}
}
