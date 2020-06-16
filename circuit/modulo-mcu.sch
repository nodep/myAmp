EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
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
	10400 1650 10400 1900
$Comp
L myAmp:CPOL C?
U 1 1 5EE73ACD
P 10850 1550
AR Path="/5EE73ACD" Ref="C?"  Part="1" 
AR Path="/60E5426B/5EE73ACD" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EE73ACD" Ref="C25"  Part="1" 
F 0 "C25" H 10950 1650 50  0000 C CNN
F 1 "10µf" H 11000 1450 50  0000 C CNN
F 2 "myAmp:CPOL_D4_P1.5" H 10850 1550 50  0001 C CNN
F 3 "" H 10850 1550 50  0001 C CNN
	1    10850 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 1150 10850 1150
$Comp
L power:GND #PWR?
U 1 1 5EE73AD5
P 10850 1900
AR Path="/5EE73AD5" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EE73AD5" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73AD5" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 10850 1650 50  0001 C CNN
F 1 "GND" H 10855 1727 50  0000 C CNN
F 2 "" H 10850 1900 50  0001 C CNN
F 3 "" H 10850 1900 50  0001 C CNN
	1    10850 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 1650 10850 1900
$Comp
L power:+3.3V #PWR?
U 1 1 5EE73ADC
P 10850 1050
AR Path="/5EE73ADC" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EE73ADC" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73ADC" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 10850 900 50  0001 C CNN
F 1 "+3.3V" H 10865 1223 50  0000 C CNN
F 2 "" H 10850 1050 50  0001 C CNN
F 3 "" H 10850 1050 50  0001 C CNN
	1    10850 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 1050 10850 1150
Connection ~ 10850 1150
$Comp
L power:GND #PWR?
U 1 1 5EE73AE4
P 10400 1900
AR Path="/5EE73AE4" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EE73AE4" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73AE4" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 10400 1650 50  0001 C CNN
F 1 "GND" H 10405 1727 50  0000 C CNN
F 2 "" H 10400 1900 50  0001 C CNN
F 3 "" H 10400 1900 50  0001 C CNN
	1    10400 1900
	1    0    0    -1  
$EndComp
$Comp
L myAmp:LM1117 U?
U 1 1 5EE73AEA
P 10400 1300
AR Path="/5EE73AEA" Ref="U?"  Part="1" 
AR Path="/60E5426B/5EE73AEA" Ref="U?"  Part="1" 
AR Path="/5F06BD21/5EE73AEA" Ref="U7"  Part="1" 
F 0 "U7" H 10400 1715 50  0000 C CNN
F 1 "LM1117" H 10400 1624 50  0000 C CNN
F 2 "myAmp:SOT-223" H 10400 1450 50  0001 C CNN
F 3 "" H 10400 1450 50  0001 C CNN
	1    10400 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE73AF0
P 3900 1900
AR Path="/5EE73AF0" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EE73AF0" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73AF0" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 3900 1650 50  0001 C CNN
F 1 "GND" H 3905 1727 50  0000 C CNN
F 2 "" H 3900 1900 50  0001 C CNN
F 3 "" H 3900 1900 50  0001 C CNN
	1    3900 1900
	1    0    0    -1  
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EE73AF6
P 3500 1650
AR Path="/5EE73AF6" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EE73AF6" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EE73AF6" Ref="D7"  Part="1" 
F 0 "D7" V 3550 1550 50  0000 R CNN
F 1 "PWR" V 3450 1550 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm" H 3500 1650 50  0001 C CNN
F 3 "" H 3500 1650 50  0001 C CNN
	1    3500 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 1400 3500 1500
$Comp
L power:GND #PWR?
U 1 1 5EE73AFD
P 3500 1900
AR Path="/5EE73AFD" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EE73AFD" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73AFD" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 3500 1650 50  0001 C CNN
F 1 "GND" H 3505 1727 50  0000 C CNN
F 2 "" H 3500 1900 50  0001 C CNN
F 3 "" H 3500 1900 50  0001 C CNN
	1    3500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1800 3500 1900
Wire Wire Line
	3500 1000 3500 1100
$Comp
L myAmp:R R?
U 1 1 5EE73B05
P 3500 1250
AR Path="/5EE73B05" Ref="R?"  Part="1" 
AR Path="/60E5426B/5EE73B05" Ref="R?"  Part="1" 
AR Path="/5F06BD21/5EE73B05" Ref="R33"  Part="1" 
F 0 "R33" H 3570 1296 50  0000 L CNN
F 1 "2K2" H 3570 1205 50  0000 L CNN
F 2 "myAmp:R_10MM" V 3430 1250 50  0001 C CNN
F 3 "" H 3500 1250 50  0001 C CNN
	1    3500 1250
	1    0    0    -1  
$EndComp
$Comp
L myAmp:SW_SIMPLE SW?
U 1 1 5EE73B0B
P 3900 1200
AR Path="/5EE73B0B" Ref="SW?"  Part="1" 
AR Path="/60E5426B/5EE73B0B" Ref="SW?"  Part="1" 
AR Path="/5F06BD21/5EE73B0B" Ref="SW1"  Part="1" 
F 0 "SW1" V 3854 1278 50  0000 L CNN
F 1 "OFF/ON" V 3945 1278 50  0000 L CNN
F 2 "myAmp:ESP2010_switch" H 3900 1200 60  0001 C CNN
F 3 "" H 3900 1200 60  0000 C CNN
	1    3900 1200
	0    1    -1   0   
$EndComp
Wire Wire Line
	3900 1000 3900 1050
$Comp
L myAmp:Barrel_Jack_Switch J?
U 1 1 5EE73B12
P 4300 1650
AR Path="/5EE73B12" Ref="J?"  Part="1" 
AR Path="/60E5426B/5EE73B12" Ref="J?"  Part="1" 
AR Path="/5F06BD21/5EE73B12" Ref="J2"  Part="1" 
F 0 "J2" H 4070 1692 50  0000 R CNN
F 1 "Barrel_Jack_Switch" H 4070 1601 50  0000 R CNN
F 2 "myAmp:POWER_JACK_2.1mm" H 4350 1610 50  0001 C CNN
F 3 "" H 4350 1610 50  0001 C CNN
	1    4300 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3900 1550 4000 1550
Wire Wire Line
	3900 1350 3900 1550
Wire Wire Line
	4000 1750 3900 1750
Wire Wire Line
	3900 1750 3900 1900
Wire Wire Line
	4000 1650 3900 1650
Wire Wire Line
	3900 1650 3900 1750
Connection ~ 3900 1750
$Comp
L myAmp:modulo-bus U?
U 1 1 5EE73B1F
P 1200 3700
AR Path="/60E5426B/5EE73B1F" Ref="U?"  Part="1" 
AR Path="/5F06BD21/5EE73B1F" Ref="U8"  Part="1" 
F 0 "U8" H 1142 5015 50  0000 C CNN
F 1 "modulo-bus" H 1142 4924 50  0000 C CNN
F 2 "myAmp:modulo-bus" V 1400 4400 50  0001 C CNN
F 3 "" H 850 4250 50  0001 C CNN
	1    1200 3700
	-1   0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5EE73B25
