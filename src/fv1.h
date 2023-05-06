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

	Preset	_active_preset;

public:

	FV1();

	Preset get_active_preset() const
	{
		return _active_preset;
	}

	template <int PotNum>
	bool update_pot(const Preset& new_preset)
	{
		bool changed = false;
		if (new_preset.pots[PotNum] != _active_preset.pots[PotNum])
		{
			fv1_pwm_timer::set_pwm_duty<PotNum>(new_preset.pots[PotNum]);
			_active_preset.pots[PotNum] = new_preset.pots[PotNum];
			changed = true;
		}

		return changed;
	}

	bool set_preset(const Preset& new_preset);
};
