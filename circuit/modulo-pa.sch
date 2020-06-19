EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3200 4550 0    50   ~ 0
jfet_d
$Comp
L myAmp:R R?
U 1 1 612489B5
P 3600 5000
AR Path="/612489B5" Ref="R?"  Part="1" 
AR Path="/60D4580B/612489B5" Ref="R37"  Part="1" 
F 0 "R37" H 3650 4950 50  0000 L CNN
F 1 "1M" H 3650 5050 50  0000 L CNN
F 2 "myAmp:R_10MM" V 3530 5000 50  0001 C CNN
F 3 "" H 3600 5000 50  0001 C CNN
	1    3600 5000
	-1   0    0    1   
$EndComp
$Comp
L myAmp:R R?
U 1 1 612489BB
P 3600 5400
AR Path="/612489BB" Ref="R?"  Part="1" 
AR Path="/60D4580B/612489BB" Ref="R38"  Part="1" 
F 0 "R38" H 3650 5350 50  0000 L CNN
F 1 "100" H 3650 5450 50  0000 L CNN
F 2 "myAmp:R_10MM" V 3530 5400 50  0001 C CNN
F 3 "" H 3600 5400 50  0001 C CNN
	1    3600 5400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 5150 3600 5200
Connection ~ 3600 5200
Wire Wire Line
	3600 5200 3600 5250
$Comp
L myAmp:SW_SPDT SW?
U 1 1 612489C4
P 4100 5200
AR Path="/612489C4" Ref="SW?"  Part="1" 
AR Path="/60D4580B/612489C4" Ref="SW3"  Part="1" 
F 0 "SW3" H 4100 5431 50  0000 C CNN
F 1 "Idss/Vp" H 4100 5340 50  0000 C CNN
F 2 "myAmp:PIN_1x03" H 4100 5200 50  0001 C CNN
F 3 "" H 4100 5200 50  0001 C CNN
	1    4100 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5200 4000 5200
Text Label 3750 5200 0    50   ~ 0
jfet_g
Wire Wire Line
	3600 4850 3600 4750
Text Label 3750 4750 0    50   ~ 0
jfet_s
Wire Wire Line
	4450 4750 4450 5150
Wire Wire Line
	4450 5150 4200 5150
Wire Wire Line
	3600 4750 4450 4750
Wire Wire Line
	3600 5550 3600 5650
Wire Wire Line
	3600 5650 4450 5650
Wire Wire Line
	4450 5650 4450 5250
Wire Wire Line
	4450 5250 4200 5250
Connection ~ 3600 5650
Text Notes 4500 5000 0    50   ~ 0
Idss
Text Notes 4500 5450 0    50   ~ 0
Vp
$Comp
L myAmp:CONN_01X02 TPoint?
U 1 1 612489D8
P 5050 4800
AR Path="/612489D8" Ref="TPoint?"  Part="1" 
AR Path="/60D4580B/612489D8" Ref="TPoint1"  Part="1" 
F 0 "TPoint1" H 5128 4795 50  0000 L CNN
F 1 "CONN_01X02" V 5150 4800 50  0001 C CNN
F 2 "myAmp:TestPoints" H 5050 4800 50  0001 C CNN
F 3 "" H 5050 4800 50  0001 C CNN
	1    5050 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4750 4850 4750
Connection ~ 4450 4750
Wire Wire Line
	4850 4850 4800 4850
Wire Wire Line
	4800 4850 4800 5650
Wire Wire Line
	4800 5650 4450 5650
Connection ~ 4450 5650
Wire Wire Line
	3200 5650 3600 5650
Wire Wire Line
	3200 5200 3200 5650
Wire Wire Line
	3200 4800 3200 4550
$Comp
L myAmp:Battery TPow?
U 1 1 612489E7
P 3200 5000
AR Path="/612489E7" Ref="TPow?"  Part="1" 
AR Path="/60D4580B/612489E7" Ref="TPow1"  Part="1" 
F 0 "TPow1" H 2850 5050 50  0000 L CNN
F 1 "TestDC" H 2850 4950 50  0000 L CNN
F 2 "myAmp:TestPower" V 3200 5060 50  0001 C CNN
F 3 "" V 3200 5060 50  0001 C CNN
	1    3200 5000
	1    0    0    -1  
$EndComp
$Comp
L myAmp:TLE2426 U?
U 1 1 61476317
P 9500 1200
AR Path="/61476317" Ref="U?"  Part="1" 
AR Path="/60D4580B/61476317" Ref="U1"  Part="1" 
F 0 "U1" H 9467 1565 50  0000 C CNN
F 1 "TLE2426" H 9467 1474 50  0000 C CNN
F 2 "myAmp:TO-92_Inline_Wide" H 9300 1000 50  0001 C CNN
F 3 "" H 9300 1000 50  0001 C CNN
	1    9500 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6147631D
P 9500 1750
AR Path="/6147631D" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/6147631D" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 9500 1500 50  0001 C CNN
F 1 "GND" H 9505 1577 50  0000 C CNN
F 2 "" H 9500 1750 50  0001 C CNN
F 3 "" H 9500 1750 50  0001 C CNN
	1    9500 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1100 9050 1200
Wire Wire Line
	9050 1200 9150 1200