P 6500 7000
AR Path="/5EE73B25" Ref="J?"  Part="1" 
AR Path="/60D4580B/5EE73B25" Ref="J?"  Part="1" 
AR Path="/60E5426B/5EE73B25" Ref="J?"  Part="1" 
AR Path="/5F06BD21/5EE73B25" Ref="J4"  Part="1" 
F 0 "J4" H 6577 7041 50  0000 L CNN
F 1 "HOLE" H 6577 6950 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6500 7000 50  0001 C CNN
F 3 "" H 6500 7000 50  0001 C CNN
	1    6500 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5EE73B2B
P 1700 2850
AR Path="/60E5426B/5EE73B2B" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B2B" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 1700 2700 50  0001 C CNN
F 1 "+12V" V 1715 2978 50  0000 L CNN
F 2 "" H 1700 2850 50  0001 C CNN
F 3 "" H 1700 2850 50  0001 C CNN
	1    1700 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 2850 1700 2850
$Comp
L power:GND #PWR?
U 1 1 5EE73B38
P 1700 2650
AR Path="/5EE73B38" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EE73B38" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B38" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 1700 2400 50  0001 C CNN
F 1 "GND" H 1705 2477 50  0000 C CNN
F 2 "" H 1700 2650 50  0001 C CNN
F 3 "" H 1700 2650 50  0001 C CNN
	1    1700 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 2650 1550 2650
NoConn ~ 1550 2750
NoConn ~ 1550 2950
NoConn ~ 1550 3250
NoConn ~ 1550 3350
NoConn ~ 1550 3550
NoConn ~ 1550 3650
$Comp
L power:+3.3V #PWR?
U 1 1 5EE73B45
P 1750 3050
AR Path="/5EE73B45" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EE73B45" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B45" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 1750 2900 50  0001 C CNN
F 1 "+3.3V" H 1765 3223 50  0000 C CNN
F 2 "" H 1750 3050 50  0001 C CNN
F 3 "" H 1750 3050 50  0001 C CNN
	1    1750 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 3050 1550 3050
$Comp
L power:+12V #PWR?
U 1 1 5EE73B4C
P 3500 1000
AR Path="/60E5426B/5EE73B4C" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B4C" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 3500 850 50  0001 C CNN
F 1 "+12V" H 3515 1173 50  0000 C CNN
F 2 "" H 3500 1000 50  0001 C CNN
F 3 "" H 3500 1000 50  0001 C CNN
	1    3500 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5EE73B52
P 3900 1000
AR Path="/60E5426B/5EE73B52" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B52" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 3900 850 50  0001 C CNN
F 1 "+12V" H 3915 1173 50  0000 C CNN
F 2 "" H 3900 1000 50  0001 C CNN
F 3 "" H 3900 1000 50  0001 C CNN
	1    3900 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EE73B58
P 7350 3900
AR Path="/5EE73B58" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B58" Ref="#PWR0180"  Part="1" 
AR Path="/60E5426B/5EE73B58" Ref="#PWR?"  Part="1" 
F 0 "#PWR0180" H 7350 3750 50  0001 C CNN
F 1 "+3.3V" H 7365 4073 50  0000 C CNN
F 2 "" H 7350 3900 50  0001 C CNN
F 3 "" H 7350 3900 50  0001 C CNN
	1    7350 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4050 7350 4050
Wire Wire Line
	7350 4050 7350 3900
$Comp
L power:GND #PWR?
U 1 1 5EE73B60
P 7350 4250
AR Path="/5EE73B60" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B60" Ref="#PWR0181"  Part="1" 
AR Path="/60E5426B/5EE73B60" Ref="#PWR?"  Part="1" 
F 0 "#PWR0181" H 7350 4000 50  0001 C CNN
F 1 "GND" H 7355 4077 50  0000 C CNN
F 2 "" H 7350 4250 50  0001 C CNN
F 3 "" H 7350 4250 50  0001 C CNN
	1    7350 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4150 7350 4150
Wire Wire Line
	7350 4150 7350 4250
Wire Wire Line
	5650 3950 6650 3950
Wire Wire Line
	5650 4050 6650 4050
Wire Wire Line
	5650 4150 6650 4150
Text Label 6350 4250 0    50   ~ 0
AVR_RST
Wire Wire Line
	6350 4250 6650 4250
Text Label 3450 3650 0    50   ~ 0
AVR_RST
$Comp
L power:+3.3V #PWR?
U 1 1 5EE73B6E
P 4650 3250
AR Path="/5EE73B6E" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B6E" Ref="#PWR0182"  Part="1" 
AR Path="/60E5426B/5EE73B6E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0182" H 4650 3100 50  0001 C CNN
F 1 "+3.3V" H 4665 3423 50  0000 C CNN
F 2 "" H 4650 3250 50  0001 C CNN
F 3 "" H 4650 3250 50  0001 C CNN
	1    4650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3350 4600 3300
Wire Wire Line
	4600 3300 4650 3300
Wire Wire Line
	4700 3300 4700 3350
Wire Wire Line
	4650 3250 4650 3300
Connection ~ 4650 3300
Wire Wire Line
	4650 3300 4700 3300
$Comp
L power:GND #PWR?
U 1 1 5EE73B7A
P 4650 6350
AR Path="/5EE73B7A" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B7A" Ref="#PWR0183"  Part="1" 
AR Path="/60E5426B/5EE73B7A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0183" H 4650 6100 50  0001 C CNN
F 1 "GND" H 4655 6177 50  0000 C CNN
F 2 "" H 4650 6350 50  0001 C CNN
F 3 "" H 4650 6350 50  0001 C CNN
	1    4650 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 6250 4600 6300
Wire Wire Line
	4600 6300 4650 6300
Wire Wire Line
	4700 6300 4700 6250
Wire Wire Line
	4650 6350 4650 6300
Connection ~ 4650 6300
Wire Wire Line
	4650 6300 4700 6300
$Comp
L power:GND #PWR?
U 1 1 5EE73B86
P 3650 4100
AR Path="/5EE73B86" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B86" Ref="#PWR0184"  Part="1" 
AR Path="/60E5426B/5EE73B86" Ref="#PWR?"  Part="1" 
F 0 "#PWR0184" H 3650 3850 50  0001 C CNN
F 1 "GND" H 3655 3927 50  0000 C CNN
F 2 "" H 3650 4100 50  0001 C CNN
F 3 "" H 3650 4100 50  0001 C CNN
	1    3650 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4050 3650 4050
Wire Wire Line
	3650 4050 3650 4100
