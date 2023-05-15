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

	// init the PWM outputs
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
	const uint16_t binary_length = pgm_read_word(&fv1_programs[ext_prog_num].binary_length);

	// wait for the EEPROM address
	fv1_i2c::wait_addr();

	// wait for the address in EEPROM
	fv1_i2c::wait_byte();
	fv1_i2c::wait_byte();

	// wait for the EEPROM address (read)
	fv1_i2c::wait_addr();

	loop_until_bit_is_set(TWI1.SSTATUS, TWI_DIF_bp);
	
	// send the program
	const uint8_t* binary = (const uint8_t*)pgm_read_ptr(&fv1_programs[ext_prog_num].binary);
	for (uint16_t cnt = 0; cnt < binary_length; cnt++)
	{
		dbg_pin::low();
		fv1_i2c::send_byte(pgm_read_byte(binary++));
		dbg_pin::high();
	}

	for (uint16_t cnt = binary_length; cnt < 0x200; cnt += 4)
	{
		fv1_i2c::send_byte(0x00);
		fv1_i2c::send_byte(0x00);
		fv1_i2c::send_byte(0x00);
		fv1_i2c::send_byte(0x11);
	}

	// ack to release the SCL
	TWI1.SCTRLB = TWI_SCMD_RESPONSE_gc;
}

bool FV1::set_preset(const Preset& new_preset)
{
	bool changed = false;

	changed |= update_pot<0>(new_preset);
	changed |= update_pot<1>(new_preset);
	changed |= update_pot<2>(new_preset);

	if (new_preset.mix != _active_preset.mix)
	{
		set_digipots<dp_mix_i2c>(dp_mix_address, new_preset.mix, new_preset.mix);
		_active_preset.mix = new_preset.mix;

		changed = true;
	}

	const bool new_external = new_preset.is_external();
	const bool active_external = _active_preset.is_external();
	if (new_external != active_external
		|| new_preset.prog_num != _active_preset.prog_num)
	{
		fv1_t0::set_value(new_external);

		if (new_external)
			send_program(new_preset.prog_num);

		changed = true;
	}

	if (changed)
		_active_preset = new_preset;

	return changed;
}

int8_t channel_cnt = -1;
uint16_t adc_result[4] = {0, 0, 0, 0};
const ADC_MUXPOS_t mux[4] =
{
	ADC_MUXPOS_AIN10_gc,
	ADC_MUXPOS_AIN11_gc,
	ADC_MUXPOS_AIN12_gc,
	ADC_MUXPOS_AIN13_gc
};

void fv1_poll(int8_t delta)
{
	if (ADC::is_ready())
	{
		bool changed = false;
		if (channel_cnt >= 0)
		{
			const uint16_t prev = adc_result[channel_cnt];

			const uint16_t result = ADC::get_result();
			if (channel_cnt == 3)
				adc_result[channel_cnt] = 0xff - (result >> 8);
			else
				adc_result[channel_cnt] = 0xfff - (result >> 4);

			changed = prev != adc_result[channel_cnt];
		}

		if (changed)
		{
			// dprint("%4x %4x %4x %4x\n", adc_result[0], adc_result[1], adc_result[2], adc_result[3]);

			if (channel_cnt == 0)
				fv1_pwm_timer::set_pwm_duty<0>(adc_result[0]);
			else if (channel_cnt == 1)
				fv1_pwm_timer::set_pwm_duty<1>(adc_result[1]);
			else if (channel_cnt == 2)
				fv1_pwm_timer::set_pwm_duty<2>(adc_result[2]);
			else
				set_digipots<dp_mix_i2c>(dp_mix_address, adc_result[3], adc_result[3]);
		}

		if (++channel_cnt == 4)
			channel_cnt = 0;

		ADC::start(mux[channel_cnt]);
	}

	static int8_t prog = 0;
	if (delta)
	{
		prog += delta;
		while (prog > 7)
			prog -= 8;
		while (prog < 0)
			prog += 8;

		dprint("new prog %i\n", prog);

		fv1_s0::set_value(prog & 1);
		fv1_s1::set_value(prog & 2);
		fv1_s2::set_value(prog & 4);
	}
}
