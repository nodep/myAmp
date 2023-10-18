#pragma once

#include "preset.h"

class FV1
{
private:

	void send_program(uint8_t ext_prog_num);

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

	Preset	_active_preset;

public:

	FV1();

	const Preset& get_active_preset() const
	{
		return _active_preset;
	}

	bool set_preset(const Preset& new_preset);
};
