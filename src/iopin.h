#pragma once

#include <avr/io.h>

template <char Port, uint8_t PinNum>
class IoPin
{
protected:

	static_assert(Port >= 'A'  &&  Port <= 'G', "Bad Port in IoPin template argument");
	static_assert(PinNum <= 7, "Bad pin number n IoPin template argument");

	//////////////////
	// helpers
	//////////////////
	constexpr static PORT_t& get_port()
	{
		if constexpr (Port == 'A')
			return PORTA;
		else if constexpr (Port == 'B')
			return PORTB;
		else if constexpr (Port == 'C')
			return PORTC;
		else if constexpr (Port == 'D')
			return PORTD;
		else if constexpr (Port == 'E')
			return PORTE;

		return PORTF;
	}

	constexpr static register8_t& get_pinctrl()
	{
		if constexpr (PinNum == 0)
			return get_port().PIN0CTRL;
		else if constexpr (PinNum == 1)
			return get_port().PIN1CTRL;
		else if constexpr (PinNum == 2)
			return get_port().PIN2CTRL;
		else if constexpr (PinNum == 3)
			return get_port().PIN3CTRL;
		else if constexpr (PinNum == 4)
			return get_port().PIN4CTRL;
		else if constexpr (PinNum == 5)
			return get_port().PIN5CTRL;
		else if constexpr (PinNum == 6)
			return get_port().PIN6CTRL;

		return get_port().PIN7CTRL;
	}

	constexpr static VPORT_t& get_vport()
	{
		if constexpr (Port == 'A')
			return VPORTA;
		else if constexpr (Port == 'B')
			return VPORTB;
		else if constexpr (Port == 'C')
			return VPORTC;
		else if constexpr (Port == 'D')
			return VPORTD;
		else if constexpr (Port == 'E')
			return VPORTE;

		return VPORTF;
	}

	constexpr static uint8_t bitmask = 1 << PinNum;

public:

	//////////////////
	// configuration
	//////////////////
	static void dir_out()
	{
		get_vport().DIR |= bitmask;
	}

	static void dir_in()
	{
		get_vport().DIR &= ~bitmask;
	}

	static void invert()
	{
		get_pinctrl() |= PORT_INVEN_bm;
	}

	static void non_invert()
	{
		get_pinctrl() &= ~PORT_INVEN_bm;
	}

	//////////////////
	// output
	//////////////////
	static void high()
	{
		get_vport().OUT |= bitmask;
		//get_port().OUTSET = bitmask;
	}

	static void low()
	{
		get_vport().OUT &= ~bitmask;
		//get_port().OUTCLR = bitmask;
	}

	static void toggle()
	{
		get_vport().IN |= bitmask;
		//get_port().OUTTGL = bitmask;
	}

	static void set_value(const bool value)
	{
		if (value)
			high();
		else
			low();
	}

	//////////////////
	// input
	//////////////////
	static bool in()
	{
		return get_vport().IN & bitmask;
	}

	static void pullup()
	{
		get_pinctrl() |= PORT_PULLUPEN_bm;
	}

	static void pullup_off()
	{
		get_pinctrl() &= ~PORT_PULLUPEN_bm;
	}
};
