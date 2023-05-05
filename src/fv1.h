#pragma once

#include "hw.h"
#include "fv1programs.h"
#include "digipot.h"

//void fv1_init();
//void fv1_poll();

struct Preset
{
	bool		is_extern	= false;
	uint8_t		prog_num	= 0;
	uint16_t	mix			= 0x80;
	uint16_t	pots[3]		= { 0x800, 0x800, 0x800 };
};

class FV1
{
private:

	void send_program(uint8_t ext_prog_num)
	{
		// toggle t0 if internal to external or toggle any of the
		// sx switches to trigger FV-1 to start reading the program
	}

	void set_sx_switches(uint8_t prog_num)
	{
		fv1_s0::set_value(prog_num & 1);
		fv1_s1::set_value(prog_num & 2);
		fv1_s2::set_value(prog_num & 4);
	}

public:

	Preset		active_preset;
	bool		is_unsaved = false;

	FV1();

	template <int PotNum>
	void update_pot(const Preset& new_preset)
	{
		if (new_preset.pots[PotNum] != active_preset.pots[PotNum])
		{
			fv1_pwm_timer::set_pwm_duty<PotNum>(new_preset.pots[PotNum]);
			is_unsaved = true;
			active_preset.pots[PotNum] = new_preset.pots[PotNum];
		}
	}

	void set_preset(const Preset& new_preset);
};
