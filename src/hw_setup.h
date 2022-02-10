#pragma once

// the LED shift registers
#define LED_DATA_PORT	B
#define LED_DATA_BIT	1

#define LED_CLOCK_PORT	B
#define LED_CLOCK_BIT	0

#define LED_RST_PORT	C
#define LED_RST_BIT		0

// output pins for selecting the program on the FV-1
// S0, S1 and S2 must be on the same port!!!
#define S0_PORT			C
#define S0_BIT			3

#define S1_PORT			C
#define S1_BIT			2

#define S2_PORT			C
#define S2_BIT			1

#define T0_PORT			D
#define T0_BIT			2

// FV_CLK clock for the FV-1
#define FV_CLK_PORT		B
#define FV_CLK_BIT		2

// rotary encoder
#define ROT_SW_PORT		D
#define ROT_SW_BIT		7

#define ROT_A_PORT		D
#define ROT_A_BIT		6

#define ROT_B_PORT		D
#define ROT_B_BIT		5
