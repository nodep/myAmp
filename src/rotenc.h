#pragma once

#include <avr/pgmspace.h>

class RotEnc
{
private:
	uint8_t		oldAB = 0;
	uint8_t		delta_sum = 0;
	uint16_t	last_movement = 0;

public:
	bool is_stable()
	{
		const uint8_t AB = (fv1k_re_a::in() ? 0 : 2) | (fv1k_re_b::in() ? 0 : 1);
		return AB == 0;
	}

	int8_t get_delta()
	{
		const uint8_t newAB = (fv1k_re_a::in() ? 0 : 2) | (fv1k_re_b::in() ? 0 : 1);

		oldAB <<= 2;		// remember previous state
		oldAB |= newAB;		// add current state
		oldAB &= 0x0f;		// clear the extra bits
		
		static const int8_t lookup_table[0x10] PROGMEM =
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

		const int8_t lookup_val = pgm_read_byte(&lookup_table[oldAB]);
		delta_sum += lookup_val;

		const int8_t ret_val = delta_sum / 4;

		if (lookup_val)
			last_movement = Watch::now();

		if (ret_val)
			delta_sum -= ret_val * 4;
		else if (Watch::has_ms_passed_since(100, last_movement)  &&  delta_sum != 0)
			delta_sum = 0;

		return ret_val;
	}
};


void rotenc_init();
/*
int8_t rotenc_delta();
bool rotenc_button();
bool rotenc_is_stable();
*/
typedef enum
{
	be_none,
	be_single,
	be_double,
	be_long,
	be_long_short,
} rotenc_button_event_e;

rotenc_button_event_e rotenc_poll_button_event();