Text Notes 8350 2350 0    150  ~ 0
virtual ground
$Comp
L myAmp:C C?
U 1 1 61476326
P 9050 1450
AR Path="/61476326" Ref="C?"  Part="1" 
AR Path="/60D4580B/61476326" Ref="C3"  Part="1" 
F 0 "C3" H 9000 1350 50  0000 R CNN
F 1 "100nF" H 8900 1550 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 9088 1300 50  0001 C CNN
F 3 "" H 9050 1450 50  0001 C CNN
	1    9050 1450
	1    0    0    1   
$EndComp
$Comp
L myAmp:BC547 Q?
U 1 1 6147632C
P 8750 3150
AR Path="/6147632C" Ref="Q?"  Part="1" 
AR Path="/60D4580B/6147632C" Ref="Q2"  Part="1" 
F 0 "Q2" H 8941 3196 50  0000 L CNN
F 1 "BC547" H 8941 3105 50  0000 L CNN
F 2 "myAmp:TO-92_Inline_Wide" H 8950 3075 50  0001 L CIN
F 3 "" H 8750 3150 50  0000 L CNN
	1    8750 3150
	1    0    0    -1  
$EndComp
$Comp
L myAmp:BC557 Q?
U 1 1 61476332
P 8750 4350
AR Path="/61476332" Ref="Q?"  Part="1" 
AR Path="/60D4580B/61476332" Ref="Q3"  Part="1" 
F 0 "Q3" H 8941 4304 50  0000 L CNN
F 1 "BC557" H 8941 4395 50  0000 L CNN
F 2 "myAmp:TO-92_Inline_Wide" H 8950 4275 50  0001 L CIN
F 3 "" H 8750 4350 50  0001 L CNN
	1    8750 4350
	1    0    0    1   
$EndComp
$Comp
L myAmp:R R?
U 1 1 61476338
P 8850 3550
AR Path="/61476338" Ref="R?"  Part="1" 
AR Path="/60D4580B/61476338" Ref="R22"  Part="1" 
F 0 "R22" H 8800 3500 50  0000 R CNN
F 1 "10" H 8800 3600 50  0000 R CNN
F 2 "myAmp:R_10MM" V 8780 3550 50  0001 C CNN
F 3 "" H 8850 3550 50  0001 C CNN
	1    8850 3550
	-1   0    0    1   
$EndComp
$Comp
L myAmp:R R?
U 1 1 6147633E
P 8850 3950
AR Path="/6147633E" Ref="R?"  Part="1" 
AR Path="/60D4580B/6147633E" Ref="R25"  Part="1" 
F 0 "R25" H 8800 3900 50  0000 R CNN
F 1 "10" H 8800 4000 50  0000 R CNN
F 2 "myAmp:R_10MM" V 8780 3950 50  0001 C CNN
F 3 "" H 8850 3950 50  0001 C CNN
	1    8850 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	8850 3700 8850 3750
Wire Wire Line
	8500 3750 8850 3750
Connection ~ 8850 3750
Wire Wire Line
	8850 3750 9700 3750
Wire Wire Line
	8850 3750 8850 3800
Wire Wire Line
	8850 4100 8850 4150
Wire Wire Line
	8850 3350 8850 3400
$Comp
L myAmp:1N4148 D?
U 1 1 6147634B
P 8500 3450
AR Path="/6147634B" Ref="D?"  Part="1" 
AR Path="/60D4580B/6147634B" Ref="D4"  Part="1" 
F 0 "D4" V 8550 3600 50  0000 R CNN
F 1 "1N4148" V 8450 3800 50  0000 R CNN
F 2 "myAmp:DO35" H 8500 3450 50  0001 C CNN
F 3 "" H 8500 3450 50  0001 C CNN
	1    8500 3450
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:1N4148 D?
U 1 1 61476351
P 8500 4050
AR Path="/61476351" Ref="D?"  Part="1" 
AR Path="/60D4580B/61476351" Ref="D5"  Part="1" 
F 0 "D5" V 8550 4200 50  0000 R CNN
F 1 "1N4148" V 8450 4400 50  0000 R CNN
F 2 "myAmp:DO35" H 8500 4050 50  0001 C CNN
F 3 "" H 8500 4050 50  0001 C CNN
	1    8500 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8500 3600 8500 3750
Wire Wire Line
	8500 3750 8500 3900
Connection ~ 8500 3750
Wire Wire Line
	8050 3750 8500 3750
$Comp
L myAmp:R R?
U 1 1 6147635B
P 8500 4550
AR Path="/6147635B" Ref="R?"  Part="1" 
AR Path="/60D4580B/6147635B" Ref="R27"  Part="1" 
F 0 "R27" H 8700 4500 50  0000 R CNN
F 1 "4K7" H 8700 4600 50  0000 R CNN
F 2 "myAmp:R_10MM" V 8430 4550 50  0001 C CNN
F 3 "" H 8500 4550 50  0001 C CNN
	1    8500 4550
	-1   0    0    1   
$EndComp
$Comp
L myAmp:R R?
U 1 1 61476361
P 8500 2950
AR Path="/61476361" Ref="R?"  Part="1" 
AR Path="/60D4580B/61476361" Ref="R15"  Part="1" 
F 0 "R15" H 8550 2900 50  0000 L CNN
F 1 "4K7" H 8700 3000 50  0000 R CNN
F 2 "myAmp:R_10MM" V 8430 2950 50  0001 C CNN
F 3 "" H 8500 2950 50  0001 C CNN
	1    8500 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	8500 3100 8500 3150
