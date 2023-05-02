#pragma once

struct ADC
{
	static void init()
	{
		// set reference to VDD
		VREF.ADC0REF = VREF_REFSEL_VDD_gc;

		ADC0.CTRLB = 4;		// 16 samples
		ADC0.CTRLC = 4;		// prescale 16
		ADC0.CTRLA = ADC_ENABLE_bm;
	}

	static void start(ADC_MUXPOS_t muxpos)
	{
		ADC0.MUXPOS = muxpos;
		ADC0.COMMAND = 1;
	}

	static ADC_MUXPOS_t get_muxpos()
	{
		return static_cast<ADC_MUXPOS_t>(ADC0.MUXPOS);
	}

	static uint16_t get_result()
	{
		return ADC0.RES;
	}

	static bool is_ready()
	{
		return (ADC0.COMMAND & 1) == 0;
	}
};
