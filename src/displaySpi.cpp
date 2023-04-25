#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw.h"
#include "avrdbg.h"
#include "displaySpi.h"

enum DisplayCommands : uint8_t
{
	cmdNOP = 0x00,
	cmdSoftReset = 0x01,
	cmdReadID = 0x04,
	cmdReadStatus = 0x09,

	cmdSleepIn = 0x10,
	cmdSleepOut = 0x11,
	cmdPartialModeOn = 0x12,
	cmdNormalModeOn = 0x13,

	cmdInvertOff = 0x20,
	cmdInvertOn = 0x21,
	cmdGammaSet = 0x26,
	cmdDisplayOff = 0x28,
	cmdDisplayOn = 0x29,
	cmdColumnAddressSet = 0x2A,
	cmdRowAddressSet = 0x2B,
	cmdMemoryWrite = 0x2C,
	cmdMemoryRead = 0x2E,

	cmdPartialArea = 0x30,
	cmdTearingEffectLineOff = 0x34,
	cmdTearingEffectLineOn = 0x35,
	cmdMemoryAccessControl = 0x36,
	cmdVerticalScrollStartAddress = 0x37,
	cmdPixelFormat = 0x3A,

	cmdReadID1 = 0xDA,
	cmdReadID2 = 0xDB,
	cmdReadID3 = 0xDC,
	cmdReadID4 = 0xDD,

	cmdFrameRateControl1 = 0xB1,
	cmdFrameRateControl2 = 0xB2,
	cmdFrameRateControl3 = 0xB3,
	cmdInvertControl = 0xB4,
	cmdDisplayFunctionControl = 0xB6,

	cmdPowerControl1 = 0xC0,
	cmdPowerControl2 = 0xC1,
	cmdPowerControl3 = 0xC2,
	cmdPowerControl4 = 0xC3,
	cmdPowerControl5 = 0xC4,
	cmdVCOMControl1 = 0xC5,
	cmdVCOMControl2 = 0xC7,

	cmdPowerControlA = 0xCB,
	cmdPowerControlB = 0xCF,

	cmdDriverTimingControlA1 = 0xE8,		// ILI9341
	cmdDriverTimingControlA2 = 0xE9,
	cmdDriverTimingControlB = 0xEA,
	cmdPowerOnSequenceControl = 0xED,

	cmdPositiveGammaCorrection = 0xE0,
	cmdNegativeGammaCorrection = 0xE1,

	cmdEnable3G = 0xF2,

	cmdPumpRatioControl = 0xF7,

	flagMemoryAccessMY = 0x80,		// memory access and color order flags
	flagMemoryAccessMX = 0x40,
	flagMemoryAccessMV = 0x20,
	flagMemoryAccessML = 0x10,
	flagMemoryAccessMH = 0x04,
	flagMemoryAccessBGR = 0x08,
	flagMemoryAccessRGB = 0x00,

	flagDelay = 0x80,	// special signifier for command lists
};

static const uint8_t init9341[] PROGMEM =
{
	0xEF, 3,
		0x03, 0x80, 0x02,
	cmdPowerControlB, 3,
		0x00, 0xC1, 0x30,
	cmdPowerOnSequenceControl, 4,
		0x64, 0x03, 0x12, 0x81,
	cmdDriverTimingControlA1, 3,
		0x85, 0x00, 0x78,
	cmdPowerControlA, 5,
		0x39, 0x2C, 0x00, 0x34, 0x02,
	cmdPumpRatioControl, 1,
		0x20,
	cmdDriverTimingControlB, 2,
		0x00, 0x00,
	cmdPowerControl1, 1,
		0x23,					// Power control VRH[5:0]
	cmdPowerControl2, 1,
		0x10,					// Power control SAP[2:0];BT[3:0]
	cmdVCOMControl1, 2,
		0x3e, 0x28,				// VCM control
	cmdVCOMControl2, 1,
		0x86,					// VCM control2
	cmdMemoryAccessControl, 1,	// Rotation:
		0xE8,					// 0x88: portrait, pins up
								// 0x28: landscape, pins right
								// 0x48: portrait, pins down
								// 0xE8: landscape, pins left
	cmdVerticalScrollStartAddress, 1,
		0x00,					// Vertical scroll zero
	cmdPixelFormat, 1,
		0x55,
	cmdFrameRateControl1, 2,
		0x00, 0x18,
	cmdDisplayFunctionControl, 3,
		0x08, 0x82, 0x27,		// Display Function Control
	cmdEnable3G, 1,
		0x00,					// 3Gamma Function Disable
	cmdGammaSet, 1,
		0x01,					// Gamma curve selected
	cmdPositiveGammaCorrection, 15,
		0x0F, 0x31, 0x2B, 0x0C, 0x0E,	// Set Gamma
		0x08, 0x4E, 0xF1, 0x37, 0x07,
		0x10, 0x03, 0x0E, 0x09, 0x00,
	cmdNegativeGammaCorrection, 15,
		0x00, 0x0E, 0x14, 0x03, 0x11,	// Set Gamma
		0x07, 0x31, 0xC1, 0x48, 0x08,
		0x0F, 0x0C, 0x31, 0x36, 0x0F,
	cmdSleepOut, flagDelay,				// Exit Sleep
		150,
	cmdDisplayOn, flagDelay,			// Display on
		150,

	0x00	// EOF
};