Wire Wire Line
	8550 3150 8500 3150
Connection ~ 8500 3150
Wire Wire Line
	8500 3150 8500 3300
Wire Wire Line
	8500 4200 8500 4350
Wire Wire Line
	8550 4350 8500 4350
Connection ~ 8500 4350
Wire Wire Line
	8500 4350 8500 4400
$Comp
L myAmp:CPOL C?
U 1 1 6147636F
P 8050 3200
AR Path="/6147636F" Ref="C?"  Part="1" 
AR Path="/60D4580B/6147636F" Ref="C16"  Part="1" 
F 0 "C16" H 8100 3300 50  0000 L CNN
F 1 "220μF" H 8100 3100 50  0000 L CNN
F 2 "myAmp:CPOL_D6.3_P2.5" H 8050 3200 50  0001 C CNN
F 3 "" H 8050 3200 50  0001 C CNN
	1    8050 3200
	-1   0    0    -1  
$EndComp
$Comp
L myAmp:CPOL C?
U 1 1 61476375
P 8050 4300
AR Path="/61476375" Ref="C?"  Part="1" 
AR Path="/60D4580B/61476375" Ref="C20"  Part="1" 
F 0 "C20" H 8100 4400 50  0000 L CNN
F 1 "220μF" H 8100 4200 50  0000 L CNN
F 2 "myAmp:CPOL_D6.3_P2.5" H 8050 4300 50  0001 C CNN
F 3 "" H 8050 4300 50  0001 C CNN
	1    8050 4300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6147637B
P 8500 4850
AR Path="/6147637B" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/6147637B" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 8500 4600 50  0001 C CNN
F 1 "GND" H 8505 4677 50  0000 C CNN
F 2 "" H 8500 4850 50  0001 C CNN
F 3 "" H 8500 4850 50  0001 C CNN
	1    8500 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4550 8850 4750
Wire Wire Line
	8850 4750 8500 4750
Wire Wire Line
	8050 4750 8050 4400
Wire Wire Line
	8050 4200 8050 3750
Connection ~ 8050 3750
Wire Wire Line
	8050 3300 8050 3750
Wire Wire Line
	8850 2750 8500 2750
Wire Wire Line
	8050 2750 8050 3100
Wire Wire Line
	8850 2750 8850 2950
Wire Wire Line
	8500 2800 8500 2750
Connection ~ 8500 2750
Wire Wire Line
	8500 2750 8050 2750
Wire Wire Line
	8500 2750 8500 2700
Wire Wire Line
	8500 4700 8500 4750
Connection ~ 8500 4750
Wire Wire Line
	8500 4750 8050 4750
Wire Wire Line
	8500 4850 8500 4750
Wire Wire Line
	9500 1550 9500 1650
Wire Wire Line
	9500 1650 9500 1750
Connection ~ 9500 1650
$Comp
L power:+12V #PWR?
U 1 1 61476399
P 9050 1100
AR Path="/61476399" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/61476399" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 9050 950 50  0001 C CNN
F 1 "+12V" H 9065 1273 50  0000 C CNN
F 2 "" H 9050 1100 50  0001 C CNN
F 3 "" H 9050 1100 50  0001 C CNN
	1    9050 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 6147639F
P 8500 2700
AR Path="/6147639F" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/6147639F" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 8500 2550 50  0001 C CNN
F 1 "+12V" H 8515 2873 50  0000 C CNN
F 2 "" H 8500 2700 50  0001 C CNN
F 3 "" H 8500 2700 50  0001 C CNN
	1    8500 2700
	1    0    0    -1  
$EndComp
$Comp
L myAmp:SW_SPDT SW?
U 1 1 614763A5
P 9550 2950
AR Path="/614763A5" Ref="SW?"  Part="1" 
AR Path="/60D4580B/614763A5" Ref="SW4"  Part="1" 
F 0 "SW4" H 9550 2719 50  0000 C CNN
F 1 "disc/TLE2426" H 9550 2810 50  0000 C CNN
F 2 "myAmp:ESP2010_switch" H 9550 2950 50  0001 C CNN
F 3 "" H 9550 2950 50  0001 C CNN
	1    9550 2950
	1    0    0    1   
$EndComp
Wire Wire Line
	10300 1200 10300 2900
Wire Wire Line
	10300 2900 9650 2900
Wire Wire Line
	9650 3000 9700 3000
Wire Wire Line
	9700 3000 9700 3750
Text Label 9050 2950 0    50   ~ 0
PA_VGND
Wire Wire Line
	9050 2950 9450 2950
Text Label 10300 1200 0    50   ~ 0
vgnd_tle
Text Label 9200 3750 0    50   ~ 0
vgnd_disc
$Comp
L myAmp:C C?
U 1 1 615268B9
P 6000 1600
AR Path="/615268B9" Ref="C?"  Part="1" 
AR Path="/60D4580B/615268B9" Ref="C2"  Part="1" 
F 0 "C2" V 5950 1500 50  0000 C CNN
F 1 "680pF" V 5950 1750 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 6038 1450 50  0001 C CNN
F 3 "" H 6000 1600 50  0001 C CNN
	1    6000 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 1600 6300 1600
Wire Wire Line
	6300 1600 6300 1700
