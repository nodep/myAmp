#pragma once

#include "fv1.h"
#include "pedals.h"
#include "rotenc.h"
#include "displaySpi.h"
//#include "touchscreen.h"
#include "adc.h"
#include "preset.h"

struct App
{
	FV1			fv1;
	Pedals		pedals;
	RotEnc		rotenc;
	Display		display;
	//Touchscreen_XPT2046 ts;
	ADCRunner<5>	adc;
	double		battery_voltage = .0;

	App();

	void poll();
};