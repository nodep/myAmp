#pragma once

#include <avr/pgmspace.h>

struct fv1_program
{
	char*		name;		// in progmem
	uint8_t*	binary;		// in progmem
	uint8_t		num_instructions;
};

const uint8_t fv1_num_programs = 10;
extern const fv1_program fv1_programs[fv1_num_programs] PROGMEM;