$Comp
L myAmp:R R?
U 1 1 615268C1
P 5750 1850
AR Path="/615268C1" Ref="R?"  Part="1" 
AR Path="/60D4580B/615268C1" Ref="R4"  Part="1" 
F 0 "R4" H 5900 1800 50  0000 R CNN
F 1 "100K" H 6000 1900 50  0000 R CNN
F 2 "myAmp:R_10MM" V 5680 1850 50  0001 C CNN
F 3 "" H 5750 1850 50  0001 C CNN
	1    5750 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 1600 5750 1700
Wire Wire Line
	5750 1600 5900 1600
$Comp
L myAmp:C C?
U 1 1 615268C9
P 6000 2150
AR Path="/615268C9" Ref="C?"  Part="1" 
AR Path="/60D4580B/615268C9" Ref="C8"  Part="1" 
F 0 "C8" V 5950 2100 50  0000 R CNN
F 1 "250nF" V 5950 2300 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 6038 2000 50  0001 C CNN
F 3 "" H 6000 2150 50  0001 C CNN
	1    6000 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 2000 5750 2150
Wire Wire Line
	5750 2150 5900 2150
Wire Wire Line
	6300 2000 6300 2150
Wire Wire Line
	6100 2150 6300 2150
Connection ~ 6300 2150
Wire Wire Line
	6450 2400 6500 2400
$Comp
L myAmp:C C?
U 1 1 615268D5
P 6000 2650
AR Path="/615268D5" Ref="C?"  Part="1" 
AR Path="/60D4580B/615268D5" Ref="C12"  Part="1" 
F 0 "C12" V 6050 2850 50  0000 R CNN
F 1 "47nF" V 6050 2500 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 6038 2500 50  0001 C CNN
F 3 "" H 6000 2650 50  0001 C CNN
	1    6000 2650
	0    -1   -1   0   
$EndComp
Connection ~ 5750 2150
$Comp
L myAmp:R R?
U 1 1 615268DC
P 2750 2200
AR Path="/615268DC" Ref="R?"  Part="1" 
AR Path="/60D4580B/615268DC" Ref="R7"  Part="1" 
F 0 "R7" H 2820 2246 50  0000 L CNN
F 1 "1M" H 2820 2155 50  0000 L CNN
F 2 "myAmp:R_10MM" V 2680 2200 50  0001 C CNN
F 3 "" H 2750 2200 50  0001 C CNN
	1    2750 2200
	1    0    0    -1  
$EndComp
$Comp
L myAmp:J201 Q?
U 1 1 615268E2
P 3100 1750
AR Path="/615268E2" Ref="Q?"  Part="1" 
AR Path="/60D4580B/615268E2" Ref="Q1"  Part="1" 
F 0 "Q1" H 3291 1846 50  0000 L CNN
F 1 "MMBFJ201" H 3291 1755 50  0000 L CNN
F 2 "myAmp:SOT-23_with_jig" H 3100 1750 50  0001 C CNN
F 3 "" H 3100 1700 50  0001 L CNN
	1    3100 1750
	1    0    0    -1  
$EndComp
$Comp
L myAmp:JACK_MONO J?
U 1 1 615268E8
P 1450 1600
AR Path="/615268E8" Ref="J?"  Part="1" 
AR Path="/60D4580B/615268E8" Ref="J1"  Part="1" 
F 0 "J1" H 1433 2015 50  0000 C CNN
F 1 "JACK_MONO" H 1433 1924 50  0000 C CNN
F 2 "myAmp:JACK_CL13106" H 1700 1550 50  0001 C CNN
F 3 "" H 1550 1550 50  0001 C CNN
	1    1450 1600
	1    0    0    -1  
$EndComp
$Comp
L myAmp:Zener D?
U 1 1 615268EE
P 2450 2000
AR Path="/615268EE" Ref="D?"  Part="1" 
AR Path="/60D4580B/615268EE" Ref="D1"  Part="1" 
F 0 "D1" V 2450 2150 50  0000 L CNN
F 1 "1N4773a" V 2350 2150 50  0000 L CNN
F 2 "myAmp:DO41" H 2450 2000 50  0001 C CNN
F 3 "" H 2450 2000 50  0000 C CNN
	1    2450 2000
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:Zener D?
U 1 1 615268F4
P 2450 2300
AR Path="/615268F4" Ref="D?"  Part="1" 
AR Path="/60D4580B/615268F4" Ref="D2"  Part="1" 
F 0 "D2" V 2400 2050 50  0000 L CNN
F 1 "1N4773a" V 2500 1800 50  0000 L CNN
F 2 "myAmp:DO41" H 2450 2300 50  0001 C CNN
F 3 "" H 2450 2300 50  0000 C CNN
	1    2450 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 2100 2450 2200
Wire Wire Line
	2900 1800 2750 1800
Wire Wire Line
	2450 1800 2450 1900
$Comp
L power:GND #PWR?
U 1 1 615268FD
P 2450 2500
AR Path="/615268FD" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/615268FD" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 2450 2250 50  0001 C CNN
F 1 "GND" H 2455 2327 50  0000 C CNN
F 2 "" H 2450 2500 50  0001 C CNN
F 3 "" H 2450 2500 50  0001 C CNN
	1    2450 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2500 2450 2400
Wire Wire Line
	2750 1800 2750 2050
Connection ~ 2750 1800
Wire Wire Line
	2750 1800 2450 1800
