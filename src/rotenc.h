#pragma once

#include <avr/pgmspace.h>

class RotEnc
{
public:

	enum ButtonEvent: uint8_t 
	{
		beNone,
		beSingle,
		beDouble,
		beLong,
		beLongShort,
	};

private:

	uint8_t		oldAB = 0;
	int8_t		delta_sum = 0;
	uint16_t	last_movement = 0;

	// used by get_button_event()
	uint16_t	prev_event_change = 0;
	bool		prev_event_button = false;

	// used by get_button()
	bool		prev_btn = false;
	bool		in_debounce = false;
	bool		debounced_btn = false;
	uint16_t	debounce_start = 0;

	struct change_t
	{
		uint16_t	at_least;
		uint16_t	at_most;
	};

	struct event_t
	{
		RotEnc::ButtonEvent		event;
		const change_t*			changes;
	};

	static const uint8_t NUM_EVENTS = 4;

	static const change_t changes_single[];
	static const change_t changes_double[];
	static const change_t changes_long[] ;
	static const change_t changes_long_short[];

	static const event_t events[NUM_EVENTS];

	uint8_t curr_step[NUM_EVENTS] = {0, 0, 0, 0};
	
	bool event_process(uint8_t event_cnt, uint16_t change_dur, bool curr_button, bool prev_button);

	static uint8_t getAB()
	{
		return (fv1k_re_a::in() ? 0 : 2) | (fv1k_re_b::in() ? 0 : 1);
	}

	static bool is_stable()
	{
		return getAB() == 0;
	}

	bool get_button();
	
public:

	RotEnc();

	int8_t get_delta();

	ButtonEvent get_button_event();
};
