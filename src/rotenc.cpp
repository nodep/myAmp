#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "rotenc.h"

RotEnc::RotEnc()
{
	// switch as input with pull-up
	fv1k_re_sw::dir_in();
	fv1k_re_sw::pullup();
	fv1k_re_sw::invert();
	
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

bool RotEnc::get_button()
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

const RotEnc::change_t RotEnc::changes_single[] PROGMEM =
{
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// down
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
};

const RotEnc::change_t RotEnc::changes_double[] PROGMEM =
{
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// down
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// up
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// down
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
};

const RotEnc::change_t RotEnc::changes_long[] PROGMEM =
{
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
	{ .at_least = Watch::ms2ticks( 600), .at_most = Watch::ms2ticks(2000)},	// down
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
};

const RotEnc::change_t RotEnc::changes_long_short[] PROGMEM =
{
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
	{ .at_least = Watch::ms2ticks( 600), .at_most = Watch::ms2ticks(2000)},	// down
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// up
	{ .at_least = Watch::ms2ticks(   0), .at_most = Watch::ms2ticks( 300)},	// down
	{ .at_least = Watch::ms2ticks( 501), .at_most = Watch::ms2ticks(   0)},	// up
};

const RotEnc::event_t RotEnc::events[NUM_EVENTS] =
{
	{ .event = RotEnc::beSingle,		.changes = changes_single, },
	{ .event = RotEnc::beDouble,		.changes = changes_double, },
	{ .event = RotEnc::beLong,			.changes = changes_long, },
	{ .event = RotEnc::beLongShort,		.changes = changes_long_short, },
};

bool RotEnc::event_process(uint8_t event_cnt, uint16_t change_dur, bool curr_button, bool prev_button)
{
	const uint16_t at_least = pgm_read_word(&events[event_cnt].changes[curr_step[event_cnt]].at_least);
	const uint16_t at_most = pgm_read_word(&events[event_cnt].changes[curr_step[event_cnt]].at_most);
	
	if (curr_button != prev_button)
	{
		// advance step?
		if (curr_button  ||  curr_step[event_cnt] > 0)
		{
			if ((at_least == 0  ||  at_least <= change_dur)
					&&  (at_most == 0  ||  at_most >= change_dur))
				++curr_step[event_cnt];
			else
				curr_step[event_cnt] = 0;		// back to start
		}
	}
	else if (!curr_button
			&&  curr_step[event_cnt] > 0
			&&  at_most == 0
			&&  change_dur >= at_least)
	{
		curr_step[event_cnt] = 0;
		return true;
	}
	
	return false;
}

RotEnc::ButtonEvent RotEnc::get_button_event()
{
	static uint16_t prev_change = 0;
	static bool prev_button = false;

	const bool curr_button = get_button();
	const uint16_t now = Watch::now();
	const uint16_t change_dur = now - prev_change;
	
	ButtonEvent button_event = beNone;
	
	for (uint8_t event_cnt = 0; event_cnt < NUM_EVENTS; ++event_cnt)
	{
		if (event_process(event_cnt, change_dur, curr_button, prev_button))
			button_event = events[event_cnt].event;
	}
	
	if (curr_button != prev_button)
	{
		if (*((int32_t*)curr_step) != 0)
		{
			dprint("%i %i\n", change_dur, Watch::ticks2ms(change_dur));
		}
		else
			dprint("\n");
	}

	if (curr_button != prev_button)
		prev_change = now;
	else if (change_dur > Watch::ms2ticks(4000))
		prev_change = now - Watch::ms2ticks(4000);

	prev_button = curr_button;
	
	return button_event;
}

int8_t RotEnc::get_delta()
{
	const uint8_t newAB = getAB();

	oldAB <<= 2;		// remember previous state
	oldAB |= newAB;		// add current state
	oldAB &= 0x0f;		// clear the extra bits
	
	static const int8_t lookup_table[0x10] PROGMEM =
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

	const int8_t lookup_val = pgm_read_byte(&lookup_table[oldAB]);
	delta_sum += lookup_val;

	const int8_t ret_val = delta_sum / 4;

	if (lookup_val)
		last_movement = Watch::now();

	if (ret_val)
		delta_sum -= ret_val * 4;
	else if (Watch::has_ms_passed_since(1000, last_movement)  &&  delta_sum != 0)
		delta_sum = 0;

	return ret_val;
}
