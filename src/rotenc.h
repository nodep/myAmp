#pragma once

void rotenc_init();
int8_t rotenc_delta();
bool rotenc_button();
bool rotenc_is_stable();

typedef enum
{
	be_none,
	be_single,
	be_double,
	be_long,
	be_long_short,
} rotenc_button_event_e;

rotenc_button_event_e rotenc_poll_button_event();
