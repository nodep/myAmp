#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "rotenc.h"

void rotenc_init()
{
	// switch as input with pull-up
	fv1k_re_sw::dir_in();
	fv1k_re_sw::pullup();
	
	// A and B are inputs with pull-ups
	fv1k_re_a::dir_in();
	fv1k_re_a::pullup();
	fv1k_re_b::dir_in();
	fv1k_re_b::pullup();
}

const int8_t lookup_table[0x10] PROGMEM =
{
   0,	// 0b0000
  -1,	// 0b0001
   1,	// 0b0010
   0,	// 0b0011
   1,	// 0b0100
   0,	// 0b0101
   0,	// 0b0110
  -1,	// 0b0111
  -1,	// 0b1000
   0,	// 0b1001
   0,	// 0b1010
   1,	// 0b1011
   0,	// 0b1100
   1,	// 0b1101
  -1,	// 0b1110
   0,	// 0b1111
};	

bool rotenc_is_stable(void)
{
	const uint8_t AB = (fv1k_re_a::in() ? 0 : 2) | (fv1k_re_b::in() ? 0 : 1);
	return AB == 0;
}

int8_t rotenc_delta()
{
	static uint8_t oldAB = 0;

	const uint8_t newAB = (fv1k_re_a::in() ? 0 : 2) | (fv1k_re_b::in() ? 0 : 1);

	oldAB <<= 2;		// remember previous state
	oldAB |= newAB;		// add current state
	oldAB &= 0x0f;		// clear the extra bits
	
	return pgm_read_byte(&lookup_table[oldAB]);
}

bool rotenc_button()
{
	// read the value with de-bouncing
	static bool prev_btn = false;
	static bool in_debounce = false;
	static bool debounced_btn = false;
	static uint16_t debounce_start = 0;

	const bool curr_btn = fv1k_re_sw::in();
	const uint16_t now = Watch::now();
	
	if (prev_btn != curr_btn)
	{
		debounce_start = now;
		in_debounce = true;
	}
	else if (in_debounce)
	{
		const uint16_t debounce_dur = now - debounce_start;
		if (Watch::has_ms_passed_since(20, debounce_dur))
		{
			in_debounce = false;
			debounced_btn = curr_btn;
		}
	}

	prev_btn = curr_btn;

	return debounced_btn;
}

typedef struct 
{
	uint16_t	at_least;
	uint16_t	at_most;
} change_t;

typedef struct
{
	rotenc_button_event_e	event;
	uint8_t					curr_step;
	const change_t*			changes;
} event_t;

const change_t changes_single[] PROGMEM =
{
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// down
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
};

const change_t changes_double[] PROGMEM =
{
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// down
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// up
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// down
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
};

const change_t changes_long[] PROGMEM =
{
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
	{ .at_least = Watch::ms2ticks( 600), .at_most = Watch::ms2ticks(2000)},	// down
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
};

const change_t changes_long_short[] PROGMEM =
{
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
	{ .at_least = Watch::ms2ticks( 600), .at_most = Watch::ms2ticks(2000)},	// down
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// up
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// down
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
};

static event_t events[] =
{
	{ .event = be_single,		.curr_step = 0,		.changes = changes_single, },
	{ .event = be_double,		.curr_step = 0,		.changes = changes_double, },
	{ .event = be_long,			.curr_step = 0,		.changes = changes_long, },
	{ .event = be_long_short,	.curr_step = 0,		.changes = changes_long_short, },
};

static bool event_process(event_t* event, uint16_t change_dur, bool curr_button, bool prev_button)
{
	const uint16_t at_least = pgm_read_word(&event->changes[event->curr_step].at_least);
	const uint16_t at_most = pgm_read_word(&event->changes[event->curr_step].at_most);
	
	if (curr_button != prev_button)
	{
		// advance step?
		if (curr_button  ||  event->curr_step > 0)
		{
			if ((at_least == 0  ||  at_least <= change_dur)
					&&  (at_most == 0  ||  at_most >= change_dur))
				++event->curr_step;
			else
				event->curr_step = 0;		// back to start
		}
	}
	else if (!curr_button
			&&  event->curr_step > 0
			&&  at_most == 0
			&&  change_dur >= at_least)
	{
		event->curr_step = 0;
		return true;
	}
	
	return false;
}

#define NUM_EVENTS	(sizeof(events)/sizeof(events[0]))

rotenc_button_event_e rotenc_poll_button_event(void)
{
	static uint16_t prev_change = 0;
	static bool prev_button = false;

	const bool curr_button = rotenc_button();
	const uint16_t now = Watch::now();
	const uint16_t change_dur = now - prev_change;
	
	rotenc_button_event_e button_event = be_none;
	
	for (uint8_t event_cnt = 0; event_cnt < NUM_EVENTS; ++event_cnt)
	{
		if (event_process(events + event_cnt, change_dur, curr_button, prev_button))
			button_event = events[event_cnt].event;
	}
	
	if (curr_button != prev_button)
		prev_change = now;
	else if (change_dur > Watch::ms2ticks(4000))
		prev_change = now - Watch::ms2ticks(4000);

	prev_button = curr_button;
	
	return button_event;
}
