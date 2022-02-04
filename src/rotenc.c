#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw_setup.h"
#include "utils.h"

void rotenc_init(void)
{
	// switch as input with pull-up
	ClrBit(DDR(ROT_SW_PORT), ROT_SW_BIT);
	SetBit(PORT(ROT_SW_PORT), ROT_SW_BIT);
	
	// A and B are inputs with pull-ups
	ClrBit(DDR(ROT_A_PORT), ROT_A_BIT);
	SetBit(PORT(ROT_A_PORT), ROT_A_BIT);
	ClrBit(DDR(ROT_B_PORT), ROT_B_BIT);
	SetBit(PORT(ROT_B_PORT), ROT_B_BIT);
}

const int8_t lookup_table[0x10] PROGMEM =
{
   0,	// 0b0000
  -1,	// 0b0001
   1,	// 0b0010
   0,	// 0b0011
   1,	// 0b0100
   0,	// 0b0101
   0,	// 0b0110
  -1,	// 0b0111
  -1,	// 0b1000
   0,	// 0b1001
   0,	// 0b1010
   1,	// 0b1011
   0,	// 0b1100
   1,	// 0b1101
  -1,	// 0b1110
   0,	// 0b1111
};	

int8_t rotenc_delta(void)
{
	static uint8_t oldAB = 0;

	const uint8_t newAB = ((PIN(ROT_A_PORT) & _BV(ROT_A_BIT)) ? 0 : 2)
						| ((PIN(ROT_B_PORT) & _BV(ROT_B_BIT)) ? 0 : 1);

	oldAB <<= 2;		// remember previous state
	oldAB |= newAB;		// add current state
	oldAB &= 0x0f;		// clear the extra bits

	return pgm_read_byte(&lookup_table[oldAB]);
}

bool rotenc_switch(void)
{
	return !(PIN(ROT_SW_PORT) & _BV(ROT_SW_BIT));
}
