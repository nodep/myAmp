#pragma once

template <uint16_t Prescale>
class RTClock
{
public:
	constexpr static RTC_PRESCALER_t get_prescaler()
	{
		if constexpr(Prescale == 1)
			return RTC_PRESCALER_DIV1_gc;
		else if constexpr(Prescale == 2)
			return RTC_PRESCALER_DIV2_gc;
		else if constexpr(Prescale == 4)
			return RTC_PRESCALER_DIV4_gc;
		else if constexpr(Prescale == 8)
			return RTC_PRESCALER_DIV8_gc;
		else if constexpr(Prescale == 16)
			return RTC_PRESCALER_DIV16_gc;
		else if constexpr(Prescale == 32)
			return RTC_PRESCALER_DIV32_gc;
		else if constexpr(Prescale == 64)
			return RTC_PRESCALER_DIV64_gc;
		else if constexpr(Prescale == 128)
			return RTC_PRESCALER_DIV128_gc;
		else if constexpr(Prescale == 256)
			return RTC_PRESCALER_DIV256_gc;
		else if constexpr(Prescale == 512)
			return RTC_PRESCALER_DIV512_gc;
		else if constexpr(Prescale == 1024)
			return RTC_PRESCALER_DIV1024_gc;
		else if constexpr(Prescale == 2048)
			return RTC_PRESCALER_DIV2048_gc;
		else if constexpr(Prescale == 4096)
			return RTC_PRESCALER_DIV4096_gc;
		else if constexpr(Prescale == 8192)
			return RTC_PRESCALER_DIV8192_gc;
		else if constexpr(Prescale == 16384)
			return RTC_PRESCALER_DIV16384_gc;

		return RTC_PRESCALER_DIV32768_gc;
	}

	static_assert(get_prescaler() != RTC_PRESCALER_DIV32768_gc  ||  Prescale == 32768, "Unsupported prescaler on RTWatch<Prescaler>");

	static void start()
	{
		RTC.CLKSEL = RTC_CLKSEL_OSC32K_gc;
		RTC.CTRLA = get_prescaler() | RTC_RTCEN_bm;
	}

	static uint16_t cnt()
	{
		return RTC.CNT;
	}

	static uint32_t cntlong()
	{
		static uint32_t ovf_cnt = 0;

		const uint16_t c = cnt();
		if (RTC.INTFLAGS & RTC_OVF_bm)
		{
			RTC.INTFLAGS = RTC_OVF_bm;
			ovf_cnt += 0x10000;
		}

		return ovf_cnt | c;
	}

	constexpr static uint32_t ticks2ms_long(const uint32_t ticks)
	{
		return ticks * 1000 * Prescale / 32768;
	}

	constexpr static uint16_t ticks2ms(const uint16_t ticks)
	{
		return ticks * 1000 * Prescale / 32768;
	}

	constexpr static uint16_t ms2ticks(const uint16_t ms)
	{
		return ms * 32768 / Prescale / 1000;
	}

	static bool has_ms_passed_since(const uint16_t ms, const uint16_t since)
	{
		return static_cast<uint32_t>(cnt() - since) >= ms2ticks(ms);
	}

	static uint16_t ms_since(const uint16_t since)
	{
		return ticks2ms(cnt() - since);
	}
};