$Comp
L power:GND #PWR?
U 1 1 61526907
P 2750 2500
AR Path="/61526907" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/61526907" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 2750 2250 50  0001 C CNN
F 1 "GND" H 2755 2327 50  0000 C CNN
F 2 "" H 2750 2500 50  0001 C CNN
F 3 "" H 2750 2500 50  0001 C CNN
	1    2750 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2350 2750 2500
$Comp
L power:GND #PWR?
U 1 1 6152690E
P 3200 2550
AR Path="/6152690E" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/6152690E" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 3200 2300 50  0001 C CNN
F 1 "GND" H 3205 2377 50  0000 C CNN
F 2 "" H 3200 2550 50  0001 C CNN
F 3 "" H 3200 2550 50  0001 C CNN
	1    3200 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61526914
P 2050 1450
AR Path="/61526914" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/61526914" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 2050 1200 50  0001 C CNN
F 1 "GND" H 2055 1277 50  0000 C CNN
F 2 "" H 2050 1450 50  0001 C CNN
F 3 "" H 2050 1450 50  0001 C CNN
	1    2050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1400 1900 1400
Wire Wire Line
	1900 1400 1900 1500
Wire Wire Line
	1900 1700 1850 1700
Wire Wire Line
	1850 1500 1900 1500
Connection ~ 1900 1500
Wire Wire Line
	1900 1500 1900 1700
Wire Wire Line
	1900 1400 2050 1400
Wire Wire Line
	2050 1400 2050 1450
Connection ~ 1900 1400
$Comp
L myAmp:C C?
U 1 1 61526923
P 3950 1500
AR Path="/61526923" Ref="C?"  Part="1" 
AR Path="/60D4580B/61526923" Ref="C1"  Part="1" 
F 0 "C1" V 3718 1500 50  0000 C CNN
F 1 "1μF" V 3809 1500 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 3988 1350 50  0001 C CNN
F 3 "" H 3950 1500 50  0001 C CNN
	1    3950 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 2150 3200 2100
Wire Wire Line
	3200 2450 3200 2500
Wire Wire Line
	4100 2750 4100 2800
$Comp
L power:GND #PWR?
U 1 1 6152692C
P 4100 3550
AR Path="/6152692C" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/6152692C" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 4100 3300 50  0001 C CNN
F 1 "GND" H 4105 3377 50  0000 C CNN
F 2 "" H 4100 3550 50  0001 C CNN
F 3 "" H 4100 3550 50  0001 C CNN
	1    4100 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3450 4100 3500
Wire Wire Line
	4700 1700 4650 1700
Wire Wire Line
	4650 1700 4650 2050
Wire Wire Line
	5350 2300 5350 2050
Wire Wire Line
	5350 1600 5300 1600
$Comp
L myAmp:C C?
U 1 1 61526937
P 7200 2300
AR Path="/61526937" Ref="C?"  Part="1" 
AR Path="/60D4580B/61526937" Ref="C7"  Part="1" 
F 0 "C7" V 7150 2150 50  0000 C CNN
F 1 "1nF" V 7150 2450 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 7238 2150 50  0001 C CNN
F 3 "" H 7200 2300 50  0001 C CNN
	1    7200 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 2300 6800 2300
Wire Wire Line
	7450 1950 7550 1950
Wire Wire Line
	7550 1950 7550 2300
Wire Wire Line
	7300 2300 7550 2300
Connection ~ 7550 2300
Wire Wire Line
	7550 2300 7550 2550
$Comp
L myAmp:C C?
U 1 1 61526944
P 5000 2050
AR Path="/61526944" Ref="C?"  Part="1" 
AR Path="/60D4580B/61526944" Ref="C10"  Part="1" 
F 0 "C10" V 4950 1900 50  0000 C CNN
F 1 "1nF" V 4950 2200 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 5038 1900 50  0001 C CNN
F 3 "" H 5000 2050 50  0001 C CNN
	1    5000 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 2050 4650 2050
Connection ~ 4650 2050
Wire Wire Line
	5100 2050 5350 2050
Connection ~ 5350 2050
Wire Wire Line
	5350 2050 5350 1600
$Comp
L myAmp:C C?
U 1 1 6152694F
P 3900 3150
AR Path="/6152694F" Ref="C?"  Part="1" 
AR Path="/60D4580B/6152694F" Ref="C22"  Part="1" 
F 0 "C22" H 4000 3250 50  0000 C CNN
F 1 "100nF" H 4050 3050 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 3938 3000 50  0001 C CNN
F 3 "" H 3900 3150 50  0001 C CNN
	1    3900 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 3050 3900 2800
Wire Wire Line
	3900 2800 4100 2800
Connection ~ 4100 2800
Wire Wire Line
	4100 2800 4100 2850
Wire Wire Line
	3900 3250 3900 3500
Wire Wire Line
	3900 3500 4100 3500
Connection ~ 4100 3500
Wire Wire Line
	4100 3500 4100 3550
Wire Wire Line
	6300 2550 6300 2650
Wire Wire Line
	5750 2650 5900 2650
Wire Wire Line
	5750 2150 5750 2650
Connection ~ 6300 2650
Wire Wire Line
	6300 2650 6300 2750
Wire Wire Line
	6300 3050 6300 3150
