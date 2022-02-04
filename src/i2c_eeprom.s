#include <avr/io.h>
#include <util/twi.h>

; TODO: Investigate if we can do all this in a single blocking C function without 
; the need for TWI interrupt handlers

; This is set by the caller of sendProgram()
; Maybe we should do this as a proper function argument?
.extern hiOffset

.global TWI_vect
.global sendProgram

; define the registers we will be using
#define temp		r3
#define tempH		r20
#define prevState	r21

; function entry point
sendProgram:
	; save all the registers that the TWI ISR is using
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

; our TWI ISR
TWI_vect:

	; push SREG
	in		temp, _SFR_IO_ADDR(SREG)
	push	temp

	; read the TWI status register
	lds		tempH, TWSR

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
