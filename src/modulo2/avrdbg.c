#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <avr/io.h>
#include <avr/power.h>

#if DBGPRINT

#define BAUD 57600
#include <util/setbaud.h>

#include "avrdbg.h"
#include "hw_setup.h"

static int serial_putchar(char c, FILE *stream);
static FILE mystdout = FDEV_SETUP_STREAM(serial_putchar, NULL, _FDEV_SETUP_WRITE);

static int serial_putchar(char c, FILE *stream)
{
    loop_until_bit_is_set(UCSR0A, UDRE0);
    UDR0 = c;
    return 0;
}

void dbgInit(void)
{
	power_usart0_enable();		// power to the USART

    // USART Baud rate:
    UBRR0H = UBRRH_VALUE;
    UBRR0L = UBRRL_VALUE;
    // RX is not used, only TX
    UCSR0B = _BV(TXEN0) /* | _BV(RXEN0) */;

    stdout = &mystdout;
}

void printi(uint32_t i)
{
	char buff[11];
	char* start = buff + 9;
	buff[9] = '0';
	buff[10] = '\0';
	for (uint8_t cnt = 9; cnt <= 9  &&  i; --cnt)
	{
		buff[cnt] = '0' + i % 10;
		if (buff[cnt] != '0')
			start = buff + cnt;
		i /= 10;
	}
	puts(start);
}

#endif	// DBGPRINT
