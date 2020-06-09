EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3000 2800 3000 3050
Wire Wire Line
	2500 2150 2500 2300
Wire Wire Line
	2500 2300 2650 2300
$Comp
L myAmp:CPOL C?
U 1 1 60F5F4AE
P 3450 2700
AR Path="/60F5F4AE" Ref="C?"  Part="1" 
AR Path="/60E5426B/60F5F4AE" Ref="C25"  Part="1" 
F 0 "C25" H 3550 2800 50  0000 C CNN
F 1 "10µf" H 3600 2600 50  0000 C CNN
F 2 "myAmp:CPOL_D4_P1.5" H 3450 2700 50  0001 C CNN
F 3 "" H 3450 2700 50  0001 C CNN
	1    3450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2300 3450 2300
Wire Wire Line
	3450 2300 3450 2600
$Comp
L power:GND #PWR?
U 1 1 60F5F4B6
P 3450 3050
AR Path="/60F5F4B6" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/60F5F4B6" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 3450 2800 50  0001 C CNN
F 1 "GND" H 3455 2877 50  0000 C CNN
F 2 "" H 3450 3050 50  0001 C CNN
F 3 "" H 3450 3050 50  0001 C CNN
	1    3450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2800 3450 3050
$Comp
L power:+3.3V #PWR?
U 1 1 60F5F4BD
P 3450 2200
AR Path="/60F5F4BD" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/60F5F4BD" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 3450 2050 50  0001 C CNN
F 1 "+3.3V" H 3465 2373 50  0000 C CNN
F 2 "" H 3450 2200 50  0001 C CNN
F 3 "" H 3450 2200 50  0001 C CNN
	1    3450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2200 3450 2300
Connection ~ 3450 2300
$Comp
L power:GND #PWR?
U 1 1 60F5F4C5
P 3000 3050
AR Path="/60F5F4C5" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/60F5F4C5" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3000 2800 50  0001 C CNN
F 1 "GND" H 3005 2877 50  0000 C CNN
F 2 "" H 3000 3050 50  0001 C CNN
F 3 "" H 3000 3050 50  0001 C CNN
	1    3000 3050
	1    0    0    -1  
$EndComp
$Comp
L myAmp:LM1117 U?
U 1 1 60F5F4CB
P 3000 2450
AR Path="/60F5F4CB" Ref="U?"  Part="1" 
AR Path="/60E5426B/60F5F4CB" Ref="U7"  Part="1" 
F 0 "U7" H 3000 2865 50  0000 C CNN
F 1 "LM1117" H 3000 2774 50  0000 C CNN
F 2 "myAmp:SOT-223" H 3000 2600 50  0001 C CNN
F 3 "" H 3000 2600 50  0001 C CNN
	1    3000 2450
	1    0    0    -1  
$EndComp
Text Notes 2500 1800 0    150  ~ 0
3.3V regulator
$Comp
L power:VDD #PWR?
U 1 1 60F5F4D2
P 2500 2150
AR Path="/60F5F4D2" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/60F5F4D2" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 2500 2000 50  0001 C CNN
F 1 "VDD" H 2517 2323 50  0000 C CNN
F 2 "" H 2500 2150 50  0001 C CNN
F 3 "" H 2500 2150 50  0001 C CNN
	1    2500 2150
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR?
U 1 1 6105EFE8
P 5700 2150
AR Path="/6105EFE8" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/6105EFE8" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 5700 2000 50  0001 C CNN
F 1 "VDD" H 5717 2323 50  0000 C CNN
F 2 "" H 5700 2150 50  0001 C CNN
F 3 "" H 5700 2150 50  0001 C CNN
	1    5700 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6105EFEE
P 5700 3050
AR Path="/6105EFEE" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/6105EFEE" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 5700 2800 50  0001 C CNN
F 1 "GND" H 5705 2877 50  0000 C CNN
F 2 "" H 5700 3050 50  0001 C CNN
F 3 "" H 5700 3050 50  0001 C CNN
	1    5700 3050
	1    0    0    -1  
