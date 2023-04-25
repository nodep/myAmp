#pragma once

#include <avr/io.h>

template <uint8_t SpiNum, uint8_t Speed>
class SpiMaster
{
protected:
	static_assert(SpiNum <= 1, "Only SPI 0 and 1 are present in HW");
	static_assert(Speed <= 6, "Speed can only go from 0 to 6");

	constexpr static SPI_t& get_spi()
	{
		if constexpr (SpiNum == 0)
			return SPI0;

		return SPI1;
	}

	constexpr static uint8_t speed_flags()
	{
		if constexpr (Speed == 0)
			return SPI_PRESC_DIV128_gc;
		else if constexpr (Speed == 1)
			return SPI_PRESC_DIV64_gc;
		else if constexpr (Speed == 2)
			return SPI_PRESC_DIV64_gc | SPI_CLK2X_bm;
		else if constexpr (Speed == 3)
			return SPI_PRESC_DIV16_gc;
		else if constexpr (Speed == 4)
			return SPI_PRESC_DIV16_gc | SPI_CLK2X_bm;
		else if constexpr (Speed == 5)
			return SPI_PRESC_DIV4_gc;

		return SPI_PRESC_DIV4_gc | SPI_CLK2X_bm;
	}

public:
	static void init()
	{
		get_spi().CTRLB = SPI_SSD_bm;
		get_spi().CTRLA = static_cast<uint8_t>(SPI_MASTER_bm | speed_flags() | SPI_ENABLE_bm);
	}

	static uint8_t send(uint8_t b)
	{
		get_spi().DATA = b;
		loop_until_bit_is_set(get_spi().INTFLAGS, SPI_IF_bp);
		return get_spi().DATA;
	}

	static uint16_t send16(uint16_t w)
	{
		const uint16_t hi = send(static_cast<uint8_t>(w >> 8));
		const uint8_t lo = send(static_cast<uint8_t>(w));
		return (hi << 8) | lo;
	}
};
