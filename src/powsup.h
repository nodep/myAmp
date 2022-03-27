#pragma once

#define VOLTS2ADC(v)		(uint16_t)((v) * 28.261)

void powsup_init(void);
void powsup_poll(void);
void powsup_reset(void);
uint16_t powsup_get_adc(void);