$Comp
L power:+3.3V #PWR?
U 1 1 5EE73B8E
P 3200 3100
AR Path="/5EE73B8E" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73B8E" Ref="#PWR0185"  Part="1" 
AR Path="/60E5426B/5EE73B8E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0185" H 3200 2950 50  0001 C CNN
F 1 "+3.3V" H 3215 3273 50  0000 C CNN
F 2 "" H 3200 3100 50  0001 C CNN
F 3 "" H 3200 3100 50  0001 C CNN
	1    3200 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3950 3650 3950
Wire Wire Line
	3650 3950 3650 3850
Wire Wire Line
	3650 3850 3750 3850
Wire Wire Line
	3200 3100 3200 3150
$Comp
L myAmp:QUARTZ Y?
U 1 1 5EE73B98
P 3100 4450
AR Path="/5EE73B98" Ref="Y?"  Part="1" 
AR Path="/5F06BD21/5EE73B98" Ref="Y2"  Part="1" 
AR Path="/60E5426B/5EE73B98" Ref="Y?"  Part="1" 
F 0 "Y2" V 3050 4200 50  0000 L CNN
F 1 "8MHz" V 3150 4100 50  0000 L CNN
F 2 "myAmp:Crystal_HC49-U_Vertical" H 3100 4450 50  0001 C CNN
F 3 "" H 3100 4450 50  0001 C CNN
	1    3100 4450
	0    -1   1    0   
$EndComp
Wire Wire Line
	3100 4300 3100 4250
Wire Wire Line
	3100 4250 3400 4250
Wire Wire Line
	3400 4250 3400 4350
Wire Wire Line
	3400 4350 3750 4350
Wire Wire Line
	3750 4550 3400 4550
Wire Wire Line
	3400 4550 3400 4650
Wire Wire Line
	3400 4650 3100 4650
Wire Wire Line
	3100 4650 3100 4600
$Comp
L myAmp:C C?
U 1 1 5EE73BA6
P 2800 4250
AR Path="/5EE73BA6" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EE73BA6" Ref="C26"  Part="1" 
AR Path="/60E5426B/5EE73BA6" Ref="C?"  Part="1" 
F 0 "C26" V 2850 4450 50  0000 R CNN
F 1 "22pF" V 2850 4200 50  0000 R CNN
F 2 "myAmp:C_2.5MM" H 2838 4100 50  0001 C CNN
F 3 "" H 2800 4250 50  0001 C CNN
	1    2800 4250
	0    1    -1   0   
$EndComp
$Comp
L myAmp:C C?
U 1 1 5EE73BAC
P 2800 4650
AR Path="/5EE73BAC" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EE73BAC" Ref="C27"  Part="1" 
AR Path="/60E5426B/5EE73BAC" Ref="C?"  Part="1" 
F 0 "C27" V 2850 4850 50  0000 R CNN
F 1 "22pF" V 2850 4600 50  0000 R CNN
F 2 "myAmp:C_2.5MM" H 2838 4500 50  0001 C CNN
F 3 "" H 2800 4650 50  0001 C CNN
	1    2800 4650
	0    1    -1   0   
$EndComp
Wire Wire Line
	2900 4250 3100 4250
Connection ~ 3100 4250
Wire Wire Line
	3100 4650 2900 4650
Connection ~ 3100 4650
Wire Wire Line
	2700 4250 2500 4250
Wire Wire Line
	2500 4250 2500 4650
Wire Wire Line
	2500 4650 2700 4650
$Comp
L power:GND #PWR?
U 1 1 5EE73BB9
P 2500 4700
AR Path="/5EE73BB9" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73BB9" Ref="#PWR0186"  Part="1" 
AR Path="/60E5426B/5EE73BB9" Ref="#PWR?"  Part="1" 
F 0 "#PWR0186" H 2500 4450 50  0001 C CNN
F 1 "GND" H 2505 4527 50  0000 C CNN
F 2 "" H 2500 4700 50  0001 C CNN
F 3 "" H 2500 4700 50  0001 C CNN
	1    2500 4700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2500 4650 2500 4700
Connection ~ 2500 4650
$Comp
L myAmp:C C?
U 1 1 5EE73BC1
P 3200 3900
AR Path="/5EE73BC1" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EE73BC1" Ref="C35"  Part="1" 
AR Path="/60E5426B/5EE73BC1" Ref="C?"  Part="1" 
F 0 "C35" H 3100 4000 50  0000 R CNN
F 1 "100nF" H 3150 3850 50  0000 R CNN
F 2 "myAmp:C_1206" H 3238 3750 50  0001 C CNN
F 3 "" H 3200 3900 50  0001 C CNN
	1    3200 3900
	1    0    0    1   
$EndComp
Wire Wire Line
	3200 3800 3200 3750
Wire Wire Line
	3200 4000 3200 4050
Wire Wire Line
	3200 4050 3650 4050
Connection ~ 3650 4050
Text Label 5700 4850 0    50   ~ 0
SCL
Text Label 5700 4750 0    50   ~ 0
SDA
Text Label 5700 5350 0    50   ~ 0
DBG_TX
Wire Wire Line
	5650 4850 5700 4850
Wire Wire Line
	5650 4750 5700 4750
$Comp
L myAmp:R R?
U 1 1 5EE73BD1
P 3400 3400
AR Path="/5EE73BD1" Ref="R?"  Part="1" 
AR Path="/5F06BD21/5EE73BD1" Ref="R32"  Part="1" 
AR Path="/60E5426B/5EE73BD1" Ref="R?"  Part="1" 
F 0 "R32" H 3250 3350 50  0000 C CNN
F 1 "10K" H 3250 3450 50  0000 C CNN
F 2 "myAmp:R_10MM" V 3330 3400 50  0001 C CNN
F 3 "" H 3400 3400 50  0001 C CNN
	1    3400 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 3150 3400 3150
Wire Wire Line
	3400 3150 3400 3250
Connection ~ 3200 3150
Wire Wire Line
	3200 3150 3200 3750
Wire Wire Line
	3400 3550 3400 3650
Wire Wire Line
	3400 3650 3750 3650
$Comp
L myAmp:Rotary_Encoder_Switch SW?
U 1 1 5EE73BDD
P 6850 5850
AR Path="/5EE73BDD" Ref="SW?"  Part="1" 
AR Path="/5F06BD21/5EE73BDD" Ref="SW2"  Part="1" 
AR Path="/60E5426B/5EE73BDD" Ref="SW?"  Part="1" 
F 0 "SW2" H 6850 6217 50  0000 C CNN
F 1 "ROT_SW" H 6850 6126 50  0000 C CNN
F 2 "myAmp:BOURNS_PEC12R_2x17F" H 6750 6010 50  0001 C CNN
F 3 "" H 6850 6110 50  0001 C CNN
	1    6850 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5750 6200 5750
Wire Wire Line
	6550 5850 6450 5850
