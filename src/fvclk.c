#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>

#include "hw_setup.h"
#include "utils.h"
#include "fvclk.h"

#define FV_FREQ_DEFAULT			32768
#define FV_FREQ_STEP			100
#define FV_FREQ_TO_CNT(freq)	(uint16_t)(((F_CPU/2)/(freq))-1)

uint16_t fvclk_freq = FV_FREQ_DEFAULT;

uint16_t fvclk_get_freq(void)
{
	return fvclk_freq;
}

void fvclk_init(void)
{
	TCCR1A = _BV(COM1B0);	// output clock on B2
	TCCR1B = _BV(WGM12) |	// CTC
			 _BV(CS10);		// prescaler 1

	SetBit(DDR(FV_CLK_PORT), FV_CLK_BIT);

	OCR1A = FV_FREQ_TO_CNT(fvclk_freq);
}

static void fvclk_set_ocr(const uint16_t new_ocr)
{
	// wait for the counter to overflow to avoid short clock periods
	while (TCNT1 > 100)
		;

	OCR1A = new_ocr;
}

void fvclk_change(const int16_t delta)
{
	fvclk_freq += delta * FV_FREQ_STEP;
	
	if (fvclk_freq < FV_FREQ_MIN)
		fvclk_freq = FV_FREQ_MIN;
	
	if (fvclk_freq > FV_FREQ_MAX)
		fvclk_freq = FV_FREQ_MAX;

	fvclk_set_ocr(FV_FREQ_TO_CNT(fvclk_freq));
}

void fvclk_reset(void)
{
	fvclk_freq = FV_FREQ_DEFAULT;

	fvclk_set_ocr(FV_FREQ_TO_CNT(fvclk_freq));
}