$Comp
L myAmp:TL072 U?
U 1 1 61526963
P 5000 1600
AR Path="/61526963" Ref="U?"  Part="1" 
AR Path="/60D4580B/61526963" Ref="U2"  Part="1" 
F 0 "U2" H 5000 1967 50  0000 C CNN
F 1 "NE5532" H 5000 1876 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 5000 1600 50  0001 C CNN
F 3 "" H 5000 1600 50  0001 C CNN
	1    5000 1600
	1    0    0    -1  
$EndComp
$Comp
L myAmp:TL072 U?
U 3 1 61526969
P 4200 3150
AR Path="/61526969" Ref="U?"  Part="3" 
AR Path="/60D4580B/61526969" Ref="U2"  Part="3" 
F 0 "U2" H 4158 3196 50  0000 L CNN
F 1 "NE5532" H 4158 3105 50  0000 L CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 4200 3150 50  0001 C CNN
F 3 "" H 4200 3150 50  0001 C CNN
	3    4200 3150
	1    0    0    -1  
$EndComp
$Comp
L myAmp:R R?
U 1 1 6152696F
P 4200 1900
AR Path="/6152696F" Ref="R?"  Part="1" 
AR Path="/60D4580B/6152696F" Ref="R5"  Part="1" 
F 0 "R5" H 4270 1946 50  0000 L CNN
F 1 "1M" H 4270 1855 50  0000 L CNN
F 2 "myAmp:R_10MM" V 4130 1900 50  0001 C CNN
F 3 "" H 4200 1900 50  0001 C CNN
	1    4200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 1500 4200 1500
Wire Wire Line
	4200 1500 4200 1750
Wire Wire Line
	4200 1500 4700 1500
Connection ~ 4200 1500
$Comp
L myAmp:R R?
U 1 1 61526979
P 5000 2300
AR Path="/61526979" Ref="R?"  Part="1" 
AR Path="/60D4580B/61526979" Ref="R11"  Part="1" 
F 0 "R11" V 5000 2300 50  0000 C CNN
F 1 "10K" V 4900 2300 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4930 2300 50  0001 C CNN
F 3 "" H 5000 2300 50  0001 C CNN
	1    5000 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 2300 5350 2300
Wire Wire Line
	4650 2300 4850 2300
Wire Wire Line
	4650 2050 4650 2300
$Comp
L myAmp:R R?
U 1 1 61526982
P 4450 2300
AR Path="/61526982" Ref="R?"  Part="1" 
AR Path="/60D4580B/61526982" Ref="R10"  Part="1" 
F 0 "R10" V 4450 2300 50  0000 C CNN
F 1 "1K" V 4350 2300 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4380 2300 50  0001 C CNN
F 3 "" H 4450 2300 50  0001 C CNN
	1    4450 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 2300 4650 2300
Connection ~ 4650 2300
Wire Wire Line
	4200 2300 4300 2300
Wire Wire Line
	4200 2300 4200 2050
Wire Wire Line
	3750 2300 4200 2300
Connection ~ 4200 2300
Wire Wire Line
	7550 2550 7350 2550
Wire Wire Line
	7050 2550 6800 2550
Wire Wire Line
	6800 2300 6800 2550
$Comp
L myAmp:R R?
U 1 1 61526997
P 6800 2850
AR Path="/61526997" Ref="R?"  Part="1" 
AR Path="/60D4580B/61526997" Ref="R13"  Part="1" 
F 0 "R13" H 7000 2900 50  0000 R CNN
F 1 "1K" H 6950 2800 50  0000 R CNN
F 2 "myAmp:R_10MM" V 6730 2850 50  0001 C CNN
F 3 "" H 6800 2850 50  0001 C CNN
	1    6800 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2700 6800 2550
Connection ~ 6800 2550
Wire Wire Line
	6800 3150 6300 3150
Wire Wire Line
	6800 3000 6800 3150
Text Label 7550 1950 0    50   ~ 0
PA_OUT
Wire Wire Line
	6100 2650 6300 2650
Wire Wire Line
	6300 2650 6500 2650
Wire Wire Line
	6500 2650 6500 2900
Wire Wire Line
	6500 2900 6450 2900
Text Notes 4000 1100 0    150  ~ 0
input
Text Notes 5850 1100 0    150  ~ 0
tone
Text Notes 6950 1100 0    150  ~ 0
gain
Wire Wire Line
	6300 2150 6300 2250
Wire Wire Line
	6300 2150 6500 2150
Wire Wire Line
	6500 2150 6500 2400
Connection ~ 2450 1800
Wire Wire Line
	3200 1450 3200 1500
Connection ~ 3200 1500
Wire Wire Line
	3200 1500 3200 1550
Connection ~ 5350 1600
Connection ~ 5750 1600
$Comp
L myAmp:R_POT RV?
U 1 1 615269B2
P 6300 2900
AR Path="/615269B2" Ref="RV?"  Part="1" 
AR Path="/60D4580B/615269B2" Ref="RV3"  Part="1" 
F 0 "RV3" H 6100 2850 50  0000 L CNN
F 1 "10K" H 6100 2950 50  0000 L CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 6300 2900 50  0001 C CNN
F 3 "" H 6300 2900 50  0001 C CNN
	1    6300 2900
	1    0    0    1   
