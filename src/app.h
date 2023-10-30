#pragma once

#include "fv1.h"
#include "pedals.h"
#include "rotenc.h"
#include "displaySpi.h"
//#include "touchscreen.h"
#include "adc.h"
#include "preset.h"

constexpr Coord WIN_WIDTH = 298;
constexpr Coord WIN_WIDTH_HALF = WIN_WIDTH / 2;
constexpr Coord WIN_OFFSET = 10;
constexpr Coord HBAR_WIDTH = WIN_WIDTH_HALF - 4;
constexpr Coord NAME_HEIGHT = 24;
constexpr Coord PARAM_NAME_HEIGHT = 18;
constexpr Coord HBAR_HEIGHT = 21;
constexpr Coord HBAR_ADVANCE = HBAR_HEIGHT + 8;
constexpr Coord HBAR_YOFFSET = 50;
constexpr Coord MIX_YOFFSET = 8;

constexpr Coord VOLTAGE_BAR_WIDTH = 8;

constexpr double MIN_VOLTAGE = 3.2 * 6;
constexpr double MAX_VOLTAGE = 4.2 * 6;
constexpr double ADC_VOLTAGE_FACTOR = 1796.721311;

struct ProgressBar
{
	Coord			bar_width = 0;
	Color			frame_color = colBlack;
	const Color		bar_color;
	const Coord		x0, y0;
	const double	range;

	ProgressBar(const uint16_t rng, const Coord x, const Coord y, const Color bc)
		: bar_color(bc), x0(x), y0(y), range(rng)
	{}

	void draw(Display& disp, const uint16_t new_progress, const Color new_frame_color)
	{
		if (frame_color != new_frame_color)
		{
			draw_rect(disp, x0 - 2, y0 - 2, WIN_WIDTH / 2, HBAR_HEIGHT + 4, new_frame_color);
			frame_color = new_frame_color;
		}

		const Coord new_bar_width = static_cast<Coord>(new_progress / (range / HBAR_WIDTH));
		if (new_bar_width < bar_width)
			fill_rect(disp, x0 + new_bar_width, y0, bar_width - new_bar_width, HBAR_HEIGHT, colBlack);
		else if (new_bar_width > bar_width)
			fill_rect(disp, x0 + bar_width, y0, new_bar_width - bar_width, HBAR_HEIGHT, bar_color);

		bar_width = new_bar_width;
	}
};

struct App
{
	FV1			fv1;
	Pedals		pedals;
	RotEnc		rotenc;
	Display		display;
	//Touchscreen_XPT2046 ts;
	ADCRunner<5>	adc;

	ProgressBar pot_progbars[3] = {
		{0x1000, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF + 2, HBAR_YOFFSET + 2, colGreen},
		{0x1000, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF + 2, HBAR_YOFFSET + HBAR_ADVANCE + 2, colGreen},
		{0x1000, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF + 2, HBAR_YOFFSET + HBAR_ADVANCE*2 + 2, colGreen} };
									
	ProgressBar mix_progbar
		{0x100, VOLTAGE_BAR_WIDTH + WIN_OFFSET + WIN_WIDTH_HALF + 2, HBAR_YOFFSET + HBAR_ADVANCE*3 + MIX_YOFFSET + 2, colYellow};

	App();

	void poll();
	void refresh_voltage(const double battery_voltage);
	void refresh_preset();
};