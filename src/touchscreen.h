#pragma once

#include "graph.h"

// Code based on arduino touchscreen library

struct TS_Point
{
	int16_t x, y, z;
	
	TS_Point()
		: x(0), y(0), z(0)
	{}

	TS_Point(int16_t x, int16_t y, int16_t z)
		: x(x), y(y), z(z)
	{}
	
	bool operator == (const TS_Point& p) const
	{
		return p.x == x  &&  p.y == y  &&  p.z == z;
	}

	bool operator != (const TS_Point& p) const
	{
		return !operator == (p);
	}

	bool valid() const
	{
		const int16_t Z_THRESHOLD = 400;
		return z > Z_THRESHOLD;
	}
};

struct Touchscreen_XPT2046
{
	//double xCalM = 1;
	//double xCalC = 0;
	//double yCalM = 1;
	//double yCalC = 0;

	//int16_t disp_width = 0xffff;
	//int16_t disp_height = 0xffff;

	double xCalM = 0.071891;
	double xCalC = -25.938175;
	double yCalM = 0.090439;
	double yCalC = -36.434109;

	int16_t disp_width = 240;
	int16_t disp_height = 320;

	void init()
	{
		ts_cs::high();
		ts_cs::dir_out();

		// SPI should already be configured by the display
	}

	TS_Point get_point_raw();	// raw values from XPT2046
	TS_Point get_point();		// calibrated values

	bool touched()
	{
		return get_point().valid();
	}

	template <class D>
	void calibrate(D& d)
	{
		disp_width = D::Width;
		disp_height = D::Height;

		fill(d, colBlack);

		// get the first calibration point
		while(touched());
		hline(d, 10, 20, 20, colWhite);
		vline(d, 20, 10, 20, colWhite);
		while(!touched());
		_delay_ms(50);
		TS_Point p = get_point_raw();
		const int16_t x1 = p.x;
		int16_t y1 = p.y;
		hline(d, 10, 20, 20, colBlack);
		vline(d, 20, 10, 20, colBlack);
		_delay_ms(500);

		// get the second calibration point
		while(touched());
		hline(d, D::Width - 30, D::Height - 20, 20, colYellow);
		vline(d, D::Width - 20, D::Height - 30, 20, colYellow);
		while(!touched());
		_delay_ms(50);
		p = get_point_raw();
		const int16_t x2 = p.x;
		const int16_t y2 = p.y;
		hline(d, D::Width - 30, D::Height - 20, 20, colBlack);
		vline(d, D::Width - 20, D::Height - 30, 20, colBlack);
		
		// translate to form pos = m * val + c
		const double xDist = D::Width - 40;
		const double yDist = D::Height - 40;
		
		xCalM = xDist / (x2 - x1);
		xCalC = 20.0 - x1 * xCalM;

		yCalM = yDist / (y2 - y1);
		yCalC = 20.0 - y1 * yCalM;

		dprint("calib: xCalM=%f xCalC=%f yCalM=%f yCalC=%f disp_width=%d disp_height=%d\n",
			(double)xCalM, (double)xCalC, (double)yCalM, (double)yCalC, disp_width, disp_height);
	}
};