$EndComp
Text Notes 6350 3100 0    50   ~ 0
mid
Text Notes 6350 2600 0    50   ~ 0
bass
$Comp
L myAmp:R_POT RV?
U 1 1 615269BA
P 6300 2400
AR Path="/615269BA" Ref="RV?"  Part="1" 
AR Path="/60D4580B/615269BA" Ref="RV2"  Part="1" 
F 0 "RV2" H 6250 2350 50  0000 R CNN
F 1 "A100K" H 6250 2450 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 6300 2400 50  0001 C CNN
F 3 "" H 6300 2400 50  0001 C CNN
	1    6300 2400
	1    0    0    1   
$EndComp
Text Notes 6350 2050 0    50   ~ 0
treble
$Comp
L myAmp:TL072 U?
U 2 1 615269C7
P 7150 1950
AR Path="/615269C7" Ref="U?"  Part="2" 
AR Path="/60D4580B/615269C7" Ref="U2"  Part="2" 
F 0 "U2" H 7150 2317 50  0000 C CNN
F 1 "NE5532" H 7150 2226 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 7150 1950 50  0001 C CNN
F 3 "" H 7150 1950 50  0001 C CNN
	2    7150 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2050 6800 2050
Wire Wire Line
	6800 2050 6800 2300
Connection ~ 6800 2300
Wire Wire Line
	1850 1800 2450 1800
Wire Wire Line
	3200 1500 3850 1500
Wire Wire Line
	6450 1850 6850 1850
Wire Wire Line
	5350 1600 5750 1600
$Comp
L myAmp:R R?
U 1 1 615269D5
P 3200 2300
AR Path="/615269D5" Ref="R?"  Part="1" 
AR Path="/60D4580B/615269D5" Ref="R8"  Part="1" 
F 0 "R8" H 3250 2350 50  0000 L CNN
F 1 "1" H 3250 2250 50  0000 L CNN
F 2 "myAmp:R_10MM" V 3130 2300 50  0001 C CNN
F 3 "" H 3200 2300 50  0001 C CNN
	1    3200 2300
	-1   0    0    -1  
$EndComp
Text Label 3750 2300 0    50   ~ 0
PA_VGND
Text Label 6900 3150 0    50   ~ 0
PA_VGND
Wire Wire Line
	6800 3150 6900 3150
Connection ~ 6800 3150
Text Label 3300 1500 0    50   ~ 0
jfet_d
Text Label 3200 2000 0    50   ~ 0
jfet_s
Text Label 2750 1700 0    50   ~ 0
jfet_g
Wire Wire Line
	2750 1700 2750 1800
$Comp
L myAmp:R R?
U 1 1 615269E3
P 3200 1300
AR Path="/615269E3" Ref="R?"  Part="1" 
AR Path="/60D4580B/615269E3" Ref="R2"  Part="1" 
F 0 "R2" H 3250 1250 50  0000 L CNN
F 1 "1" H 3250 1350 50  0000 L CNN
F 2 "myAmp:R_10MM" V 3130 1300 50  0001 C CNN
F 3 "" H 3200 1300 50  0001 C CNN
	1    3200 1300
	1    0    0    1   
$EndComp
Wire Wire Line
	3200 1050 3200 1100
$Comp
L myAmp:R R?
U 1 1 615269EA
P 3350 2300
AR Path="/615269EA" Ref="R?"  Part="1" 
AR Path="/60D4580B/615269EA" Ref="R9"  Part="1" 
F 0 "R9" H 3400 2350 50  0000 L CNN
F 1 "1" H 3400 2250 50  0000 L CNN
F 2 "myAmp:R_10MM" V 3280 2300 50  0001 C CNN
F 3 "" H 3350 2300 50  0001 C CNN
	1    3350 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2100 3350 2100
Wire Wire Line
	3350 2100 3350 2150
Connection ~ 3200 2100
Wire Wire Line
	3200 2100 3200 1950
Wire Wire Line
	3350 2450 3350 2500
Wire Wire Line
	3350 2500 3200 2500
Connection ~ 3200 2500
Wire Wire Line
	3200 2500 3200 2550
$Comp
L myAmp:R R?
U 1 1 615269F8
P 3050 1300
AR Path="/615269F8" Ref="R?"  Part="1" 
AR Path="/60D4580B/615269F8" Ref="R1"  Part="1" 
F 0 "R1" H 3100 1250 50  0000 L CNN
F 1 "1" H 3100 1350 50  0000 L CNN
F 2 "myAmp:R_10MM" V 2980 1300 50  0001 C CNN
F 3 "" H 3050 1300 50  0001 C CNN
	1    3050 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	3050 1150 3050 1100
Wire Wire Line
	3050 1100 3200 1100
Connection ~ 3200 1100
Wire Wire Line
	3200 1100 3200 1150
Wire Wire Line
	3200 1500 3050 1500
Wire Wire Line
	3050 1500 3050 1450
$Comp
L power:+12V #PWR?
U 1 1 61526A04
P 3200 1050
AR Path="/61526A04" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/61526A04" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 3200 900 50  0001 C CNN
F 1 "+12V" H 3215 1223 50  0000 C CNN
F 2 "" H 3200 1050 50  0001 C CNN
F 3 "" H 3200 1050 50  0001 C CNN
	1    3200 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 61526A0A
P 4100 2750
AR Path="/61526A0A" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/61526A0A" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 4100 2600 50  0001 C CNN
F 1 "+12V" H 4115 2923 50  0000 C CNN
F 2 "" H 4100 2750 50  0001 C CNN
F 3 "" H 4100 2750 50  0001 C CNN
	1    4100 2750
	1    0    0    -1  
