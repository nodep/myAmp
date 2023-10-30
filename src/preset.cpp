#include <avr/eeprom.h>
#include <avr/pgmspace.h>

#include "avrdbg.h"

#include "preset.h"
#include "programs.h"

const uint16_t PRESETS_BEGIN_AT = 1;
const uint8_t Preset::MAX_PRESETS = (EEPROM_SIZE - PRESETS_BEGIN_AT) / sizeof(Preset);

void Preset::load(const uint8_t prog)
{
	dprint("loading %i\n", prog);

	// try to get the preset from eeprom
	for (uint8_t slot_cnt = 0; slot_cnt < MAX_PRESETS; slot_cnt++)
	{
		const uint8_t* slot_ptr = (uint8_t*)(PRESETS_BEGIN_AT + sizeof(Preset) * slot_cnt);

		// read the program number for the slot
		const uint8_t saved_prog_num = eeprom_read_byte(slot_ptr);

		// empty slot?
		if (saved_prog_num == 0xff)
			break;

		if (saved_prog_num == prog)
		{
			//dprint("found slot %u\n", prog);
			eeprom_read_block(this, slot_ptr, sizeof(Preset));
			return;
		}
	}

	// get the preset from flash
	const ProgParams* paramsPtr = (const ProgParams*)(pgm_read_word(&fv1_programs[prog].params));
	prog_num = prog;
	pots[0] = pgm_read_word(paramsPtr->pots);
	pots[1] = pgm_read_word(paramsPtr->pots + 1);
	pots[2] = pgm_read_word(paramsPtr->pots + 2);
	mix = pgm_read_byte(&paramsPtr->mix);
}

bool Preset::save()
{
	dprint("saving %u", prog_num);

	// try to save the preset to eeprom
	for (uint8_t slot_cnt = 0; slot_cnt < MAX_PRESETS; slot_cnt++)
	{
		uint8_t* const slot_ptr = (uint8_t*)(PRESETS_BEGIN_AT + sizeof(Preset) * slot_cnt);

		// read the program number for the slot
		const uint8_t saved_prog_num = eeprom_read_byte(slot_ptr);

		// found this program or reached the end of saved presets?
		if (saved_prog_num == prog_num  ||  saved_prog_num == 0xff)
		{
			dprint(" to slot %u\n", slot_cnt);
			eeprom_update_block(this, slot_ptr, sizeof(Preset));
			return true;
		}
	}

	return false;
}

uint8_t Preset::num_free_presets()
{
	// iterate through saved presets
	for (uint8_t slot_cnt = 0; slot_cnt < MAX_PRESETS; slot_cnt++)
	{
		const uint8_t* slot_ptr = (uint8_t*)(sizeof(Preset) * slot_cnt);

		// read the program number for the slot
		const uint8_t saved_prog_num = eeprom_read_byte(slot_ptr);

		// empty slot?
		if (saved_prog_num == 0xff)
			return MAX_PRESETS - slot_cnt;
	}

	return 0;
}

void Preset::dump_eeprom_presets()
{
#ifdef _DEBUG
	Preset p;
	// iterate through saved presets
	char prog_name[LONGEST_PROGRAM_NAME] = { 0 };
	uint8_t slot_cnt;
	for (slot_cnt = 0; slot_cnt < MAX_PRESETS; slot_cnt++)
	{
		const uint8_t* slot_ptr = (uint8_t*)(sizeof(Preset) * slot_cnt);

		// read the program number for the slot
		eeprom_read_block(&p, slot_ptr, sizeof(Preset));

		if (p.prog_num == 0xff)
			break;

		// read the program name from the flash
		fv1_programs[p.prog_num].copy_name(prog_name);
		dprint("prog=%u \"%s\"\n\"params\": [ %u, %u, %u, %u ],\n",
				p.prog_num, prog_name, p.mix, p.pots[0], p.pots[1], p.pots[2]);
	}

	dprint("dumped %u presets\n", p.prog_num == 0xff ? slot_cnt : MAX_PRESETS);
#endif
}

void Preset::load_active_prog()
{
	// yes, we are reading (successfully) from nullptr
	uint8_t active_prog = eeprom_read_byte(nullptr);
	if (active_prog == 0xff)
		active_prog = 0;

	load(active_prog);
}

void Preset::save_active_prog()
{
	eeprom_update_byte(nullptr, prog_num);
}
