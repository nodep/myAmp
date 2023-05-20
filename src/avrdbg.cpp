#include <stdio.h>

#include <avr/io.h>

#if _DEBUG

#include "hw.h"
#include "avrdbg.h"

static int serial_putchar(char c, FILE*)
{
	DebugUsart::send_byte(c);
	return 0;
}

void dbgInit()
{
	// we can't use FDEV_SETUP_STREAM, so we improvise
	static FILE mydbgout;
	
	mydbgout.buf = nullptr;
	mydbgout.put = serial_putchar;
	mydbgout.get = nullptr;
	mydbgout.flags = _FDEV_SETUP_WRITE;
	mydbgout.udata = 0;
	
	stdout = &mydbgout;

	// we have to TX configure for output
	dbg_tx::dir_out();

	// baud rate calc
	DebugUsart::set_baud(500000);

	// we only want TX, RX is not needed
	DebugUsart::enable(true, false);

	dprint("\ni live...\n");
}

void printi(uint32_t i)
{
	char buff[11];
	char* start = buff + 9;
	buff[9] = '0';
	buff[10] = '\0';
	for (uint8_t cnt = 9; cnt <= 9  &&  i; --cnt)
	{
		buff[cnt] = '0' + static_cast<char>(i % 10);
		if (buff[cnt] != '0')
			start = buff + cnt;
		i /= 10;
	}
	puts(start);
}

#endif	// _DEBUG
