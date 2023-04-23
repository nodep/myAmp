# Please read the definitions below and edit them as appropriate for your
# system:

ifeq ($(OS), Windows_NT)
	USBFLAGS   =
	USBLIBS    = -lhid -lsetupapi
	EXE_SUFFIX = .exe
else
	USBFLAGS   = `libusb-config --cflags`
	USBLIBS    = `libusb-config --libs`
	EXE_SUFFIX =
endif

CC     = gcc
CFLAGS = -O2 -Wall $(USBFLAGS)
LIBS   = $(USBLIBS)

OBJ    = main.o usbcalls.o
TARGET = bootloadHID$(EXE_SUFFIX)

all: clean $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(ARCH_LINK) $(CFLAGS) -o $(TARGET) $(OBJ) $(LIBS)

strip: $(TARGET)
	strip $(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)

.c.o:
	$(CC) $(ARCH_COMPILE) $(CFLAGS) -c $*.c -o $*.o
