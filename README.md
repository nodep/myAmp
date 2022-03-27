# modulo2

What started as an idea to upgrade the guts of a practice guitar amplifier (Marshall Valvestate 8010), has evolved into a stereo guitar amplifier with effects. The current prototype is housed in a guitar pedal box (119 x 93.5 x 56.5mm). It has a modular design with the preamp, the effects board, and a stereo power amp. These modules are split into their own PCBs.

### The preamp

It is based on ESP's project 27 (https://sound-au.com/project27.htm). I have only used the preamp from this project and I have made a few changes:

- The overdrive section is changed to work as protection and limit the output to 3.3V. This is needed for the inputs of the DSP chip in the effects section (max input of FV-1 is 3.3V).
- The zener diode rail splitter is changed to a TL2426. Reasons being a smaller footprint and much lower power consumption.
- The total gain has been reduced on every stage.
- The tone control values have changed to a more Fender-like sound.

### The effects

The effects sections is based on a Spin semiconductor's FV-1 DSP chip. The chip has 8 built-in effects and the ability to read 8 more effects from an external EEPROM. This was extended using a microcontroller (ATmega328p) to up to 50 external effects which are read from the microcontroller's flash memory. The board also has a dry/wet mixer, a master volume. The microcontroller has a driverless USB bootloader which allows easier firmware updates and DSP program modification. A rotary encoder allows for FV-1 program selection and changing the input clock frequency of the FV-1. Some of the FV-1 programs work as a mono input and produce a stereo output with one channel outputing a slightly different signal to the other creating a stereo effect from a mono preamp input. The microcontroller oversees the power section to avoid audible pops during the power-up and power-down.

### The power amp

The power section is based on a TPA3220 in a stereo configuration. I have not tested it fully yet, but it should be able to output up to 60W into 4Ω per channel. It is a Class-D amp bringing high efficiency (around 90%) and very low distortion and noise. The TPA3220 chip has an integrated preamp with a selectable gain (4 distinct levels) making the full range of the master volume useful for quiter practice and louder performance levels.



The PCBs for the final prototype have been send to the fab.

Stay tuned for results!