$EndComp
$Comp
L myAmp:LED D?
U 1 1 6105EFF4
P 5300 2800
AR Path="/6105EFF4" Ref="D?"  Part="1" 
AR Path="/60E5426B/6105EFF4" Ref="D7"  Part="1" 
F 0 "D7" V 5350 2700 50  0000 R CNN
F 1 "PWR" V 5250 2700 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm" H 5300 2800 50  0001 C CNN
F 3 "" H 5300 2800 50  0001 C CNN
	1    5300 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 2550 5300 2650
$Comp
L power:GND #PWR?
U 1 1 6105EFFB
P 5300 3050
AR Path="/6105EFFB" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/6105EFFB" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 5300 2800 50  0001 C CNN
F 1 "GND" H 5305 2877 50  0000 C CNN
F 2 "" H 5300 3050 50  0001 C CNN
F 3 "" H 5300 3050 50  0001 C CNN
	1    5300 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2950 5300 3050
$Comp
L power:VDD #PWR?
U 1 1 6105F002
P 5300 2150
AR Path="/6105F002" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/6105F002" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 5300 2000 50  0001 C CNN
F 1 "VDD" H 5317 2323 50  0000 C CNN
F 2 "" H 5300 2150 50  0001 C CNN
F 3 "" H 5300 2150 50  0001 C CNN
	1    5300 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2150 5300 2250
$Comp
L myAmp:R R?
U 1 1 6105F009
P 5300 2400
AR Path="/6105F009" Ref="R?"  Part="1" 
AR Path="/60E5426B/6105F009" Ref="R33"  Part="1" 
F 0 "R33" H 5370 2446 50  0000 L CNN
F 1 "2K2" H 5370 2355 50  0000 L CNN
F 2 "myAmp:R_10MM" V 5230 2400 50  0001 C CNN
F 3 "" H 5300 2400 50  0001 C CNN
	1    5300 2400
	1    0    0    -1  
$EndComp
$Comp
L myAmp:SW_SIMPLE SW?
U 1 1 6105F00F
P 5700 2350
AR Path="/6105F00F" Ref="SW?"  Part="1" 
AR Path="/60E5426B/6105F00F" Ref="SW2"  Part="1" 
F 0 "SW2" V 5654 2428 50  0000 L CNN
F 1 "ON/OFF" V 5745 2428 50  0000 L CNN
F 2 "myAmp:ESP2010_switch" H 5700 2350 60  0001 C CNN
F 3 "" H 5700 2350 60  0000 C CNN
	1    5700 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 2150 5700 2200
$Comp
L myAmp:Barrel_Jack_Switch J?
U 1 1 6105F016
P 6100 2800
AR Path="/6105F016" Ref="J?"  Part="1" 
AR Path="/60E5426B/6105F016" Ref="J4"  Part="1" 
F 0 "J4" H 5870 2842 50  0000 R CNN
F 1 "Barrel_Jack_Switch" H 5870 2751 50  0000 R CNN
F 2 "myAmp:POWER_JACK_2.1mm" H 6150 2760 50  0001 C CNN
F 3 "" H 6150 2760 50  0001 C CNN
	1    6100 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5700 2700 5800 2700
Wire Wire Line
	5700 2500 5700 2700
Wire Wire Line
	5800 2900 5700 2900
Wire Wire Line
	5700 2900 5700 3050
Wire Wire Line
	5800 2800 5700 2800
Wire Wire Line
	5700 2800 5700 2900
Connection ~ 5700 2900
$Comp
L myAmp:modulo-bus U13
U 1 1 6105FA75
P 1150 3600
F 0 "U13" H 1092 4915 50  0000 C CNN
F 1 "modulo-bus" H 1092 4824 50  0000 C CNN
F 2 "myAmp:modulo-bus" V 1350 4300 50  0001 C CNN
F 3 "" H 800 4150 50  0001 C CNN
	1    1150 3600
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
