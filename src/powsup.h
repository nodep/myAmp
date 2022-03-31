#pragma once

#define VOLTS2ADC(v)		(uint16_t)((v) * 28.261)

void powsup_init(void);
void powsup_poll(const uint16_t now);
void powsup_reset(const uint16_t now);
void powsup_shutdown(const uint16_t now);
uint16_t powsup_get_adc(void);
