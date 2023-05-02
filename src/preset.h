#pragma once

struct Preset
{
	bool		is_extern	= false;
	uint8_t		prog_num	= 0;
	uint16_t	mix			= 0x80;
	uint16_t	pot1		= 0x800;
	uint16_t	pot2		= 0x800;
	uint16_t	pot3		= 0x800;
};

