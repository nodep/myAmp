#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/pgmspace.h>

#include "hw_setup.h"
#include "timer.h"
#include "leds.h"
#include "utils.h"
#include "avrdbg.h"

// the current states of the LEDs
static uint8_t	led_state = 0;				// if not flashing or timeout displaying,
											// this contains the current state of the LEDs
											
// flashing state
static bool 	led_flashing = false;		// true if flashing (led_state is ignored)
static uint16_t	led_flash_started = 0;		// when flashing started
static uint8_t	led_flash_state = 0;		// the current state of the LEDs while flashing
static uint8_t	led_flash_mask = 0;			// mask to toggle on the LEDs while flashing
static bool		led_flash_prev = false;		// previous flash state
static uint8_t	led_flash_speed = 0;		// the flashing speed (0 is slowest)
static uint8_t	led_flash_repeats = 0;		// how many more times to flash (0 when forever)

// temping state
static bool 	led_temping = false;		// true if showing with timeout
static uint16_t	led_temp_started = 0;		// timeout started
static uint16_t led_temp_duration = 0;		// how long the message will stay

void led_init(void)
{
	// setup the SPI to communicate with the external shift register
	SetBit(DDR(LED_DATA_PORT), LED_DATA_BIT);
	SetBit(DDR(LED_CLOCK_PORT), LED_CLOCK_BIT);
	SetBit(DDR(LED_RST_PORT), LED_RST_BIT);
	SetBit(DDR(FV_CLK_PORT), FV_CLK_BIT);	// SS must be output
	
	SPCR = _BV(SPE) | _BV(MSTR);

	led_clear();
}

bool led_is_flashing(void)
{
	return led_flashing;
}

bool led_is_showing_with_timeout(void)
{
	return led_temping;
}

static void led_shift_byte(uint8_t byte)
{
	SPDR = byte;

	loop_until_bit_is_set(SPSR, SPIF);
}

void led_clear(void)
{
	led_flash_stop();
	
	// reset the LED shift registers
	ClrBit(PORT(LED_RST_PORT), LED_RST_BIT);
	
	// all LEDs off
	led_state = 0;
	
	led_temping = false;
	led_flashing = false;
	
	// raise the reset signal
	SetBit(PORT(LED_RST_PORT), LED_RST_BIT);
}

// RO		0b00000001
// RB		0b00000010
//
// 0 1		0b00000100
// 0 0
// 0 0
//
// 1 0		0b00001000
// 0 0
// 0 0
//
// 0 0		0b00010000
// 0 1
// 0 0
//
// 0 0		0b00100000
// 1 0
// 0 0
//
// 0 0		0b01000000
// 0 0
// 0 1
//
// 0 0		0b10000000
// 0 0
// 1 0

const uint8_t prog_lo_led_lookup[8] PROGMEM =
{
	0b00000000,	// 0
	0b10000000,	// 1
	0b00100000,	// 2
	0b10100000,	// 3
	0b00001000,	// 4
	0b10001000,	// 5
	0b00101000,	// 6
	0b10101000,	// 7
};

const uint8_t prog_hi_led_lookup[8] PROGMEM =
{
	0b00000000,	// 0
	0b01000000,	// 1
	0b00010000,	// 2
	0b01010000,	// 3
	0b00000100,	// 4
	0b01000100,	// 5
	0b00010100,	// 6
	0b01010100,	// 7
};

#define LED_MASK_ROTENC		0b00000011
#define LED_MASK_PROG		0b11111100

void led_show_program(const uint8_t program)
{
	const uint8_t new_prog = pgm_read_byte(&prog_lo_led_lookup[program & 7]) |
							 pgm_read_byte(&prog_hi_led_lookup[(program >> 3) & 7]);

	if (new_prog != (led_state & LED_MASK_ROTENC))
	{
		led_state &= LED_MASK_ROTENC;
		led_state |= new_prog;
		if (!led_flashing  &&  !led_temping)
			led_shift_byte(led_state);
	}
}

void led_show_rotenc(const bool orange, const bool blue)
{
	const uint8_t new_rotenc =	(orange ? _BV(0) : 0) |
								(blue   ? _BV(1) : 0);
	
	if (new_rotenc != (led_state & LED_MASK_ROTENC))
	{
		led_state &= LED_MASK_PROG;
		led_state |= new_rotenc;
		if (!led_flashing  &&  !led_temping)
			led_shift_byte(led_state);
	}
}

void led_poll(const uint16_t now)
{
	if (led_flashing)
	{
		const bool curr = ((now - led_flash_started) & _BV(14 - led_flash_speed));
		
		if (led_flash_prev != curr)
		{
			dprint("fr:%u\n", (uint16_t)led_flash_repeats);
			
			if (led_flash_repeats == 1)
			{
				led_flash_stop();
			}
			else
			{
				TogMask(led_flash_state, led_flash_mask);
				led_shift_byte(led_flash_state);
			}
			
			if (led_flash_repeats)
				--led_flash_repeats;

			led_flash_prev = curr;
		}
	}
	else if (led_temping)
	{
		if ((now - led_temp_started) > led_temp_duration)
		{
			led_shift_byte(led_state);
			led_temping = false;
			
			dprint("show timeout end\n");
		}
	}
}

void led_flash_start(const uint16_t now, const uint8_t leds, const uint8_t speed, const uint8_t repeats)
{
	led_flashing = true;
	led_flash_state = led_state;
	led_flash_mask = leds;
	led_flash_repeats = repeats;
	led_flash_started = now;
	led_flash_speed = speed;
	led_flash_prev = 0;

	TogMask(led_flash_state, led_flash_mask);
	led_shift_byte(led_flash_state);
	
	dprint("flash start\n");
}

void led_flash_stop(void)
{
	led_flashing = false;
	led_shift_byte(led_state);
	
	dprint("flash stop\n");
}

void led_show_with_timeout(const uint16_t now, const uint8_t leds, const uint16_t duration)
{
	led_temping = true;
	led_temp_started = now;
	led_temp_duration = duration;
	
	led_shift_byte(leds);
	
	dprint("show timeout start\n");
}
