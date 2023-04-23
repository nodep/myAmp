#pragma once

#include <stdint.h>
#include <stdbool.h>

// inits the hardware
void led_init(void);

// clears the display
void led_clear(void);

// outputs the number of the program, the bank, and the two LEDs in the rotary encoder
void led_show_program(const uint8_t program);

// set the state of the two LEDs of the rotary encoder
void led_show_rotenc(const bool orange, const bool blue);

// flashing
void led_flash_start(const uint16_t now, const uint8_t leds, const uint16_t interval, const uint8_t repeats);
void led_flash_stop(void);
bool led_is_flashing(void);

// show leds, then revert to normal after timeout
void led_show_with_timeout(const uint16_t now, const uint8_t leds, const uint16_t duration);
bool led_is_showing_with_timeout(void);

void led_poll(const uint16_t now);
