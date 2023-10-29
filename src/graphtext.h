#pragma once

#include <string.h>

#include "graph.h"

// Font data stored PER GLYPH
struct GFXglyph
{
	uint16_t	bitmapOffset;	// Pointer into GFXfont->bitmap
	uint8_t		width;			// Bitmap dimensions in pixels
	uint8_t		height;			// Bitmap dimensions in pixels
	uint8_t		xAdvance;		// Distance to advance cursor (x axis)
	int8_t		xOffset;		// X dist from cursor pos to UL corner
	int8_t		yOffset;		// Y dist from cursor pos to UL corner
};

// Data stored for FONT AS A WHOLE
struct GFXfont
{
	const uint8_t*	bitmap;		// Glyph bitmaps, concatenated
	const GFXglyph*	glyph;		// Glyph array
	char			first;		// ASCII extents (first char)
	char			last;		// ASCII extents (last char)
	uint8_t			yAdvance;	// Newline distance (y axis)
	uint8_t			yOffset;	// Top of the character to baseline
};

extern const GFXfont FreeMono9pt7b;
extern const GFXfont FreeMono12pt7b;
extern const GFXfont FreeMono18pt7b;
extern const GFXfont FreeMono24pt7b;
extern const GFXfont FreeMonoBold9pt7b;
extern const GFXfont FreeMonoBold12pt7b;
extern const GFXfont FreeMonoBold18pt7b;
extern const GFXfont FreeMonoBold24pt7b;
extern const GFXfont FreeSans9pt7b;
extern const GFXfont FreeSans12pt7b;
extern const GFXfont FreeSans18pt7b;
extern const GFXfont FreeSans24pt7b;
extern const GFXfont FreeSansBold9pt7b;
extern const GFXfont FreeSansBold12pt7b;
extern const GFXfont FreeSansBold18pt7b;
extern const GFXfont FreeSansBold24pt7b;
extern const GFXfont FreeSerif9pt7b;
extern const GFXfont FreeSerif12pt7b;
extern const GFXfont FreeSerif18pt7b;
extern const GFXfont FreeSerif24pt7b;
extern const GFXfont FreeSerifBold9pt7b;
extern const GFXfont FreeSerifBold12pt7b;
extern const GFXfont FreeSerifBold18pt7b;
extern const GFXfont FreeSerifBold24pt7b;
extern const GFXfont Org_01;

extern const uint8_t lcdfont[256 * 5];

extern const GFXfont* currentLargeFont;

inline void* pgm_read_pointer(const void* addr)
{
	return (void*) pgm_read_word(addr);
}
 
inline GFXglyph* pgm_read_glyph_ptr(const GFXfont* largeFont, const uint8_t c)
{
	return &static_cast<GFXglyph*>(pgm_read_pointer(&largeFont->glyph))[c];
}

inline uint8_t* pgm_read_bitmap_ptr(const GFXfont* largeFont)
{
	return static_cast<uint8_t*>(pgm_read_pointer(&largeFont->bitmap));
}

template <typename Canvas, typename ColorT>
void print_char_small(Canvas& canvas, const Coord x, const Coord y, const unsigned char c, const ColorT color, const ColorT bgcolor)
{
	if (x >= Canvas::Width		// Clip right
		|| y >= Canvas::Height	// Clip bottom
		|| x + 6 - 1 < 0		// Clip left
		|| y + 8 - 1 < 0)		// Clip top
		return;

	// char bitmap = 5 columns
	for (int8_t i = 0; i < 5; i++)
	{
		Coord line = pgm_read_byte(&lcdfont[c * 5 + i]);
		for (Coord j = 0; j < 8; j++, line >>= 1)
		{
			if (line & 1)
				canvas.pixel(x + i, y + j, color);
			else if (bgcolor != color)
				canvas.pixel(x + i, y + j, bgcolor);
		}
	}

	// if opaque, draw vertical line for last column
	if (bgcolor != color)
		canvas.vline(x + 5, y, 8, bgcolor);
}

template <typename Canvas, typename ColorT>
void print_char_large(Canvas& canvas, const Coord x, const Coord y, unsigned char c, const ColorT color)
{
	c -= pgm_read_byte(&currentLargeFont->first);

	const GFXglyph* glyph = pgm_read_glyph_ptr(currentLargeFont, c);
	const uint8_t* bitmap = pgm_read_bitmap_ptr(currentLargeFont);

	uint16_t bo = pgm_read_word(&glyph->bitmapOffset);
	const uint8_t w = pgm_read_byte(&glyph->width);
	const uint8_t h = pgm_read_byte(&glyph->height);
	const int8_t xo = pgm_read_byte(&glyph->xOffset);
	const int8_t yo = pgm_read_byte(&glyph->yOffset);
	uint8_t bits = 0, bit = 0;

	for (Coord yy = 0; yy < h; yy++)
	{
		for (Coord xx = 0; xx < w; xx++)
		{
			if ((bit++ & 7) == 0)
				bits = pgm_read_byte(&bitmap[bo++]);

			if (bits & 0x80)
				canvas.pixel(x + xo + xx, y + yo + yy, color);

			bits <<= 1;
		}
	}
}

template <typename Canvas, typename ColorT>
void print_small(Canvas& canvas, const char* str, const Coord x, const Coord y, const ColorT color, const ColorT bgcolor)
{
	[[maybe_unused]] typename Canvas::Transaction t;

	Coord cursor_x = x;
	Coord cursor_y = y;

	const bool wrap = false;

	while (*str)
	{
		const char c = *str++;

		if (wrap  &&  cursor_x + 6 > Canvas::Width)
		{
			cursor_x = x;
			cursor_y += 8;
		}
		print_char_small(canvas, cursor_x, cursor_y, c, color, bgcolor);
		cursor_x += 6;
	}
}

template <typename Canvas, typename ColorT>
void print_large(Canvas& canvas, const char* str, const Coord x, const Coord y, const ColorT color)
{
	[[maybe_unused]] typename Canvas::Transaction t;

	Coord cursor_x = x;
	Coord cursor_y = y + pgm_read_byte(&currentLargeFont->yOffset);

	const bool wrap = false;

	while (*str)
	{
		const char c = *str++;
		const uint8_t first = pgm_read_byte(&currentLargeFont->first);
		if (c >= first  &&  c <= pgm_read_byte(&currentLargeFont->last))
		{
			const GFXglyph* glyph = pgm_read_glyph_ptr(currentLargeFont, c - first);
			const uint8_t w = pgm_read_byte(&glyph->width);
			const uint8_t h = pgm_read_byte(&glyph->height);

			if (w > 0  &&  h > 0)
			{
				const int16_t xo = static_cast<int8_t>(pgm_read_byte(&glyph->xOffset));
				if (wrap  &&  cursor_x + xo + w > Canvas::Width)
				{
					cursor_x = 0;
					cursor_y += pgm_read_byte(&currentLargeFont->yAdvance);
				}
				print_char_large(canvas, cursor_x, cursor_y, c, color);
			}

			cursor_x += pgm_read_byte(&glyph->xAdvance);
		}
	}
}

inline uint16_t get_text_width_small(const char* text)
{
	return static_cast<uint16_t>(6 * strlen(text));
}

uint16_t get_text_width_large(const char* text);

inline void set_large_font(const GFXfont& pFont)
{
	currentLargeFont = &pFont;
}
