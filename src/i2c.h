#pragma once

using I2CState = enum : uint8_t 
{
	i2c_init,
	i2c_acked,
	i2c_nacked,
	i2c_ready,
	i2c_error
};

template <int I2CNum>
class I2C
{
protected:

	static_assert(I2CNum == 0  ||  I2CNum == 1, "We only have two I2C peripherals on this device.");

	constexpr static TWI_t& get_twi()
	{
		if (I2CNum == 0)
			return TWI0;

		return TWI1;
	}
};

template <int I2CNum>
class I2CMaster : public I2C<I2CNum>
{
public:
	constexpr static uint8_t calc_baud(uint32_t f_scl, uint32_t t_rise)
	{
		return ((((((double)5000000.0 / (double)f_scl)) - 10 - ((double)5000000.0 * t_rise / 1000000))) / 2);
	}

	static I2CState wait_write()
	{
		while (true)
		{
			const uint8_t mstatus = I2C<I2CNum>::get_twi().MSTATUS;
			if (mstatus & (TWI_BUSERR_bm | TWI_ARBLOST_bm))
			{
				return i2c_error;
			}
			else if (mstatus & (TWI_WIF_bm | TWI_RIF_bm))
			{
				if (mstatus & TWI_RXACK_bm)
					return i2c_nacked;
				else
					return i2c_acked;
			}
		}
	}

	static I2CState wait_read()
	{
		while (true)
		{
			const uint8_t mstatus = I2C<I2CNum>::get_twi().MSTATUS;
			if (mstatus & (TWI_BUSERR_bm | TWI_ARBLOST_bm))
				return i2c_error;
			else if (mstatus & (TWI_WIF_bm | TWI_RIF_bm))
				return i2c_ready;
		}
	}

	constexpr static TWI_t& get_twi()
	{
		return I2C<I2CNum>::get_twi();
	}

public:

	static void init_master()
	{
		get_twi().MBAUD = calc_baud(100000, 0);
		get_twi().MCTRLA = TWI_ENABLE_bm;
		get_twi().MSTATUS = 1;	// force an idle state
	}

	static I2CState write_address(uint8_t address, bool is_read)
	{
		const uint8_t addr = (address << 1) | (is_read ? 1 : 0);
		get_twi().MADDR = addr;
		return wait_write();
	}

	static I2CState write_byte(uint8_t data)
	{
		get_twi().MDATA = data;
		return wait_write();
	}

	static void stop()
	{
		get_twi().MCTRLB |= TWI_MCMD_STOP_gc;
	}
};


template <int I2CNum>
class I2CSlave : public I2C<I2CNum>
{
private:
	constexpr static TWI_t& get_twi()
	{
		return I2C<I2CNum>::get_twi();
	}

public:
	static void init_slave(const uint8_t address)
	{
		get_twi().SADDR = address;
		get_twi().SCTRLA = TWI_SMEN_bm | TWI_ENABLE_bm;
	}

	static uint8_t wait_for(const uint8_t mask)
	{
		uint8_t status = 0;
		do {
			status = get_twi().SSTATUS;
		} while ((status & mask) == 0);

		return status;
	}

	static void confirm()
	{
		get_twi().SCTRLB = TWI_SCMD_RESPONSE_gc;
	}

	static void send_byte(uint8_t data)
	{
		get_twi().SDATA = data;
	}
};