$Comp
L power:GND #PWR?
U 1 1 5EE73BE5
P 6450 5850
AR Path="/5EE73BE5" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73BE5" Ref="#PWR0187"  Part="1" 
AR Path="/60E5426B/5EE73BE5" Ref="#PWR?"  Part="1" 
F 0 "#PWR0187" H 6450 5600 50  0001 C CNN
F 1 "GND" H 6455 5677 50  0000 C CNN
F 2 "" H 6450 5850 50  0001 C CNN
F 3 "" H 6450 5850 50  0001 C CNN
	1    6450 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 5950 7250 5950
Wire Wire Line
	7150 5750 7200 5750
Wire Wire Line
	5650 4450 5700 4450
Wire Wire Line
	5650 4550 5700 4550
Wire Wire Line
	5700 4650 5650 4650
Text Label 5700 4650 0    50   ~ 0
S0
Text Label 5700 4550 0    50   ~ 0
S1
Text Label 5700 4450 0    50   ~ 0
S2
Wire Wire Line
	5700 4350 5650 4350
Text Label 5700 4350 0    50   ~ 0
T0
Wire Wire Line
	3650 3850 3650 3750
Wire Wire Line
	3650 3750 3200 3750
Connection ~ 3650 3850
Connection ~ 3200 3750
Wire Wire Line
	7250 5950 7250 6050
$Comp
L power:GND #PWR?
U 1 1 5EE73BFA
P 7250 6050
AR Path="/5EE73BFA" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73BFA" Ref="#PWR0188"  Part="1" 
AR Path="/60E5426B/5EE73BFA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0188" H 7250 5800 50  0001 C CNN
F 1 "GND" H 7255 5877 50  0000 C CNN
F 2 "" H 7250 6050 50  0001 C CNN
F 3 "" H 7250 6050 50  0001 C CNN
	1    7250 6050
	1    0    0    -1  
$EndComp
Text Label 5700 4950 0    50   ~ 0
WP
Wire Wire Line
	8250 3400 8750 3400
Wire Wire Line
	8750 3500 8500 3500
Wire Wire Line
	8500 3500 8500 3550
Wire Wire Line
	8500 3550 8250 3550
Wire Wire Line
	8250 3650 8550 3650
Wire Wire Line
	8550 3650 8550 3600
Wire Wire Line
	8550 3600 8750 3600
Wire Wire Line
	8750 3700 8600 3700
Wire Wire Line
	8600 3700 8600 3750
Wire Wire Line
	8600 3750 8250 3750
Wire Wire Line
	8250 3850 8750 3850
Wire Wire Line
	8750 3950 8250 3950
Wire Wire Line
	8250 4050 8750 4050
Wire Wire Line
	8750 4150 8350 4150
$Comp
L power:GND #PWR?
U 1 1 5EE73C23
P 10600 4350
AR Path="/5EE73C23" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73C23" Ref="#PWR0189"  Part="1" 
AR Path="/60E5426B/5EE73C23" Ref="#PWR?"  Part="1" 
F 0 "#PWR0189" H 10600 4100 50  0001 C CNN
F 1 "GND" H 10605 4177 50  0000 C CNN
F 2 "" H 10600 4350 50  0001 C CNN
F 3 "" H 10600 4350 50  0001 C CNN
	1    10600 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 5250 8750 5250
Wire Wire Line
	8750 5350 8500 5350
Wire Wire Line
	8500 5350 8500 5400
Wire Wire Line
	8500 5400 8250 5400
Wire Wire Line
	8250 5500 8550 5500
Wire Wire Line
	8550 5500 8550 5450
Wire Wire Line
	8550 5450 8750 5450
Wire Wire Line
	8750 5550 8600 5550
Wire Wire Line
	8600 5550 8600 5600
Wire Wire Line
	8600 5600 8250 5600
Wire Wire Line
	8350 4150 8350 4550
Wire Wire Line
	8350 4550 7100 4550
Wire Wire Line
	7100 4550 7100 5200
Wire Wire Line
	7100 5200 7450 5200
Connection ~ 8350 4150
Wire Wire Line
	8350 4150 8250 4150
Wire Wire Line
	7550 5300 7450 5300
Wire Wire Line
	7450 5300 7450 5200
Connection ~ 7450 5200
Wire Wire Line
	7450 5200 7550 5200
Wire Wire Line
	7550 3450 7450 3450
Wire Wire Line
	7450 3450 7450 3350
Connection ~ 7450 3350
Wire Wire Line
	7450 3350 7550 3350
Text Label 7200 3100 0    50   ~ 0
LED_RST
Text Label 7200 3200 0    50   ~ 0
LED_CK
Text Label 7200 3350 0    50   ~ 0
LED_DT
Wire Wire Line
	7200 4950 7550 4950
Wire Wire Line
	7200 5050 7550 5050
Text Label 7200 4950 0    50   ~ 0
LED_RST
Text Label 7200 5050 0    50   ~ 0
LED_CK
$Comp
L power:+3.3V #PWR?
U 1 1 5EE73C6E
P 8350 3050
AR Path="/5EE73C6E" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73C6E" Ref="#PWR0191"  Part="1" 
AR Path="/60E5426B/5EE73C6E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0191" H 8350 2900 50  0001 C CNN
F 1 "+3.3V" H 8365 3223 50  0000 C CNN
F 2 "" H 8350 3050 50  0001 C CNN
F 3 "" H 8350 3050 50  0001 C CNN
	1    8350 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE73C74
P 8350 3200
AR Path="/5EE73C74" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73C74" Ref="#PWR0192"  Part="1" 
AR Path="/60E5426B/5EE73C74" Ref="#PWR?"  Part="1" 
F 0 "#PWR0192" H 8350 2950 50  0001 C CNN
F 1 "GND" H 8355 3027 50  0000 C CNN
F 2 "" H 8350 3200 50  0001 C CNN
F 3 "" H 8350 3200 50  0001 C CNN
	1    8350 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8250 3100 8350 3100
Wire Wire Line
	8350 3100 8350 3050
Wire Wire Line
	8350 3200 8250 3200
$Comp
L power:+3.3V #PWR?
U 1 1 5EE73C7D
P 8350 4900
AR Path="/5EE73C7D" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73C7D" Ref="#PWR0193"  Part="1" 
AR Path="/60E5426B/5EE73C7D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0193" H 8350 4750 50  0001 C CNN
F 1 "+3.3V" H 8365 5073 50  0000 C CNN
F 2 "" H 8350 4900 50  0001 C CNN
F 3 "" H 8350 4900 50  0001 C CNN
	1    8350 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE73C83
P 8350 5050
AR Path="/5EE73C83" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73C83" Ref="#PWR0194"  Part="1" 
AR Path="/60E5426B/5EE73C83" Ref="#PWR?"  Part="1" 
F 0 "#PWR0194" H 8350 4800 50  0001 C CNN
F 1 "GND" H 8355 4877 50  0000 C CNN
F 2 "" H 8350 5050 50  0001 C CNN
F 3 "" H 8350 5050 50  0001 C CNN
	1    8350 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8350 5050 8250 5050
Wire Wire Line
	8250 4950 8350 4950
