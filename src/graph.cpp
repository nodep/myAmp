#include <stdint.h>
#include <stdlib.h>

#include <avr/io.h>
#include <avr/pgmspace.h>

#include "graph.h"
#include "graphtext.h"

ColorRGB customGraphCol = rgbBlack;

const GFXfont* currentLargeFont = nullptr;

uint16_t get_text_width_large(const char* text)
{
	const uint8_t first = pgm_read_byte(&currentLargeFont->first);
	uint16_t result = 0;
	while (*text)
	{
		const uint8_t c = *text;

		if (c >= first)
		{
			const GFXglyph* glyph = pgm_read_glyph_ptr(currentLargeFont, c - first);
			result += pgm_read_byte(&glyph->xAdvance);
		}

		++text;
	}

	return result;
}
