#include <avr/io.h>
#include <util/twi.h>

#include "hw_setup.h"

.extern hiOffset

.global TWI_vect
.global sendProgram

sendProgram:
	; save all the registers that the ISR is using
	push	zl
	push	zh
	push	temp
	push	tempH
	push	prevState

	; prepare for the ISR
	ldi		prevState, 0x00
	sei

	; wait for the transfer to complete
checkDone:
	cpi		prevState, 0xFF
	brne	checkDone

	cli		; transfer is done, so no more interrupts

	; restore registers
	pop		prevState
	pop		tempH
	pop		temp
	pop		zh
	pop		zl

	ret

TWI_vect:

	; push SREG
	in		temp, _SFR_IO_ADDR(SREG)
	push	temp

	lds		tempH, TWSR					; read the TWI status register

	; if we have a byte to send
	cpi		tempH, TW_ST_SLA_ACK
	breq	sendByte

	cpi		tempH, TW_ST_DATA_ACK
	breq	sendByte

	; if we have received the hi byte of the address
	cpi		prevState, TW_SR_SLA_ACK
	breq	initAddress

	; if the last byte was transfered
	cpi		tempH, TW_ST_DATA_NACK
	brne	cleanup

	; tell the loop in sendProgram we're done
	ser		tempH

	jmp		cleanup

initAddress:

	ldi		zl, lo8(fv1Banks)
	ldi		zh, hi8(fv1Banks)

	lds		temp, hiOffset

	add		zh, temp

	jmp		cleanup

sendByte:

	lpm		tempH, z+
	sts		TWDR, tempH

	ldi		tempH, TW_ST_DATA_ACK

cleanup:

	mov		prevState, tempH

	; clear the interrupt flag
	ldi		tempH, _BV(TWEA) | _BV(TWEN) | _BV(TWIE) | _BV(TWINT)
	sts		TWCR, tempH

	; restore SREG
	pop		temp
	out		_SFR_IO_ADDR(SREG), temp

	reti
