#pragma once

#include "fv1.h"
#include "pedals.h"
#include "rotenc.h"
#include "displaySpi.h"
#include "touchscreen.h"
#include "adc.h"

struct App
{
	FV1			fv1;
	Pedals		pedals;
	RotEnc		rotenc;
	Display		display;
	Touchscreen_XPT2046 ts;
	ADCRunner<5>	adc = {	ADC_MUXPOS_AIN7_gc,		// battery voltage
							ADC_MUXPOS_AIN10_gc,	// FV1 pots
							ADC_MUXPOS_AIN11_gc,
							ADC_MUXPOS_AIN12_gc,
							ADC_MUXPOS_AIN13_gc};

	App();
};