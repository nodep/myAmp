#include <stdio.h>

#include <avr/io.h>

#include "hw.h"
#include "avrdbg.h"

static void init_mcu()
{
	CPU_CCP = CCP_IOREG_gc;
#if   F_CPU == 1000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_1M_gc;
#elif F_CPU == 2000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_2M_gc;
#elif F_CPU == 3000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_3M_gc;
#elif F_CPU == 4000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_4M_gc;
#elif F_CPU == 8000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_8M_gc;
#elif F_CPU == 12000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_12M_gc;
#elif F_CPU == 16000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_16M_gc;
#elif F_CPU == 20000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_20M_gc;
#elif F_CPU == 24000000
	CLKCTRL.OSCHFCTRLA = CLKCTRL_AUTOTUNE_bm | CLKCTRL_FRQSEL_24M_gc;
#else
	#error Unknown F_CPU setting
#endif

	// MCU pin mux
	PORTMUX.USARTROUTEA = PORTMUX_USART0_0_bm;	// ALT -> PA4 is TX
	PORTMUX.SPIROUTEA = PORTMUX_SPI1_1_bm;		// ALT2 -> PB4 is MOSI
	
	// TimerA 1 PWM to PORTC
	//PORTMUX.TCAROUTEA = PORTMUX_TCA1_0_bm;

	// USART 3 is on ALT1: TX->PB4 RX->PB5
	//PORTMUX.USARTROUTEA = PORTMUX_USART3_0_bm;
}

void init_fv1()
{
	fv1_clip::dir_in();
	
	fv1_t0::dir_out();
	fv1_t0::low();

	fv1_s0::dir_out();
	fv1_s0::low();
	
	fv1_s1::dir_out();
	fv1_s1::low();
	
	fv1_s2::dir_out();
	fv1_s2::low();
}

// init the CPU clock, PORTMUX, and onboard LED and button
void init_hw()
{
	init_mcu();
	dbgInit();
	Watch::start();

	pa_fault::dir_in();

	init_fv1();
}