// 7735R init
static const uint8_t init7735[] PROGMEM =
{										
	cmdSoftReset, flagDelay,			// Software reset, 0 args, w/delay
		150,							// 150 ms delay
	cmdSleepOut, flagDelay,				// Out of sleep mode, 0 args, w/delay
		255,							// 500 ms delay
	cmdFrameRateControl1, 3,			// Framerate ctrl - normal mode, 3 arg:
		0x01, 0x2C, 0x2D,				// Rate = fosc/(1x2+40) * (LINE+2C+2D)
	cmdFrameRateControl2, 3,			// Framerate ctrl - idle mode, 3 args:
		0x01, 0x2C, 0x2D,				// Rate = fosc/(1x2+40) * (LINE+2C+2D)
	cmdFrameRateControl3, 6,			// Framerate - partial mode, 6 args:
		0x01, 0x2C, 0x2D,				// Dot inversion mode
		0x01, 0x2C, 0x2D,				// Line inversion mode
	cmdInvertControl, 1,				// Display inversion ctrl, 1 arg:
		0x07,							// No inversion
	cmdPowerControl1, 3,				// Power control, 3 args:
		0xA2,
		0x02,							// -4.6V
		0x84,							// AUTO mode
	cmdPowerControl2, 1,				// Power control, 1 arg:
		0xC5,							// VGH25=2.4C VGSEL=-10 VGH=3 * AVDD
	cmdPowerControl3, 2,				// Power control, 2 args:
		0x0A,							// Opamp current small
		0x00,							// Boost frequency
	cmdPowerControl4, 2,				// Power control, 2 args:
		0x8A,							// BCLK/2,
		0x2A,							// opamp current small & medium low
	cmdPowerControl5, 2,				// Power control, 2 args:
		0x8A, 0xEE,
	cmdVCOMControl1, 1,					// Power control, 1 arg:
		0x0E,
	cmdInvertOff, 0,					// Don't invert display, no args
	cmdMemoryAccessControl, 1,			// Rotation:
		0x00,							// 0x00: portrait, pins up
										// 0xA0: landscape, pins right
										// 0xC0: portrait, pins down
										// 0x60: landscape, pins left

	cmdPixelFormat, 1,					// set color mode, 1 arg:
		0x05,							// 16-bit color

	cmdNormalModeOn, flagDelay,			// Normal display on, no args, w/delay
		10,								// 10 ms delay
	cmdDisplayOn, flagDelay,			// Main screen turn on, no args w/delay
		100,							// 100 ms delay

	0x00,								// EOF
};

void Display::init()
{
	// setup the SPI pins
	s_mosi::dir_out();
	s_sck::dir_out();

	s_rst::low();
	s_rst::dir_out();

	s_cs::high();
	s_cs::dir_out();

	s_dc::high();
	s_dc::dir_out();

	_delay_ms(100);
	s_rst::high();
	_delay_ms(200);

	s_led::invert();
	s_led::dir_out();
	s_led::low();
	
	s_spi::init();

	const uint8_t* addr = init9341;

	uint8_t cmd;
	while ((cmd = pgm_read_byte(addr++)) != 0)
	{
		// number of args to follow
		uint8_t numArgs = pgm_read_byte(addr++);

		// if the hibit is set, delay time follows args
		uint16_t ms = static_cast<uint8_t>(numArgs & flagDelay);

		// mask out delay bit
		numArgs &= ~flagDelay;
		send_init_command(cmd, addr, numArgs);
		addr += numArgs;

		if (ms)
		{
			// Read post-command delay time (ms)
			ms = pgm_read_byte(addr++);
			if (ms == 255)
				ms = 500;
			while (ms--)
				_delay_ms(1);
		}
	}
}

void Display::on()
{
	Transaction t;
	send_command(cmdDisplayOn);
}

void Display::off()
{
	Transaction t;
	send_command(cmdDisplayOff);
}

void Display::send_init_command(const uint8_t commandByte, const uint8_t* dataBytes, const uint8_t numDataBytes)
{
	Transaction t;

	send_command(commandByte);

	for (int i = 0; i < numDataBytes; i++)
		s_spi::send(pgm_read_byte(dataBytes++));
}

void Display::set_addr_window(const Coord x, const Coord y, const Coord w, const Coord h)
{
	send_command(cmdColumnAddressSet);	// column addr set
	s_spi::send16(x);
	s_spi::send16(x + w - 1);

	send_command(cmdRowAddressSet);		// row addr set
	s_spi::send16(y);
	s_spi::send16(y + h - 1);

	send_command(cmdMemoryWrite);		// write to RAM
}
