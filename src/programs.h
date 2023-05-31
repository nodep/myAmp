#pragma once

#include <avr/pgmspace.h>

struct ProgParams
{
	uint8_t		mix = 0xff;
	uint16_t	pots[3] = { 0x800, 0x800, 0x800 };
};

struct Program
{
	const char*			name = nullptr;
	const char*			pot_names[3] = { nullptr, nullptr, nullptr };
	const ProgParams*	params = nullptr;
	const uint16_t		binary_length = 0;
	const uint8_t*		binary = nullptr;

	bool is_external() const
	{
		const uint8_t* bin_ptr = (const uint8_t*)(pgm_read_word(&binary));
		return bin_ptr != nullptr;
	}
};

extern const uint8_t num_fv1_programs;
extern const Program fv1_programs[] PROGMEM;
