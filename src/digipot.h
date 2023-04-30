#pragma once

#include "i2c.h"

template <class I2CBus>
void set_digipots(uint8_t address, uint8_t position1, uint8_t position2)
{
	I2CBus::write_address(address, false);
	I2CBus::write_data(0b00010000);
	I2CBus::write_data(position1);
	I2CBus::write_data(0b00010001);
	I2CBus::write_data(position2);
	I2CBus::stop();
}
