#pragma once

#include "fv1.h"
#include "pedals.h"
#include "rotenc.h"
#include "displaySpi.h"
//#include "touchscreen.h"
#include "adc.h"
#include "preset.h"

struct ProgressBar
{
	uint16_t	progress = 0;
};

struct App
{
	FV1			fv1;
	Pedals		pedals;
	RotEnc		rotenc;
	Display		display;
	//Touchscreen_XPT2046 ts;
	ADCRunner<5>	adc;
	double		battery_voltage = .0;

	static constexpr double MIN_VOLTAGE = 3.2 * 6;
	static constexpr double MAX_VOLTAGE = 4.2 * 6;
	static constexpr uint16_t VOLTAGE_BAR_WIDTH = 8;

	static constexpr double ADC_VOLTAGE_FACTOR = 1796.721311;

	App();

	void poll();
	void refresh_voltage();
	void refresh_preset(const Preset& preset, uint8_t updated);
};