Wire Wire Line
	8350 4950 8350 4900
Wire Wire Line
	7200 3350 7450 3350
$Comp
L myAmp:ATMEGA8-16AU U?
U 1 1 5EE73C8D
P 4650 4650
AR Path="/5EE73C8D" Ref="U?"  Part="1" 
AR Path="/5F06BD21/5EE73C8D" Ref="U9"  Part="1" 
AR Path="/60E5426B/5EE73C8D" Ref="U?"  Part="1" 
F 0 "U9" H 4250 5900 50  0000 C CNN
F 1 "ATMEGA8" H 5050 5900 50  0000 C CNN
F 2 "myAmp:TQFP-32_7x7mm_Pitch0.8mm" H 4650 4650 50  0001 C CIN
F 3 "" H 4650 4650 50  0001 C CNN
	1    4650 4650
	1    0    0    -1  
$EndComp
$Comp
L myAmp:AVR-ISP6 U?
U 1 1 5EE73C93
P 6950 4100
AR Path="/5EE73C93" Ref="U?"  Part="1" 
AR Path="/5F06BD21/5EE73C93" Ref="U10"  Part="1" 
AR Path="/60E5426B/5EE73C93" Ref="U?"  Part="1" 
F 0 "U10" H 6950 4350 50  0000 C CNN
F 1 "AVR-ISP6" H 6950 3850 50  0000 C CNN
F 2 "myAmp:AVR_ISP6_horizontal" V 6430 4090 50  0001 C CNN
F 3 "" H 6950 4050 60  0000 C CNN
	1    6950 4100
	1    0    0    -1  
$EndComp
$Comp
L myAmp:74164 U?
U 1 1 5EE73C99
P 7900 3350
AR Path="/5EE73C99" Ref="U?"  Part="1" 
AR Path="/5F06BD21/5EE73C99" Ref="U11"  Part="1" 
AR Path="/60E5426B/5EE73C99" Ref="U?"  Part="1" 
F 0 "U11" H 7875 3888 60  0000 C CNN
F 1 "74164" H 7875 3782 60  0000 C CNN
F 2 "myAmp:SOIC-14_3.9x8.7mm_P1.27mm" H 7900 3350 60  0001 C CNN
F 3 "" H 7900 3350 60  0000 C CNN
	1    7900 3350
	1    0    0    -1  
$EndComp
$Comp
L myAmp:74164 U?
U 1 1 5EE73C9F
P 7900 5200
AR Path="/5EE73C9F" Ref="U?"  Part="1" 
AR Path="/5F06BD21/5EE73C9F" Ref="U13"  Part="1" 
AR Path="/60E5426B/5EE73C9F" Ref="U?"  Part="1" 
F 0 "U13" H 7875 5738 60  0000 C CNN
F 1 "74164" H 7875 5632 60  0000 C CNN
F 2 "myAmp:SOIC-14_3.9x8.7mm_P1.27mm" H 7900 5200 60  0001 C CNN
F 3 "" H 7900 5200 60  0000 C CNN
	1    7900 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE73CA5
P 5800 6450
AR Path="/5EE73CA5" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE73CA5" Ref="#PWR0195"  Part="1" 
AR Path="/60E5426B/5EE73CA5" Ref="#PWR?"  Part="1" 
F 0 "#PWR0195" H 5800 6200 50  0001 C CNN
F 1 "GND" H 5805 6277 50  0000 C CNN
F 2 "" H 5800 6450 50  0001 C CNN
F 3 "" H 5800 6450 50  0001 C CNN
	1    5800 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5350 6100 5350
Wire Wire Line
	5850 6400 5800 6400
Wire Wire Line
	5800 6400 5800 6450
Wire Wire Line
	7200 3100 7550 3100
Wire Wire Line
	7550 3200 7200 3200
Text Label 6350 4150 0    50   ~ 0
SCK
Text Label 6350 4050 0    50   ~ 0
MISO
Text Label 6350 3950 0    50   ~ 0
MOSI
Wire Wire Line
	5700 5450 5650 5450
Wire Wire Line
	5700 5550 5650 5550
Wire Wire Line
	5700 5650 5650 5650
Text Label 5700 5450 0    50   ~ 0
LED_DT
Wire Wire Line
	6200 5750 6200 5850
Text Label 5700 5650 0    50   ~ 0
LED_RST
Text Label 5700 5550 0    50   ~ 0
LED_CK
Wire Wire Line
	5700 5950 5650 5950
Text Label 5700 5950 0    50   ~ 0
ROT_SW
Text Label 7200 5750 0    50   ~ 0
ROT_SW
Wire Wire Line
	5650 5850 6200 5850
Wire Wire Line
	6100 5750 6100 5950
Wire Wire Line
	6100 5950 6550 5950
Wire Wire Line
	5650 5750 6100 5750
