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

uint8_t hiOffset = 0;

// implemented in assembly
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

	// these are unused
	SetBit(DDR(WP_PORT), WP_BIT);
	ClrBit(PORT(WP_PORT), WP_BIT);

	SetBit(DDR(A0_PORT), A0_BIT);
	ClrBit(PORT(A0_PORT), A0_BIT);
}

void refresh_program(const int16_t delta)
{
	static int16_t rot_pos = 0b11100;
	const int16_t max_rot_pos = 0x7f;

	rot_pos += delta;
	if (rot_pos > max_rot_pos)
		rot_pos -= max_rot_pos;
	else if (rot_pos < 0)
		rot_pos += max_rot_pos;

	static uint8_t prevProgram = 0xff;
	static uint8_t prevBank = 0xff;

	const uint8_t program = (rot_pos >> 2) & 7;
	const uint8_t bank = 	(rot_pos >> 5) & 3;

	if (program != prevProgram  ||  bank != prevBank)
	{
		led_show(program, bank);

		// get the current value of the PORTx register
		uint8_t sx_port = PORT(S0_PORT) & ~(_BV(S0_BIT) | _BV(S1_BIT) | _BV(S2_BIT) | _BV(T0_BIT));

		sx_port |= (program & 1) << 3;
		sx_port |= (program & 2) << 1;
		sx_port |= (program & 4) >> 1;

		// external
		if (bank > 0)
			sx_port |= _BV(T0_BIT);
		else
			hiOffset = program * 2 + (bank - 1) * 0x1000;

		// return the value to the PORTx register
		PORT(S0_PORT) = sx_port;

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

	int16_t delta = 0;

	const uint16_t min_change_interval = 1563;	// ~100ms
	uint16_t prev_change = TCNT1 - min_change_interval;

	refresh_program(0);		// init the program selector

	while (1)
	{
		delta += rotenc_delta();

		// if we have a delta and the program change timeout has passed
		if (delta != 0  &&  (TCNT1 - prev_change) >= min_change_interval)
		{
			prev_change = TCNT1;

			refresh_program(delta);
			delta = 0;
		}
	}
}
