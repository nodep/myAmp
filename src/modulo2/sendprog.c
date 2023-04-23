#include <stdint.h>

#include <avr/pgmspace.h>
#include <util/twi.h>

#include "hw_setup.h"
#include "banks.h"
#include "utils.h"

#define CONFIRM()	TWCR = _BV(TWEA) | _BV(TWEN) | _BV(TWINT)

void send_program(const uint8_t program_num)
{
	const uint8_t* program_addr = fv1programs[program_num];
	
	// wait for FV-1 to start reading the selected program
	do {
		CONFIRM();
		
		loop_until_bit_is_set(TWCR, TWINT);
		
		// TWSR == TW_SR_SLA_ACK (0x60)
		// TWSR == TW_SR_DATA_ACK (0x80)
		// TWSR == TW_SR_DATA_ACK (0x80)
		// TWSR == TW_SR_STOP (0xA0)
		
	} while (TWSR != TW_ST_SLA_ACK);

	// start sending the program
	do {
		// prepare the byte to send
		TWDR = pgm_read_byte(program_addr++);
		
		CONFIRM();

		// wait for the byte to be sent
		loop_until_bit_is_set(TWCR, TWINT);

	} while (TWSR != TW_ST_DATA_NACK);
	
	CONFIRM();
}
