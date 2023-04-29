#pragma once

template <int I2CNum>
class I2C
{
private:
	static_assert(I2CNum == 0  ||  I2CNum == 1, "We only have two I2C peripherals on this device.");

	constexpr static TWI_t& get_twi()
	{
		if (I2CNum == 0)
			return TWI0;

		return TWI1;
	}

	constexpr static uint8_t TWI_BAUD(uint32_t f_scl, uint32_t t_rise)
	{
		return ((((((double)5000000.0 / (double)f_scl)) - 10 - ((double)5000000.0 * t_rise / 1000000))) / 2);
	}

public:

	static void init_master()
	{
		get_twi().MBAUD = TWI_BAUD(100000, 0);
		get_twi().MCTRLA = TWI_ENABLE_bm;
	}
};
