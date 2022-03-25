#pragma once

#define TIMER_PRESCALER		1024

#define MS2TICKS(ms)		((ms) * (F_CPU/1000) / TIMER_PRESCALER)
#define TICKS2MS(ticks)		((ticks) * TIMER_PRESCALER / (F_CPU/1000))

void timer_init(void);

// timer_ticks() and timer_ticks_high() must be called at
// least once every 40ms to avoid loosing time
uint16_t timer_ticks(void);
uint16_t timer_ticks_high(void);
