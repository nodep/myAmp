#pragma once

#include "hw.h"
#include "digipot.h"
#include "preset.h"

class FV1
{
private:

	void send_program(uint8_t ext_prog_num);

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
