#pragma once

#include <avr/io.h>

template <uint8_t TimerNum, uint16_t Prescale>
class TimerA
{
private:

	static_assert(TimerNum <= 1, "We don't have that timer");

	constexpr static TCA_SINGLE_t& get_tca()
	{
		return (&TCA0)[TimerNum].SINGLE;
	}

	constexpr static TCA_SINGLE_CLKSEL_t get_clksel()
	{
		if constexpr(Prescale == 1)
			return TCA_SINGLE_CLKSEL_DIV1_gc;
		else if constexpr(Prescale == 2)
			return TCA_SINGLE_CLKSEL_DIV2_gc;
		else if constexpr(Prescale == 4)
			return TCA_SINGLE_CLKSEL_DIV4_gc;
		else if constexpr(Prescale == 8)
			return TCA_SINGLE_CLKSEL_DIV8_gc;
		else if constexpr(Prescale == 16)
			return TCA_SINGLE_CLKSEL_DIV16_gc;
		else if constexpr(Prescale == 64)
			return TCA_SINGLE_CLKSEL_DIV64_gc;
		else if constexpr(Prescale == 256)
			return TCA_SINGLE_CLKSEL_DIV256_gc;

		return TCA_SINGLE_CLKSEL_DIV1024_gc;
	}

public:

	static void start()
	{
		get_tca().CTRLA = get_clksel() | TCA_SINGLE_ENABLE_bm;
	}

	static void stop()
	{
		get_tca().CTRLA = 0;
	}

	static uint16_t cnt()
	{
		return get_tca().CNT;
	}

	static void set_period(const uint16_t period)
	{
		get_tca().PER = period;
	}

	template <uint8_t Channel>
	static void enable_pwm()
	{
		static_assert(Channel < 3, "We don't have that channel on this timer");

		const uint16_t prevCtrlb = (get_tca().CTRLB & 0x78);

		get_tca().CTRLB = (TCA_SINGLE_CMP0EN_bm << Channel)
						| TCA_SINGLE_WGMODE_SINGLESLOPE_gc
						| prevCtrlb;
	}

	template <uint8_t Channel>
	static void set_pwm_duty(const uint16_t cmp)
	{
		static_assert(Channel < 3, "We don't have that channel on this timer");

		(&(get_tca().CMP0))[Channel] = cmp;
	}
};
