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
	ADC_MUXPOS_t	muxpos[Size];
	uint16_t		noise_gate[Size];
	uint16_t		results[Size];
	bool			has_changed[Size];
	int8_t			mux_cnt = -1;

	void set_muxpos(const uint8_t channel, const ADC_MUXPOS_t mp, const uint16_t ng)
	{
		muxpos[channel] = mp;
		noise_gate[channel] = ng;
		has_changed[channel] = false;
	}

	bool has_fresh_set()
	{
		bool ret_val = false;

		if (ADC::is_ready())
		{
			if (mux_cnt >= 0)
			{
				const uint16_t result = ADC::get_result();
				const uint16_t diff = abs(results[mux_cnt] - result);
				if (diff > noise_gate[mux_cnt])
				{
					results[mux_cnt] = result;
					has_changed[mux_cnt] = true;
				}
				else
				{
					has_changed[mux_cnt] = false;
				}
			}

			if (++mux_cnt == Size)
			{
				ret_val = true;
				mux_cnt = 0;
			}

			ADC::start(muxpos[mux_cnt]);
		}

		return ret_val;
	}
};
