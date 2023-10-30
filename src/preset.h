#pragma once

struct Preset
{
	uint8_t		prog_num	= 0;
	uint8_t		mix			= 0x80;
	uint16_t	pots[3]		= { 0x800, 0x800, 0x800 };

	static const uint8_t MAX_PRESETS;

	void load(uint8_t prog);
	bool save();
	void load_active_prog();
	void save_active_prog();

	static uint8_t num_free_presets();
	static void dump_eeprom_presets();
};
