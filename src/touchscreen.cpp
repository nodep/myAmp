#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"

#include "avrdbg.h"
#include "touchscreen.h"

static int16_t besttwoavg(int16_t x, int16_t y, int16_t z)
{
	const int16_t da = x > y ? x - y : y - x;
	const int16_t db = x > z ? x - z : z - x;
	const int16_t dc = z > y ? z - y : y - z;

	int16_t reta = 0;
	if (da <= db  &&  da <= dc)
		reta = (x + y) >> 1;
	else if (db <= da  &&  db <= dc)
		reta = (x + z) >> 1;
	else
		reta = (y + z) >> 1;

	return reta;
}

TS_Point Touchscreen_XPT2046::get_point_raw()
{
	TS_Point ret;

	int16_t data[6] = {0};

	ts_cs::low();
	s_spi::send(0xB1 /* Z1 */);
	const int16_t z1 = s_spi::send16(0xC1 /* Z2 */) >> 3;
	const int16_t z2 = s_spi::send16(0x91 /* X */) >> 3;
	ret.z = z1 + 4095 - z2;
	if (ret.valid())
	{
		s_spi::send16(0x91 /* X */);  // dummy X measure, 1st is always noisy
		data[0] = s_spi::send16(0xD1 /* Y */) >> 3;
		data[1] = s_spi::send16(0x91 /* X */) >> 3; // make 3 x-y measurements
		data[2] = s_spi::send16(0xD1 /* Y */) >> 3;
		data[3] = s_spi::send16(0x91 /* X */) >> 3;
	}
	data[4] = s_spi::send16(0xD0 /* Y */) >> 3;	// Last Y touch power down
	data[5] = s_spi::send16(0) >> 3;
	ts_cs::high();
	
	if (ret.z < 0)
		ret.z = 0;

	// Average pair with least distance between each measured x then y
	const int16_t x = besttwoavg(data[0], data[2], data[4]);
	const int16_t y = besttwoavg(data[1], data[3], data[5]);

	if (ret.valid())
	{
		const uint8_t rotation = 0;
		switch (rotation)
		{
		case 0:
			ret.x = 4095 - y;
			ret.y = x;
			break;
		case 1:
			ret.x = x;
			ret.y = y;	
			break;
		case 2:
			ret.x = y;
			ret.y = 4095 - x;
			break;
		default: // 3
			ret.x = 4095 - x;
			ret.y = 4095 - y;
		}
	}

	return ret;
}

TS_Point Touchscreen_XPT2046::get_point()
{
	TS_Point p = get_point_raw();

	p.x = round(p.x * xCalM + xCalC);
	p.y = round(p.y * yCalM + yCalC);

	if (p.x < 0)
		p.x = 0;
	if (p.x >= disp_width)
		p.x = disp_width - 1;

	if (p.y < 0)
		p.y = 0;
	if (p.y >= disp_height)
		p.y = disp_height - 1;

	return p;
}
