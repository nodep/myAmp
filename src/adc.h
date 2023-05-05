#pragma once

struct ADC
{
	static void init()
	{
		// set reference to VDD
		VREF.ADC0REF = VREF_REFSEL_VDD_gc;

		ADC0.CTRLB = 4;		// 16 samples
		ADC0.CTRLC = 0xD;	// prescale 256
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

template <int Size>
struct ADCRunner
{
	const ADC_MUXPOS_t	muxpos[Size];
	uint16_t			results[Size];
	bool				valid = false;
	int8_t				mux_cnt = -1;

	void poll()
	{
		if (ADC::is_ready())
		{
			if (mux_cnt >= 0)
			{
				results[mux_cnt] = ADC::get_result();
			}

			if (++mux_cnt == Size)
			{
				valid = true;
				mux_cnt = 0;
			}

			ADC::start(muxpos[mux_cnt]);
		}
	}
};
