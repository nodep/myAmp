#pragma once

#include <avr/pgmspace.h>

class RotEnc
{
private:

	uint8_t		oldAB = 0;
	uint8_t		delta_sum = 0;
	uint16_t	last_movement = 0;

	static uint8_t getAB()
	{
		return (fv1k_re_a::in() ? 0 : 2) | (fv1k_re_b::in() ? 0 : 1);
	}

	static bool is_stable()
	{
		return getAB() == 0;
	}

	bool get_button();
	
public:

	enum ButtonEvent: uint8_t 
	{
		beNone,
		beSingle,
		beDouble,
		beLong,
		beLongShort,
	};

	RotEnc();

	int8_t get_delta();

	ButtonEvent get_button_event();
};