$Comp
L myAmp:HOLE J?
U 1 1 5EE83F3C
P 6500 7200
AR Path="/5EE83F3C" Ref="J?"  Part="1" 
AR Path="/60D4580B/5EE83F3C" Ref="J?"  Part="1" 
AR Path="/60E5426B/5EE83F3C" Ref="J?"  Part="1" 
AR Path="/5F06BD21/5EE83F3C" Ref="J17"  Part="1" 
F 0 "J17" H 6577 7241 50  0000 L CNN
F 1 "HOLE" H 6577 7150 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6500 7200 50  0001 C CNN
F 3 "" H 6500 7200 50  0001 C CNN
	1    6500 7200
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5EE840DE
P 6500 7400
AR Path="/5EE840DE" Ref="J?"  Part="1" 
AR Path="/60D4580B/5EE840DE" Ref="J?"  Part="1" 
AR Path="/60E5426B/5EE840DE" Ref="J?"  Part="1" 
AR Path="/5F06BD21/5EE840DE" Ref="J18"  Part="1" 
F 0 "J18" H 6577 7441 50  0000 L CNN
F 1 "HOLE" H 6577 7350 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6500 7400 50  0001 C CNN
F 3 "" H 6500 7400 50  0001 C CNN
	1    6500 7400
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5EE84237
P 6500 7600
AR Path="/5EE84237" Ref="J?"  Part="1" 
AR Path="/60D4580B/5EE84237" Ref="J?"  Part="1" 
AR Path="/60E5426B/5EE84237" Ref="J?"  Part="1" 
AR Path="/5F06BD21/5EE84237" Ref="J19"  Part="1" 
F 0 "J19" H 6577 7641 50  0000 L CNN
F 1 "HOLE" H 6577 7550 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6500 7600 50  0001 C CNN
F 3 "" H 6500 7600 50  0001 C CNN
	1    6500 7600
	1    0    0    -1  
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EE9D030
P 9550 4150
AR Path="/5EE9D030" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EE9D030" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EE9D030" Ref="D17"  Part="1" 
F 0 "D17" H 9700 4100 50  0000 R CNN
F 1 "8" H 9700 4200 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 9550 4150 50  0001 C CNN
F 3 "" H 9550 4150 50  0001 C CNN
	1    9550 4150
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EEAC855
P 10150 3400
AR Path="/5EEAC855" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EEAC855" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EEAC855" Ref="D10"  Part="1" 
F 0 "D10" H 10300 3350 50  0000 R CNN
F 1 "1" H 10300 3450 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 10150 3400 50  0001 C CNN
F 3 "" H 10150 3400 50  0001 C CNN
	1    10150 3400
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EEACE3F
P 9550 3500
AR Path="/5EEACE3F" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EEACE3F" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EEACE3F" Ref="D11"  Part="1" 
F 0 "D11" H 9700 3450 50  0000 R CNN
F 1 "2" H 9700 3550 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 9550 3500 50  0001 C CNN
F 3 "" H 9550 3500 50  0001 C CNN
	1    9550 3500
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EEAD49A
P 10150 3600
AR Path="/5EEAD49A" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EEAD49A" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EEAD49A" Ref="D12"  Part="1" 
F 0 "D12" H 10300 3550 50  0000 R CNN
F 1 "3" H 10300 3650 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 10150 3600 50  0001 C CNN
F 3 "" H 10150 3600 50  0001 C CNN
	1    10150 3600
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EEB1259
P 9550 3700
AR Path="/5EEB1259" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EEB1259" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EEB1259" Ref="D13"  Part="1" 
F 0 "D13" H 9700 3650 50  0000 R CNN
F 1 "4" H 9700 3750 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 9550 3700 50  0001 C CNN
F 3 "" H 9550 3700 50  0001 C CNN
	1    9550 3700
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EEB125F
P 10150 3850
AR Path="/5EEB125F" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EEB125F" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EEB125F" Ref="D14"  Part="1" 
F 0 "D14" H 10300 3800 50  0000 R CNN
F 1 "5" H 10300 3900 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 10150 3850 50  0001 C CNN
F 3 "" H 10150 3850 50  0001 C CNN
	1    10150 3850
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EEB1265
P 9550 3950
AR Path="/5EEB1265" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EEB1265" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EEB1265" Ref="D15"  Part="1" 
F 0 "D15" H 9700 3900 50  0000 R CNN
F 1 "6" H 9700 4000 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 9550 3950 50  0001 C CNN
F 3 "" H 9550 3950 50  0001 C CNN
	1    9550 3950
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EEB126B
P 10150 4050
AR Path="/5EEB126B" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EEB126B" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EEB126B" Ref="D16"  Part="1" 
F 0 "D16" H 10300 4000 50  0000 R CNN
F 1 "7" H 10300 4100 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 10150 4050 50  0001 C CNN
F 3 "" H 10150 4050 50  0001 C CNN
	1    10150 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 3400 10000 3400
Wire Wire Line
	9400 3500 9150 3500
Wire Wire Line
	9150 3600 10000 3600
Wire Wire Line
	9400 3700 9150 3700
Wire Wire Line
	9150 3850 10000 3850
Wire Wire Line
	9150 4050 10000 4050
Wire Wire Line
	10300 3400 10600 3400
Wire Wire Line
	10600 3400 10600 3500
Wire Wire Line
	10300 3600 10600 3600
Connection ~ 10600 3600
Wire Wire Line
	10600 3600 10600 3700
Connection ~ 10600 3700
Wire Wire Line
	10600 3700 10600 3850
Wire Wire Line
	9700 3500 10600 3500
Connection ~ 10600 3500
Wire Wire Line
	10600 3500 10600 3600
Wire Wire Line
	9700 3700 10600 3700
Wire Wire Line
	9700 3950 10600 3950
Connection ~ 10600 3950
Wire Wire Line
	10600 3950 10600 4050
Wire Wire Line
	10300 3850 10600 3850
Connection ~ 10600 3850
Wire Wire Line
	10600 3850 10600 3950
Wire Wire Line
	9400 3950 9150 3950
Wire Wire Line
	9150 4150 9400 4150
Wire Wire Line
	9700 4150 10600 4150
Wire Wire Line
	10300 4050 10600 4050
Connection ~ 10600 4050
Wire Wire Line
	10600 4050 10600 4150
Wire Wire Line
	10600 4150 10600 4350
Connection ~ 10600 4150
$Comp
L myAmp:R_Pack04_THT RN1
U 1 1 5EF5C8C4
P 8950 3600
F 0 "RN1" V 8533 3600 50  0000 C CNN
F 1 "100" V 8624 3600 50  0000 C CNN
F 2 "myAmp:R_Array_x4_P2.54" V 9225 3600 50  0001 C CNN
F 3 "" H 8950 3600 50  0001 C CNN
	1    8950 3600
	0    1    1    0   
$EndComp
$Comp
L myAmp:R_Pack04_THT RN2
U 1 1 5EF61618
P 8950 4050
F 0 "RN2" V 9250 4050 50  0000 C CNN
F 1 "100" V 9150 4050 50  0000 C CNN
F 2 "myAmp:R_Array_x4_P2.54" V 9225 4050 50  0001 C CNN
F 3 "" H 8950 4050 50  0001 C CNN
	1    8950 4050
	0    1    1    0   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EF70E2D
P 10150 5250
AR Path="/5EF70E2D" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EF70E2D" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EF70E2D" Ref="D18"  Part="1" 
F 0 "D18" H 10350 5200 50  0000 R CNN
F 1 "9" H 10300 5300 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 10150 5250 50  0001 C CNN
F 3 "" H 10150 5250 50  0001 C CNN
	1    10150 5250
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EF70E33
P 9550 5350
AR Path="/5EF70E33" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EF70E33" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EF70E33" Ref="D19"  Part="1" 
F 0 "D19" H 9750 5300 50  0000 R CNN
F 1 "10" H 9700 5400 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 9550 5350 50  0001 C CNN
F 3 "" H 9550 5350 50  0001 C CNN
	1    9550 5350
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EF70E39
P 10150 5450
AR Path="/5EF70E39" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EF70E39" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EF70E39" Ref="D20"  Part="1" 
F 0 "D20" H 10350 5400 50  0000 R CNN
F 1 "11" H 10300 5500 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 10150 5450 50  0001 C CNN
F 3 "" H 10150 5450 50  0001 C CNN
	1    10150 5450
	-1   0    0    1   
$EndComp
$Comp
L myAmp:LED D?
U 1 1 5EF70E3F
P 9550 5550
AR Path="/5EF70E3F" Ref="D?"  Part="1" 
AR Path="/60E5426B/5EF70E3F" Ref="D?"  Part="1" 
AR Path="/5F06BD21/5EF70E3F" Ref="D21"  Part="1" 
F 0 "D21" H 9750 5500 50  0000 R CNN
F 1 "12" H 9700 5600 50  0000 R CNN
F 2 "myAmp:LED_D3.0mm_PCBedge" H 9550 5550 50  0001 C CNN
F 3 "" H 9550 5550 50  0001 C CNN
	1    9550 5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 5250 10000 5250
