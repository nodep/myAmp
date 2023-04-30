#pragma once

#include "iopin.h"
#include "timera.h"
#include "usart.h"
#include "spimaster.h"
#include "i2c.h"
#include "watch.h"

// screen & touchscreen
using s_led		= IoPin<'A', 7>;
using s_cs		= IoPin<'B', 0>;
using s_rst		= IoPin<'B', 1>;
using s_dc		= IoPin<'B', 2>;
using s_mosi	= IoPin<'B', 4>;
using s_miso	= IoPin<'B', 5>;
using s_sck		= IoPin<'B', 6>;

using ts_cs		= IoPin<'B', 3>;
using ts_irq	= IoPin<'B', 7>;

using s_spi		= SpiMaster<1, 6>;

// FV-1
using fv1_clip		= IoPin<'E', 6>;
using fv1_t0		= IoPin<'E', 7>;
using fv1_s0		= IoPin<'F', 4>;
using fv1_s1		= IoPin<'F', 5>;
using fv1_s2		= IoPin<'F', 6>;
using fv1_p0		= IoPin<'G', 0>;
using fv1_p1		= IoPin<'G', 1>;
using fv1_p2		= IoPin<'G', 2>;
using fv1_sda		= IoPin<'F', 2>;
using fv1_scl		= IoPin<'F', 3>;
using fv1_i2c		= I2C<1>;

// digipot mix
using dp_mix_sda	= IoPin<'C', 2>;
using dp_mix_scl	= IoPin<'C', 3>;
using dp_mix_i2c	= I2C<0>;

const uint8_t dp_mix_address = 0b101111;

// PWM for FV-1 pots
using fv1_pwm_timer	= TimerA<0, 1>;

// FV-1 knobs
using fv1k_led		= IoPin<'D', 3>;
using fv1k_re_a		= IoPin<'D', 4>;
using fv1k_re_sw	= IoPin<'D', 5>;
using fv1k_re_b		= IoPin<'D', 6>;
using fv1k_pot1		= IoPin<'E', 2>;
using fv1k_pot2		= IoPin<'E', 3>;
using fv1k_pot3		= IoPin<'E', 4>;
using fv1k_pot4		= IoPin<'E', 5>;

// power amp
using pa_fault		= IoPin<'A', 0>;
using pa_reset		= IoPin<'A', 1>;
using pa_mute		= IoPin<'A', 2>;
using pa_otw_clip	= IoPin<'G', 7>;

// pedals/footswitches UART
using pdl_tx		= IoPin<'E', 0>;
using pdl_rx		= IoPin<'E', 1>;
using pdl_usart		= Usart<4>;

// misc
using in_v			= IoPin<'D', 7>;
using dbg_tx		= IoPin<'A', 4>;
using dbg_pin		= IoPin<'A', 3>;

// timekeeping: 1 tick == 0.9765625ms
using Watch = RTClock<32>;

void init_hw();