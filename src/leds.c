#include <stdint.h>
#include <ctype.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw_setup.h"
#include "leds.h"
#include "utils.h"

void led_shift_byte(uint8_t byte)
{
	for (uint8_t bcnt = 0; bcnt < 8; ++bcnt)
	{
		if (byte & 0x80)
			SetBit(PORT(LED_DATA_PORT), LED_DATA_BIT);
		else
			ClrBit(PORT(LED_DATA_PORT), LED_DATA_BIT);

		SetBit(PORT(LED_CLOCK_PORT), LED_CLOCK_BIT);
		ClrBit(PORT(LED_CLOCK_PORT), LED_CLOCK_BIT);

		byte <<= 1;
	}
}

void led_show(const uint8_t program, const uint8_t bank)
{
	static uint8_t oldProgram = 0xff;
	static uint8_t oldBank = 0xff;
	if (program != oldProgram  ||  bank != oldBank)
	{
		led_shift_byte(bank);
		led_shift_byte(1 << program);
		
		oldProgram = program;
		oldBank = bank;
	}
}

void led_init(void)
{
	// clear the bits
	ClrBit(PORT(LED_CLOCK_PORT), LED_CLOCK_BIT);
	ClrBit(PORT(LED_DATA_PORT), LED_DATA_BIT);
	
	// the LED shift registers
	SetBit(DDR(LED_DATA_PORT), LED_DATA_BIT);
	SetBit(DDR(LED_CLOCK_PORT), LED_CLOCK_BIT);
	SetBit(DDR(LED_RST_PORT), LED_RST_BIT);

	led_clear();
}

void led_clear(void)
{
	// reset the LED shift registers
	ClrBit(PORT(LED_RST_PORT), LED_RST_BIT);
	_delay_ms(10);
	SetBit(PORT(LED_RST_PORT), LED_RST_BIT);
}
