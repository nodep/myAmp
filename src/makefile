TARGET  = myAmp
DEVICE  = atmega328p

F_CPU   = 16000000

FUSEH = 0xD7
FUSEL = 0xFD
FUSEX = 0xFF

AVRDUDE = avrdude -c stk500v2 -P avrdoper -p $(DEVICE)
#AVRDUDE = avrdude -c dragon_isp -P usb -p $(DEVICE)

CFLAGS	= -Wall -Os -std=c99
#CFLAGS += -DDBGPRINT

LFLAGS  = -Wl,--relax
#LFLAGS += -u vfprintf

COMPILE = avr-gcc -mmcu=$(DEVICE) -DF_CPU=$(F_CPU) $(CFLAGS)

OBJECTS = main.o avrdbg.o leds.o rotenc.o banks.o timer.o fvclk.o state.o sendprog.o

hex: $(TARGET).hex

$(TARGET).hex: $(OBJECTS)
	$(COMPILE) -o $(TARGET).elf $(OBJECTS) $(LFLAGS)
	rm -f $(TARGET).hex $(TARGET).eep.hex
	avr-objcopy -j .text -j .data -O ihex $(TARGET).elf $(TARGET).hex
	avr-objdump -h -S $(TARGET).elf > $(TARGET).lst
	avr-size -C --mcu=$(DEVICE) $(TARGET).elf

flash: $(TARGET).hex
	$(AVRDUDE) -U flash:w:$(TARGET).hex:i

clean:
	rm -f $(TARGET).hex $(TARGET).elf $(TARGET).lst $(OBJECTS)

fuse:
	$(AVRDUDE) -U hfuse:w:$(FUSEH):m -U lfuse:w:$(FUSEL):m -U efuse:w:$(FUSEX):m

read_fuse:
	$(AVRDUDE) -U hfuse:r:-:h -U lfuse:r:-:h -U efuse:r:-:h

.S.o:
	$(COMPILE) -x assembler-with-cpp -c $< -o $@

.c.o:
	$(COMPILE) -c $< -o $@

# the following saves the assembly listings and preprocessed sources
#	$(COMPILE) -g -save-temps -c $< -o $@

all: clean $(TARGET).hex