Wire Wire Line
	9400 5350 9150 5350
Wire Wire Line
	9150 5450 10000 5450
Wire Wire Line
	9400 5550 9150 5550
Wire Wire Line
	10300 5250 10600 5250
Wire Wire Line
	10600 5250 10600 5350
Wire Wire Line
	10300 5450 10600 5450
Connection ~ 10600 5450
Wire Wire Line
	10600 5450 10600 5550
Wire Wire Line
	9700 5350 10600 5350
Connection ~ 10600 5350
Wire Wire Line
	10600 5350 10600 5450
Wire Wire Line
	9700 5550 10600 5550
$Comp
L myAmp:R_Pack04_THT RN3
U 1 1 5EF70E76
P 8950 5450
F 0 "RN3" V 8533 5450 50  0000 C CNN
F 1 "100" V 8624 5450 50  0000 C CNN
F 2 "myAmp:R_Array_x4_P2.54" V 9225 5450 50  0001 C CNN
F 3 "" H 8950 5450 50  0001 C CNN
	1    8950 5450
	0    1    1    0   
$EndComp
NoConn ~ 8250 5700
NoConn ~ 8250 5800
NoConn ~ 8250 5900
NoConn ~ 8250 6000
Wire Wire Line
	6300 5150 6100 5150
Wire Wire Line
	6100 5150 6100 5350
$Comp
L power:GND #PWR?
U 1 1 5EE4CCF1
P 6200 5350
AR Path="/5EE4CCF1" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE4CCF1" Ref="#PWR0190"  Part="1" 
AR Path="/60E5426B/5EE4CCF1" Ref="#PWR?"  Part="1" 
F 0 "#PWR0190" H 6200 5100 50  0001 C CNN
F 1 "GND" H 6205 5177 50  0000 C CNN
F 2 "" H 6200 5350 50  0001 C CNN
F 3 "" H 6200 5350 50  0001 C CNN
	1    6200 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 5250 6200 5250
Wire Wire Line
	6200 5250 6200 5350
$Comp
L myAmp:DBG_UART U18
U 1 1 5EE56ACD
P 6500 5200
F 0 "U18" H 6678 5246 50  0000 L CNN
F 1 "DBG_UART" H 6678 5155 50  0000 L CNN
F 2 "myAmp:DBG_UART" H 6600 5100 5   0001 C CNN
F 3 "" H 6300 5150 50  0001 C CNN
	1    6500 5200
	1    0    0    1   
$EndComp
Wire Wire Line
	10850 1150 10850 1450
$Comp
L myAmp:TPS560430 U19
U 1 1 5EED5AA9
P 7400 1150
F 0 "U19" H 7400 1565 50  0000 C CNN
F 1 "TPS560430" H 7400 1474 50  0000 C CNN
F 2 "myAmp:SOT-23-6" H 7400 1150 50  0001 C CNN
F 3 "" H 7400 1150 50  0001 C CNN
	1    7400 1150
	1    0    0    -1  
$EndComp
$Comp
L myAmp:C C?
U 1 1 5EED7223
P 6500 1150
AR Path="/5EED7223" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EED7223" Ref="C56"  Part="1" 
AR Path="/60E5426B/5EED7223" Ref="C?"  Part="1" 
F 0 "C56" H 6400 1250 50  0000 R CNN
F 1 "100nF" H 6450 1100 50  0000 R CNN
F 2 "myAmp:C_5MM_1206" H 6538 1000 50  0001 C CNN
F 3 "" H 6500 1150 50  0001 C CNN
	1    6500 1150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 1000 6950 1000
Wire Wire Line
	6150 1000 6150 1050
Wire Wire Line
	6150 1250 6150 1300
Wire Wire Line
	6150 1300 6500 1300
Wire Wire Line
	6500 1300 6500 1250
Connection ~ 6500 1300
Wire Wire Line
	6500 1300 6950 1300
Wire Wire Line
	6500 1050 6500 1000
Connection ~ 6500 1000
Wire Wire Line
	6500 1000 6150 1000
Wire Wire Line
	7100 1150 6950 1150
Wire Wire Line
	6950 1150 6950 1000
Connection ~ 6950 1000
Wire Wire Line
	6950 1000 6500 1000
$Comp
L power:GND #PWR?
U 1 1 5EF29315
P 6950 1400
AR Path="/5EF29315" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EF29315" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EF29315" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 6950 1150 50  0001 C CNN
F 1 "GND" H 6955 1227 50  0000 C CNN
F 2 "" H 6950 1400 50  0001 C CNN
F 3 "" H 6950 1400 50  0001 C CNN
	1    6950 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1300 6950 1400
Connection ~ 6950 1300
Wire Wire Line
	6950 1300 7100 1300
$Comp
L myAmp:C C?
U 1 1 5EF3B56D
P 8100 1000
AR Path="/5EF3B56D" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EF3B56D" Ref="C57"  Part="1" 
AR Path="/60E5426B/5EF3B56D" Ref="C?"  Part="1" 
F 0 "C57" V 8050 1200 50  0000 R CNN
F 1 "100nF" V 8050 950 50  0000 R CNN
F 2 "myAmp:C_1206" H 8138 850 50  0001 C CNN
F 3 "" H 8100 1000 50  0001 C CNN
	1    8100 1000
	0    -1   1    0   
$EndComp
$Comp
L myAmp:L L5
U 1 1 5EF4EDD0
P 8600 1150
F 0 "L5" V 8790 1150 50  0000 C CNN
F 1 "33µH" V 8699 1150 50  0000 C CNN
F 2 "myAmp:COIL_SRR6603" H 8600 1150 50  0001 C CNN
F 3 "" H 8600 1150 50  0001 C CNN
	1    8600 1150
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:R R?
U 1 1 5EF5A387
P 8850 1400
AR Path="/5EF5A387" Ref="R?"  Part="1" 
AR Path="/5F06BD21/5EF5A387" Ref="R48"  Part="1" 
AR Path="/60E5426B/5EF5A387" Ref="R?"  Part="1" 
F 0 "R48" H 8700 1350 50  0000 C CNN
F 1 "75K" H 8700 1450 50  0000 C CNN
F 2 "myAmp:R_10MM" V 8780 1400 50  0001 C CNN
F 3 "" H 8850 1400 50  0001 C CNN
	1    8850 1400
	-1   0    0    1   
$EndComp
$Comp
L myAmp:R R?
U 1 1 5EF5AB00
P 8850 1800
AR Path="/5EF5AB00" Ref="R?"  Part="1" 
AR Path="/5F06BD21/5EF5AB00" Ref="R49"  Part="1" 
AR Path="/60E5426B/5EF5AB00" Ref="R?"  Part="1" 
F 0 "R49" H 8700 1750 50  0000 C CNN
F 1 "10K" H 8700 1850 50  0000 C CNN
F 2 "myAmp:R_10MM" V 8780 1800 50  0001 C CNN
F 3 "" H 8850 1800 50  0001 C CNN
	1    8850 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	8750 1150 8850 1150
