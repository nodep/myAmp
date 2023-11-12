#pragma once

#include <avr/pgmspace.h>

struct ProgParams
{
	uint8_t		mix = 0x80;
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

	uint16_t get_binary_length() const
	{
		return pgm_read_word(&binary_length);
	}

	const uint8_t* get_binary() const
	{
		return (const uint8_t*)pgm_read_ptr(&binary);
	}

	void copy_name(char* buff) const
	{
		const char* name_ptr = (const char*)(pgm_read_word(&name));
		strcpy_P(buff, name_ptr);
	}

	bool is_param_used(const uint8_t pot) const
	{
		const char* name_ptr = (const char*)(pgm_read_word(&pot_names[pot]));
		return name_ptr != nullptr;		
	}

	void copy_param_name(char* buff, const uint8_t pot) const
	{
		const char* name_ptr = (const char*)(pgm_read_word(&pot_names[pot]));
		if (name_ptr != nullptr)
			strcpy_P(buff, name_ptr);
		else
			buff[0] = '\0';
	}
};

#include "program_defs.h"
