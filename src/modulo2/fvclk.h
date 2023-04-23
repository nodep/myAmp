#pragma once

#define FV_FREQ_MIN				25000
#define FV_FREQ_MAX				40000

void fvclk_init(void);
void fvclk_change(const int16_t delta);
void fvclk_reset(void);
uint16_t fvclk_get_freq(void);