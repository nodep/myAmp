#pragma once

// inits the hardware
void led_init(void);

// clears the display
void led_clear(void);

// outputs the number of the program, the bank, and the two LEDs in the rotary encoder
void led_show_program(const uint8_t program);

// set the state of the two LEDs of the rotary encoder
void led_show_rotenc(const bool green, const bool blue);