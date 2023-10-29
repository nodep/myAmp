#pragma once

struct Preset
{
	uint8_t		prog_num	= 0;
	uint8_t		mix			= 0x80;
	uint16_t	pots[3]		= { 0x800, 0x800, 0x800 };

	static const uint8_t MAX_PRESETS;

	void load(uint8_t prog);
	bool save();

	static uint8_t num_free_presets();
	static void dump_eeprom_presets();

	static uint8_t get_active_prog();
	static void save_active_prog(uint8_t prog);
};
