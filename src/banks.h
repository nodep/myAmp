#pragma once

#include <avr/pgmspace.h>

#define NUM_EXT_PROGRAMS	52

extern const unsigned char fv1programs[NUM_EXT_PROGRAMS][0x200] PROGMEM;
