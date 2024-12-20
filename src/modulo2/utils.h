#pragma once

// bit set/clear/toggle
#define SetBit(var, bit)	((var) |= (uint8_t)  _BV(bit))
#define ClrBit(var, bit)	((var) &= (uint8_t) ~_BV(bit))
#define TogBit(var, bit)	((var) ^= (uint8_t)  _BV(bit))


// several bits set/clear/toggle
#define SetMask(var, mask)	((var) |= (uint8_t)  (mask) )
#define ClrMask(var, mask)	((var) &= (uint8_t) ~(mask) )
#define TogMask(var, mask)	((var) ^= (uint8_t)  (mask) )


// port helpers
#define pp_replace(a, b)	a##b
#define PORT(a)				pp_replace(PORT, a)
#define DDR(a)				pp_replace(DDR, a)
#define PIN(a)				pp_replace(PIN, a)


// set and clear bit values
#define _B0(b)		0
#define _B1(b)		_BV(b)
