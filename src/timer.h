#pragma once

#define MS2TICKS(ms)	((ms) * (F_CPU / 1024000))

void timer_init(void);
uint16_t timer_ticks(void);
