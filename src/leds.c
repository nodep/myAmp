#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/pgmspace.h>

#include "hw_setup.h"
#include "leds.h"
#include "utils.h"

// the current states of the LEDs
static uint8_t program_leds = 0;
static uint8_t rotenc_leds = 0;

void led_init(void)
{
	// setup the SPI to communicate with the external shift register
	SetBit(DDR(LED_DATA_PORT), LED_DATA_BIT);
	SetBit(DDR(LED_CLOCK_PORT), LED_CLOCK_BIT);
	SetBit(DDR(LED_RST_PORT), LED_RST_BIT);
	SetBit(DDR(FV_CLK_PORT), FV_CLK_BIT);	// SS must be output
	
	SPCR = _BV(SPE) | _BV(MSTR);

	led_clear();
}

void led_shift_byte(uint8_t byte)
{
	SPDR = byte;
	while (!(SPSR & _BV(SPIF)))
		;
}

void led_clear(void)
{
	// reset the LED shift registers
	ClrBit(PORT(LED_RST_PORT), LED_RST_BIT);
	
	// set the local copies to 0
	program_leds = 0;
	rotenc_leds = 0;
	
	// raise the reset signal
	SetBit(PORT(LED_RST_PORT), LED_RST_BIT);
}

// RO		0b00000001
// RB		0b00000010
//
// 0 1		0b00000100
// 0 0
// 0 0
//
// 1 0		0b00001000
// 0 0
// 0 0
//
// 0 0		0b00010000
// 0 1
// 0 0
//
// 0 0		0b00100000
// 1 0
// 0 0
//
// 0 0		0b01000000
// 0 0
// 0 1
//
// 0 0		0b10000000
// 0 0
// 1 0

const uint8_t prog_lo_leds_lookup[8] PROGMEM =
{
	0b00000000,	// 0
	0b10000000,	// 1
	0b00100000,	// 2
	0b10100000,	// 3
	0b00001000,	// 4
	0b10001000,	// 5
	0b00101000,	// 6
	0b10101000,	// 7
};

const uint8_t prog_hi_leds_lookup[8] PROGMEM =
{
	0b00000000,	// 0
	0b01000000,	// 1
	0b00010000,	// 2
	0b01010000,	// 3
	0b00000100,	// 4
	0b01000100,	// 5
	0b00010100,	// 6
	0b01010100,	// 7
};

void led_show_program(const uint8_t program)
{
	const uint8_t new_val = pgm_read_byte(&prog_lo_leds_lookup[program & 7]) |
							pgm_read_byte(&prog_hi_leds_lookup[(program >> 3) & 7]);

	if (new_val != program_leds)
	{
		led_shift_byte(new_val | rotenc_leds);
		program_leds = new_val;
	}
}

void led_show_rotenc(const bool green, const bool blue)
{
	const uint8_t new_val = (green ? _BV(0) : 0) |
							(blue ? _BV(1) : 0);
	
	if (new_val != rotenc_leds)
	{
		led_shift_byte(program_leds | new_val);
		rotenc_leds = new_val;
	}
}