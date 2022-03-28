#pragma once

void rotenc_init(void);
int8_t rotenc_delta(void);
bool rotenc_button(void);
bool rotenc_is_stable(void);

typedef enum
{
	be_none,
	be_single,
	be_double,
	be_long,
} rotenc_button_event_e;

rotenc_button_event_e rotenc_poll_button_event(void);
