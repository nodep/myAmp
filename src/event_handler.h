#pragma once

void event_poll(const uint16_t now);
bool event_is_selecting_prog(void);
bool event_should_reset_fvclk(void);