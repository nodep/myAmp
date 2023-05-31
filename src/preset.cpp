#include <stdio.h>

#include <avr/eeprom.h>
#include <avr/pgmspace.h>

#include "avrdbg.h"

#include "preset.h"
#include "programs.h"

const uint8_t Preset::max_num_presets = EEPROM_SIZE / sizeof(Preset);

void Preset::load(const uint8_t prog)
{
	// try to get the preset from eeprom
	for (uint8_t slot_cnt = 0; slot_cnt < max_num_presets; slot_cnt++)
	{
		const uint8_t* slot_ptr = (uint8_t*)(sizeof(Preset) * slot_cnt);

		// read the program number for the slot
		const uint8_t saved_prog_num = eeprom_read_byte(slot_ptr);

		// empty slot?
		if (saved_prog_num == 0xff)
			break;

		if (saved_prog_num == prog)
		{
			eeprom_read_block(this, slot_ptr, sizeof(Preset));
			return;
		}
	}

	// get the preset from flash
	const ProgParams* paramsPtr = (const ProgParams*)(pgm_read_word(fv1_programs[prog].params));
	mix = pgm_read_byte(&paramsPtr->mix);
	pots[0] = pgm_read_word(paramsPtr->pots);
	pots[1] = pgm_read_word(paramsPtr->pots + 1);
	pots[2] = pgm_read_word(paramsPtr->pots + 2);
}

bool Preset::save()
{
	// try to save the preset to eeprom
	for (uint8_t slot_cnt = 0; slot_cnt < max_num_presets; slot_cnt++)
	{
		uint8_t* const slot_ptr = (uint8_t*)(sizeof(Preset) * slot_cnt);

		// read the program number for the slot
		const uint8_t saved_prog_num = eeprom_read_byte(slot_ptr);

		// found this program or reached the end pf saved presets?
		if (saved_prog_num == prog_num  ||  saved_prog_num == 0xff)
		{
			eeprom_update_block(this, slot_ptr, sizeof(Preset));
			return true;
		}
	}

	return false;
}

uint8_t Preset::num_free_presets()
{
	// iterate through saved presets
	for (uint8_t slot_cnt = 0; slot_cnt < max_num_presets; slot_cnt++)
	{
		const uint8_t* slot_ptr = (uint8_t*)(sizeof(Preset) * slot_cnt);

		// read the program number for the slot
		const uint8_t saved_prog_num = eeprom_read_byte(slot_ptr);

		// empty slot?
		if (saved_prog_num == 0xff)
			return max_num_presets - slot_cnt;
	}

	return 0;
}

void Preset::dump_presets()
{
	Preset p;

	// iterate through saved presets
	for (uint8_t slot_cnt = 0; slot_cnt < max_num_presets; slot_cnt++)
	{
		const uint8_t* slot_ptr = (uint8_t*)(sizeof(Preset) * slot_cnt);

		// read the program number for the slot
		eeprom_read_block(&p, slot_ptr, sizeof(Preset));

		if (p.prog_num != 0xff)
		{
			// TODO: read the program name from flash
			char progName[128] = { 0 };
			dprint("prog=%s\n\"params\": [ %u, %u, %u, %u ],\n", progName, p.mix, p.pots[0], p.pots[1], p.pots[2]);
		}
	}
}
