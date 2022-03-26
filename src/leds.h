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

void led_flash_start(const uint16_t now, const uint8_t leds, const uint8_t speed, const uint8_t repeats);
void led_flash_stop(void);
bool led_is_flashing(void);

void led_poll(const uint16_t now);
