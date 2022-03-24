#pragma once

#define MS2TICKS(ms)	((ms) * (F_CPU / 1024000))
#define TICKS2MS(ticks)	((ticks) / MS2TICKS(1))

void timer_init(void);
uint16_t timer_ticks(void);
uint16_t timer_wrap_arounds(void);