$EndComp
$Comp
L myAmp:R R?
U 1 1 6152698E
P 7200 2550
AR Path="/6152698E" Ref="R?"  Part="1" 
AR Path="/60D4580B/6152698E" Ref="R12"  Part="1" 
F 0 "R12" V 7200 2550 50  0000 C CNN
F 1 "10K" V 7100 2550 50  0000 C CNN
F 2 "myAmp:R_10MM" V 7130 2550 50  0001 C CNN
F 3 "" H 7200 2550 50  0001 C CNN
	1    7200 2550
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:modulo-bus U14
U 1 1 61541D7D
P 900 4050
F 0 "U14" H 842 5365 50  0000 C CNN
F 1 "modulo-bus" H 842 5274 50  0000 C CNN
F 2 "myAmp:modulo-bus" V 1100 4750 50  0001 C CNN
F 3 "" H 550 4600 50  0001 C CNN
	1    900  4050
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 615442F6
P 1500 3000
AR Path="/615442F6" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/615442F6" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 1500 2750 50  0001 C CNN
F 1 "GND" H 1505 2827 50  0000 C CNN
F 2 "" H 1500 3000 50  0001 C CNN
F 3 "" H 1500 3000 50  0001 C CNN
	1    1500 3000
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 615449F7
P 1500 3200
AR Path="/615449F7" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/615449F7" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 1500 3050 50  0001 C CNN
F 1 "+12V" V 1515 3328 50  0000 L CNN
F 2 "" H 1500 3200 50  0001 C CNN
F 3 "" H 1500 3200 50  0001 C CNN
	1    1500 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 3000 1250 3000
Wire Wire Line
	1500 3200 1250 3200
Wire Wire Line
	1250 3600 1350 3600
Wire Wire Line
	1350 3600 1350 3700
Wire Wire Line
	1350 3700 1250 3700
Wire Wire Line
	1350 3600 1450 3600
Connection ~ 1350 3600
Text Label 1450 3600 0    50   ~ 0
PA_OUT
NoConn ~ 1250 3100
NoConn ~ 1250 3300
NoConn ~ 1250 3400
NoConn ~ 1250 4000
NoConn ~ 1250 4200
NoConn ~ 1250 4300
NoConn ~ 1250 4400
NoConn ~ 1250 4500
NoConn ~ 1250 4600
NoConn ~ 1250 4700
NoConn ~ 1250 4800
NoConn ~ 1250 4900
NoConn ~ 1250 5100
NoConn ~ 1250 5200
NoConn ~ 1250 5300
Text Notes 3100 5900 0    150  ~ 0
jfet measure jig
$Comp
L myAmp:HOLE J?
U 1 1 5F004702
P 6450 6850
AR Path="/5F004702" Ref="J?"  Part="1" 
AR Path="/60D4580B/5F004702" Ref="J3"  Part="1" 
F 0 "J3" H 6527 6891 50  0000 L CNN
F 1 "HOLE" H 6527 6800 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6450 6850 50  0001 C CNN
F 3 "" H 6450 6850 50  0001 C CNN
	1    6450 6850
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5F004708
P 6450 7050
AR Path="/5F004708" Ref="J?"  Part="1" 
AR Path="/60D4580B/5F004708" Ref="J5"  Part="1" 
F 0 "J5" H 6527 7091 50  0000 L CNN
F 1 "HOLE" H 6527 7000 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6450 7050 50  0001 C CNN
F 3 "" H 6450 7050 50  0001 C CNN
	1    6450 7050
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5F00470E
P 6450 7250
AR Path="/5F00470E" Ref="J?"  Part="1" 
AR Path="/60D4580B/5F00470E" Ref="J6"  Part="1" 
F 0 "J6" H 6527 7291 50  0000 L CNN
F 1 "HOLE" H 6527 7200 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6450 7250 50  0001 C CNN
F 3 "" H 6450 7250 50  0001 C CNN
	1    6450 7250
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5F004714
P 6450 7450
AR Path="/5F004714" Ref="J?"  Part="1" 
AR Path="/60D4580B/5F004714" Ref="J7"  Part="1" 
F 0 "J7" H 6527 7491 50  0000 L CNN
F 1 "HOLE" H 6527 7400 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6450 7450 50  0001 C CNN
F 3 "" H 6450 7450 50  0001 C CNN
	1    6450 7450
	1    0    0    -1  
$EndComp
NoConn ~ 1250 3900
NoConn ~ 1250 5400
Wire Wire Line
	9050 1200 9050 1350
Connection ~ 9050 1200
Wire Wire Line
	9050 1550 9050 1650
Wire Wire Line
	9050 1650 9500 1650
Wire Wire Line
	9800 1200 10300 1200
$Comp
L myAmp:R_POT RV?
U 1 1 615269C0
P 6300 1850
AR Path="/615269C0" Ref="RV?"  Part="1" 
AR Path="/60D4580B/615269C0" Ref="RV1"  Part="1" 
F 0 "RV1" H 6250 1800 50  0000 R CNN
F 1 "A100K" H 6250 1900 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 6300 1850 50  0001 C CNN
F 3 "treble" H 6300 1850 50  0001 C CNN
	1    6300 1850
	1    0    0    1   
$EndComp
$EndSCHEMATC
