#pragma once

#include "programs.h"

struct Preset
{
	uint8_t		prog_num	= 0;
	uint16_t	mix			= 0x80;
	uint16_t	pots[3]		= { 0x800, 0x800, 0x800 };

	bool is_external() const
	{
		return fv1_programs[prog_num].is_external();
	}
};
