#pragma once

#ifdef __ASSEMBLER__

#define temp		r3
#define tempH		r20
#define prevState	r21

#else
	
#include <avr/pgmspace.h>

// the LED shift registers
#define LED_DATA_PORT	D
#define LED_DATA_BIT	5

#define LED_CLOCK_PORT	D
#define LED_CLOCK_BIT	6

#define LED_RST_PORT	D
#define LED_RST_BIT		7

// output pins for selecting the program on the FV-1
#define S0_PORT			C
#define S0_BIT			3

#define S1_PORT			C
#define S1_BIT			2

#define S2_PORT			C
#define S2_BIT			1

#define T0_PORT			C
#define T0_BIT			0

// unused at the moment
#define WP_PORT			C
#define WP_BIT			6

#define A0_PORT			C
#define A0_BIT			7

// rotary encoder
#define ROT_SW_PORT		B
#define ROT_SW_BIT		1

#define ROT_A_PORT		B
#define ROT_A_BIT		0

#define ROT_B_PORT		B
#define ROT_B_BIT		2

extern const uint8_t progAddress[0x200] PROGMEM;

// we must have FV-1 pins on the same port to make things simpler
#if S0_PORT != S1_PORT  ||  S1_PORT != S2_PORT  ||  T0_PORT != S0_PORT
#	error "SO, S1, S2 and T0 must all be on the same port"
#endif

#endif