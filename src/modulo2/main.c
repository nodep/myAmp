#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>
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
#include "event_handler.h"
#include "powsup.h"

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

	// initialize ADC on channel 7
	powsup_init();
}

void program_change(const int16_t delta)
{
	// rotenc_pos encoding:
	// bits 0 and 1: intermediary positions on the rotary encoder
	// bits 2 to 7: selected program

	static int16_t rotenc_pos = 2;
	static uint8_t prev_program = 0xff;

	// initialize rotenc_pos from internal MCU EEPROM on first run
	uint8_t* eeaadr = (uint8_t*)0;
	if (prev_program == 0xff)
	{
		const uint8_t saved = eeprom_read_byte(eeaadr);

		if (saved < NUM_EXT_PROGRAMS + 8)
			rotenc_pos = (saved << 2) | 2;

		dprint("saved:%i selected:%i\n", saved, (rotenc_pos >> 2));
	}

	const int16_t rotenc_pos_max = (((NUM_EXT_PROGRAMS + 8) - 1) << 2) | 0b11;

	rotenc_pos += delta;
	if (rotenc_pos > rotenc_pos_max)
		rotenc_pos -= rotenc_pos_max;
	else if (rotenc_pos < 0)
		rotenc_pos += rotenc_pos_max;

	const uint8_t program = (rotenc_pos >> 2);

	if (program != prev_program)
	{
		dprint("prog:%u\n", program);

		// show the selected program
		led_show_program(program);

		// get the current value of the PORTx register
		uint8_t sxPort = PORT(S0_PORT)
							& ~(_BV(S0_BIT) | _BV(S1_BIT) | _BV(S2_BIT) | _BV(T0_BIT));

		// put the bits in their right order
		sxPort |= (program & 1) << 3;
		sxPort |= (program & 2) << 1;
		sxPort |= (program & 4) >> 1;
		sxPort |= (program > 7) ? 1 : 0;

		// set the values on output pins
		PORT(S0_PORT) = sxPort;

		// send the program over I2C
		if (program > 7)
			send_program(program - 8);

		prev_program = program;

		// only save program after we have been running for a while
		// to avoid overwriting the value while the power fluctuates
		// and the MCU is restarted during brownout
		if (timer_ticks_high())
		{
			// save selected program to internal MCU EEPROM
			eeprom_update_byte(eeaadr, program);
		}
	}
	else if (rotenc_is_stable())
	{
		// recenter the rotenc position
		rotenc_pos = (rotenc_pos & 0b11111100) | 2;
	}
}

int main()
{
	init_hw();

	dprint("i live...\n");

	const uint16_t min_change_interval = MS2TICKS(100);
	uint16_t prev_change = timer_ticks() - min_change_interval;

	program_change(0);		// init the program selector

	int16_t delta = 0;

	while (true)
	{
		delta += rotenc_delta();

		const uint16_t now = timer_ticks();

		powsup_poll(now);

		event_poll(now);

		led_poll(now);

		if (event_should_reset_fvclk())
			fvclk_reset();

		// if we have a delta and the change timeout has passed
		if (delta != 0  &&  now - prev_change >= min_change_interval)
		{
			if (event_is_selecting_prog())
				program_change(delta);
			else
				fvclk_change(delta);

			prev_change = now;
			delta = 0;
		}
	}
}
