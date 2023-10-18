#include <avr/io.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "powamp.h"
#include "fv1.h"
#include "adc.h"

void mcu_init()
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

	////////////////
	// MCU pin mux
	////////////////

	// debug TX on UART
	PORTMUX.USARTROUTEA = PORTMUX_USART0_0_bm;	// ALT -> PA4 is TX

	// SPI for display/touchscreen
	PORTMUX.SPIROUTEA = PORTMUX_SPI1_1_bm;		// ALT2 -> PB4 is MOSI...

	// I2C for digi pots
	PORTMUX.TWIROUTEA = PORTMUX_TWI0_1_bm;		// ALT2 -> PC2 is SDA, PC3 is SCL

	// PWM for FV-1 pots
	PORTMUX.TCAROUTEA = 6;		// PWM WaveOut on PORTG
}

void init_hw()
{
	mcu_init();
	dbgInit();

	dbg_pin::dir_out();
	dbg_pin::high();

	Watch::start();

	ADC::init();

	powamp_init();
}
