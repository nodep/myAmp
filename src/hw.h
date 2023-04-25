#pragma once

#include "iopin.h"
#include "timera.h"
#include "usart.h"
#include "spimaster.h"
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
using fv1_mix_sda	= IoPin<'C', 2>;
using fv1_mix_scl	= IoPin<'C', 3>;
using fv1_clip		= IoPin<'E', 6>;
using fv1_t0		= IoPin<'E', 7>;
using fv1_s0		= IoPin<'F', 4>;
using fv1_s1		= IoPin<'F', 5>;
using fv1_s2		= IoPin<'F', 6>;
using fv1_sda		= IoPin<'F', 2>;
using fv1_scl		= IoPin<'F', 3>;

// FV-1 knobs
using fv1k_led		= IoPin<'D', 3>;
using fv1k_re_a		= IoPin<'D', 4>;
using fv1k_re_sw	= IoPin<'D', 5>;
using fv1k_re_b		= IoPin<'D', 6>;

// power amp
using pa_fault		= IoPin<'A', 0>;
using pa_reset		= IoPin<'A', 1>;
using pa_mute		= IoPin<'A', 2>;
using pa_otw_clip	= IoPin<'G', 7>;

// misc
using in_v			= IoPin<'D', 7>;
using dbg_tx		= IoPin<'A', 4>;

using Watch = RTClock<16384>;

void init_hw();