Wire Wire Line
	8850 1150 8850 1250
Wire Wire Line
	8850 1550 8850 1600
Wire Wire Line
	8600 1300 8600 1600
Wire Wire Line
	8600 1600 8850 1600
Connection ~ 8850 1600
Wire Wire Line
	8850 1600 8850 1650
$Comp
L power:GND #PWR?
U 1 1 5EF8C84A
P 8850 2350
AR Path="/5EF8C84A" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EF8C84A" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EF8C84A" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 8850 2100 50  0001 C CNN
F 1 "GND" H 8855 2177 50  0000 C CNN
F 2 "" H 8850 2350 50  0001 C CNN
F 3 "" H 8850 2350 50  0001 C CNN
	1    8850 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1950 8850 2000
$Comp
L myAmp:C C?
U 1 1 5EF9712A
P 9400 1650
AR Path="/5EF9712A" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EF9712A" Ref="C58"  Part="1" 
AR Path="/60E5426B/5EF9712A" Ref="C?"  Part="1" 
F 0 "C58" H 9300 1700 50  0000 R CNN
F 1 "15µf" H 9300 1600 50  0000 R CNN
F 2 "myAmp:C_1812" H 9438 1500 50  0001 C CNN
F 3 "" H 9400 1650 50  0001 C CNN
	1    9400 1650
	1    0    0    -1  
$EndComp
$Comp
L myAmp:C C?
U 1 1 5EF97C98
P 9700 1650
AR Path="/5EF97C98" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EF97C98" Ref="C59"  Part="1" 
AR Path="/60E5426B/5EF97C98" Ref="C?"  Part="1" 
F 0 "C59" H 9600 1700 50  0000 R CNN
F 1 "15µf" H 9600 1600 50  0000 R CNN
F 2 "myAmp:C_1812" H 9738 1500 50  0001 C CNN
F 3 "" H 9700 1650 50  0001 C CNN
	1    9700 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9400 1550 9400 1150
Wire Wire Line
	9400 1150 8850 1150
Connection ~ 8850 1150
Wire Wire Line
	9400 1150 9700 1150
Wire Wire Line
	9700 1150 9700 1550
Connection ~ 9400 1150
Wire Wire Line
	9700 1750 9700 2300
Wire Wire Line
	9700 2300 9550 2300
Wire Wire Line
	9400 2300 9400 1750
$Comp
L power:GND #PWR?
U 1 1 5EFB84A8
P 9550 2350
AR Path="/5EFB84A8" Ref="#PWR?"  Part="1" 
AR Path="/60E5426B/5EFB84A8" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EFB84A8" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 9550 2100 50  0001 C CNN
F 1 "GND" H 9555 2177 50  0000 C CNN
F 2 "" H 9550 2350 50  0001 C CNN
F 3 "" H 9550 2350 50  0001 C CNN
	1    9550 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2350 9550 2300
Connection ~ 9550 2300
Wire Wire Line
	9550 2300 9400 2300
$Comp
L myAmp:R R?
U 1 1 5EFC4F2C
P 8850 2150
AR Path="/5EFC4F2C" Ref="R?"  Part="1" 
AR Path="/5F06BD21/5EFC4F2C" Ref="R50"  Part="1" 
AR Path="/60E5426B/5EFC4F2C" Ref="R?"  Part="1" 
F 0 "R50" H 8700 2100 50  0000 C CNN
F 1 "10K" H 8700 2200 50  0000 C CNN
F 2 "myAmp:R_10MM" V 8780 2150 50  0001 C CNN
F 3 "" H 8850 2150 50  0001 C CNN
	1    8850 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	8850 2300 8850 2350
$Comp
L power:+12V #PWR?
U 1 1 5EE94C57
P 6500 900
AR Path="/60E5426B/5EE94C57" Ref="#PWR?"  Part="1" 
AR Path="/5F06BD21/5EE94C57" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 6500 750 50  0001 C CNN
F 1 "+12V" H 6515 1073 50  0000 C CNN
F 2 "" H 6500 900 50  0001 C CNN
F 3 "" H 6500 900 50  0001 C CNN
	1    6500 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 900  6500 1000
Wire Wire Line
	9700 1150 10050 1150
Connection ~ 9700 1150
Text Label 8850 1050 0    50   ~ 0
4.75V
Wire Wire Line
	8850 1050 8850 1150
$Comp
L myAmp:CPOL C?
U 1 1 5EEE8900
P 6150 1150
AR Path="/5EEE8900" Ref="C?"  Part="1" 
AR Path="/60E5426B/5EEE8900" Ref="C?"  Part="1" 
AR Path="/5F06BD21/5EEE8900" Ref="C55"  Part="1" 
F 0 "C55" H 6250 1250 50  0000 C CNN
F 1 "4.7µf" H 6300 1050 50  0000 C CNN
F 2 "myAmp:CPOL_D4_P1.5" H 6150 1150 50  0001 C CNN
F 3 "" H 6150 1150 50  0001 C CNN
	1    6150 1150
	1    0    0    -1  
$EndComp
Text Label 7750 1000 0    50   ~ 0
CB
Text Label 7750 1150 0    50   ~ 0
SW
Text Label 7750 1300 0    50   ~ 0
FB
Wire Wire Line
	7700 1300 8600 1300
Wire Wire Line
	7700 1150 8300 1150
Wire Wire Line
	7700 1000 8000 1000
Wire Wire Line
	8200 1000 8300 1000
Wire Wire Line
	8300 1000 8300 1150
Connection ~ 8300 1150
Wire Wire Line
	8300 1150 8450 1150
Wire Wire Line
	1550 3850 1650 3850
Wire Wire Line
	1550 3950 1650 3950
Wire Wire Line
	1550 4050 1650 4050
Wire Wire Line
	1550 4150 1650 4150
Wire Wire Line
	1550 4250 1650 4250
Wire Wire Line
	1550 4350 1650 4350
Text Label 1650 4250 0    50   ~ 0
S2
Text Label 1650 4150 0    50   ~ 0
S1
Text Label 1650 4050 0    50   ~ 0
S0
Text Label 1650 4350 0    50   ~ 0
T0
Text Label 1650 3950 0    50   ~ 0
SDA
Text Label 1650 3850 0    50   ~ 0
SCL
Wire Wire Line
	5650 5050 5700 5050
Text Label 5700 5050 0    50   ~ 0
A0
Wire Wire Line
	1550 4450 1650 4450
Text Label 1650 4450 0    50   ~ 0
A0
NoConn ~ 1550 5050
NoConn ~ 1550 4750
NoConn ~ 1550 4850
NoConn ~ 1550 4950
Wire Wire Line
	5700 4950 5650 4950
NoConn ~ 5650 5250
Wire Wire Line
	1550 4550 1650 4550
Text Label 1650 4550 0    50   ~ 0
WP
$EndSCHEMATC
