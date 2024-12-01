#include <stdio.h>

#include <avr/io.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "fv1.h"
#include "digipot.h"
#include "rotenc.h"
#include "adc.h"
#include "programs.h"

FV1::FV1()
{
	fv1_clip::dir_in();
	
	fv1_t0::dir_out();
	fv1_t0::low();

	fv1_s0::dir_out();
	fv1_s1::dir_out();
	fv1_s2::dir_out();

	fv1_s0::low();
	fv1_s1::low();
	fv1_s2::low();

	dp_mix_sda::low();
	dp_mix_scl::low();
	dp_mix_i2c::init_master();

	// init the PWM outputs to simulate the input pots of FV-1
	fv1_p0::dir_out();
	fv1_p1::dir_out();
	fv1_p2::dir_out();

	fv1_pwm_timer::start();
	fv1_pwm_timer::set_period(0xfff);
	fv1_pwm_timer::enable_pwm<0>();
	fv1_pwm_timer::enable_pwm<1>();
	fv1_pwm_timer::enable_pwm<2>();

	fv1_pwm_timer::set_pwm_duty<0>(0x100);
	fv1_pwm_timer::set_pwm_duty<1>(0x800);
	fv1_pwm_timer::set_pwm_duty<2>(0x1000);

	fv1k_led::dir_out();

	fv1_i2c::init_slave(0xA0);
}

void FV1::send_program(uint8_t ext_prog_num)
{
	// TODO: handle bus errors

	// wait for the address, and the read
	uint8_t status = 0;
	do {
		status = fv1_i2c::wait_for(TWI_DIF_bm | TWI_APIF_bm);
		fv1_i2c::confirm();
		// when DIR is set we have to start sending the program
	} while ((status & TWI_DIR_bm) == 0);

	const uint16_t binary_length = fv1_programs[ext_prog_num].get_binary_length();
	const uint8_t* binary = fv1_programs[ext_prog_num].get_binary();

	// send the program from PROGMEM
	for (uint16_t cnt = 0; cnt < binary_length; cnt++)
	{
		status = fv1_i2c::wait_for(TWI_DIF_bm);
		fv1_i2c::send_byte(pgm_read_byte(binary++));
	}

	// send the trailing NOPs for the full 512 bytes of a FV-1 program
	for (uint16_t cnt = binary_length; cnt < 0x200; cnt++)
	{
		status = fv1_i2c::wait_for(TWI_DIF_bm);
		fv1_i2c::send_byte((cnt & 3) == 3 ? 0x11 : 0x00);
	}

	// wait for NACK
	status = fv1_i2c::wait_for(TWI_RXACK_bm);
	fv1_i2c::confirm();
}

bool FV1::set_preset(const Preset& new_preset)
{
	bool changed = false;

	changed |= update_pot<0>(new_preset);
	changed |= update_pot<1>(new_preset);
	changed |= update_pot<2>(new_preset);

	if (new_preset.mix != _active_preset.mix  ||  _first_init)
	{
		const uint8_t mix_val = 0xff - new_preset.mix;
		set_digipots<dp_mix_i2c>(dp_mix_address, mix_val, mix_val);
		_active_preset.mix = new_preset.mix;

		changed = true;
	}

	const bool new_external = fv1_programs[new_preset.prog_num].is_external();
	const bool current_external = fv1_programs[_active_preset.prog_num].is_external();
	if (new_external != current_external
		|| new_preset.prog_num != _active_preset.prog_num)
	{
		// are we switching to an external or ROM effect?
		if (new_external)
		{
			if (current_external)
				fv1_s0::toggle();
			else
				fv1_t0::set_value(new_external);

			send_program(new_preset.prog_num);
		}
		else
		{
			fv1_t0::low();

			// for ROM programs, binary_length contains the number of the program
			const uint16_t rom_program16 = fv1_programs[new_preset.prog_num].get_binary_length();
			const uint8_t rom_program = static_cast<uint8_t>(rom_program16);

			fv1_s0::set_value(rom_program & 1);
			fv1_s1::set_value(rom_program & 2);
			fv1_s2::set_value(rom_program & 4);
		}

		char buff[LONGEST_NAME];
		fv1_programs[new_preset.prog_num].copy_name(buff);
		dprint("loaded: %s\n", buff);

		changed = true;
	}

	if (changed)
		_active_preset = new_preset;

	_first_init = false;
	
	return changed;
}
