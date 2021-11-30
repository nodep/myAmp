EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L myAmp:NE5532 U1
U 1 1 61A4B4B3
P 3750 1550
F 0 "U1" H 3750 1183 50  0000 C CNN
F 1 "NE5532" H 3750 1274 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 3750 1550 50  0001 C CNN
F 3 "" H 3750 1550 50  0001 C CNN
	1    3750 1550
	1    0    0    1   
$EndComp
$Comp
L myAmp:NE5532 U1
U 3 1 61A4C02E
P 3600 7000
F 0 "U1" H 3558 7046 50  0000 L CNN
F 1 "NE5532" H 3558 6955 50  0000 L CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 3600 7000 50  0001 C CNN
F 3 "" H 3600 7000 50  0001 C CNN
	3    3600 7000
	1    0    0    -1  
$EndComp
$Comp
L myAmp:R R5
U 1 1 61A4DB9C
P 3150 1450
F 0 "R5" V 2943 1450 50  0000 C CNN
F 1 "100k" V 3034 1450 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 3080 1450 50  0001 C CNN
F 3 "" H 3150 1450 50  0001 C CNN
	1    3150 1450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61A4E112
P 2250 7450
F 0 "#PWR0101" H 2250 7200 50  0001 C CNN
F 1 "GND" H 2255 7277 50  0000 C CNN
F 2 "" H 2250 7450 50  0001 C CNN
F 3 "" H 2250 7450 50  0001 C CNN
	1    2250 7450
	1    0    0    -1  
$EndComp
$Comp
L myAmp:C C1
U 1 1 61A4E52F
P 2800 1450
F 0 "C1" V 2568 1450 50  0000 C CNN
F 1 "1μF" V 2659 1450 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 2838 1300 50  0001 C CNN
F 3 "" H 2800 1450 50  0001 C CNN
	1    2800 1450
	0    1    1    0   
$EndComp
$Comp
L myAmp:TLE2426 U5
U 1 1 61A4FAD8
P 2250 7000
F 0 "U5" H 2225 7365 50  0000 C CNN
F 1 "TLE2426" H 2225 7274 50  0000 C CNN
F 2 "myAmp:TO-92_Inline_Wide" H 1650 6800 50  0001 C CNN
F 3 "" H 1650 6800 50  0001 C CNN
	1    2250 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0102
U 1 1 61A509A9
P 1650 6800
F 0 "#PWR0102" H 1650 6650 50  0001 C CNN
F 1 "+BATT" H 1665 6973 50  0000 C CNN
F 2 "" H 1650 6800 50  0001 C CNN
F 3 "" H 1650 6800 50  0001 C CNN
	1    1650 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6800 1650 7000
Wire Wire Line
	1650 7000 1800 7000
Text GLabel 2700 7000 2    50   Input ~ 0
VGND
Wire Wire Line
	2700 7000 2550 7000
Wire Wire Line
	2250 7350 2250 7450
$Comp
L myAmp:C C20
U 1 1 61A5277B
P 1800 7200
F 0 "C20" H 1706 7154 50  0000 R CNN
F 1 "100nF" H 1706 7245 50  0000 R CNN
F 2 "myAmp:C_1206" H 1838 7050 50  0001 C CNN
F 3 "" H 1800 7200 50  0001 C CNN
	1    1800 7200
	1    0    0    1   
$EndComp
Wire Wire Line
	1800 7000 1800 7100
Connection ~ 1800 7000
Wire Wire Line
	1800 7000 1900 7000
$Comp
L power:GND #PWR0103
U 1 1 61A530D8
P 1800 7450
F 0 "#PWR0103" H 1800 7200 50  0001 C CNN
F 1 "GND" H 1805 7277 50  0000 C CNN
F 2 "" H 1800 7450 50  0001 C CNN
F 3 "" H 1800 7450 50  0001 C CNN
	1    1800 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 7300 1800 7450
Wire Wire Line
	3300 1450 3400 1450
Wire Wire Line
	2900 1450 3000 1450
$Comp
L myAmp:C C16
U 1 1 61A56342
P 3150 7000
F 0 "C16" H 3055 6954 50  0000 R CNN
F 1 "100nF" H 3055 7045 50  0000 R CNN
F 2 "myAmp:C_1206" H 3188 6850 50  0001 C CNN
F 3 "" H 3150 7000 50  0001 C CNN
	1    3150 7000
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0104
U 1 1 61A56A82
P 3350 6600
F 0 "#PWR0104" H 3350 6450 50  0001 C CNN
F 1 "+BATT" H 3365 6773 50  0000 C CNN
F 2 "" H 3350 6600 50  0001 C CNN
F 3 "" H 3350 6600 50  0001 C CNN
	1    3350 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 6700 3500 6650
Wire Wire Line
	3150 6650 3150 6900
Wire Wire Line
	3150 7100 3150 7350
Wire Wire Line
	3500 7350 3500 7300
Wire Wire Line
	3350 6600 3350 6650
Wire Wire Line
	3500 6650 3350 6650
Connection ~ 3350 6650
Wire Wire Line
	3350 6650 3150 6650
Wire Wire Line
	3150 7350 3350 7350
$Comp
L power:GND #PWR0105
U 1 1 61A58F34
P 3350 7450
F 0 "#PWR0105" H 3350 7200 50  0001 C CNN
F 1 "GND" H 3355 7277 50  0000 C CNN
F 2 "" H 3350 7450 50  0001 C CNN
F 3 "" H 3350 7450 50  0001 C CNN
	1    3350 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 7350 3350 7450
Connection ~ 3350 7350
Wire Wire Line
	3350 7350 3500 7350
Text GLabel 3300 1650 0    50   Input ~ 0
VGND
Wire Wire Line
	3450 1650 3300 1650
Wire Wire Line
	4050 1550 4100 1550
$Comp
L myAmp:R R1
U 1 1 61A5B081
P 3750 950
F 0 "R1" V 3543 950 50  0000 C CNN
F 1 "100k" V 3634 950 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 3680 950 50  0001 C CNN
F 3 "" H 3750 950 50  0001 C CNN
	1    3750 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 950  3400 950 
Wire Wire Line
	3400 950  3400 1450
Connection ~ 3400 1450
Wire Wire Line
	3400 1450 3450 1450
Wire Wire Line
	3900 950  4100 950 
Wire Wire Line
	4100 950  4100 1550
Connection ~ 4100 1550
Wire Wire Line
	4100 1550 4150 1550
$Comp
L myAmp:R R6
U 1 1 61A5A774
P 4300 1550
F 0 "R6" V 4093 1550 50  0000 C CNN
F 1 "3k3" V 4184 1550 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 4230 1550 50  0001 C CNN
F 3 "" H 4300 1550 50  0001 C CNN
	1    4300 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 1550 4550 1550
$Comp
L myAmp:R R2
U 1 1 61A5FBF8
P 5050 950
F 0 "R2" V 4843 950 50  0000 C CNN
F 1 "3k3" V 4934 950 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 4980 950 50  0001 C CNN
F 3 "" H 5050 950 50  0001 C CNN
	1    5050 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 950  4550 950 
Wire Wire Line
	4550 950  4550 1350
Wire Wire Line
	4550 1350 4650 1350
Wire Wire Line
	5200 950  5300 950 
Wire Wire Line
	5300 950  5300 1450
Wire Wire Line
	5300 1450 5250 1450
$Comp
L myAmp:C C2
U 1 1 61A60E27
P 5450 1450
F 0 "C2" V 5218 1450 50  0000 C CNN
F 1 "1μF" V 5309 1450 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 5488 1300 50  0001 C CNN
F 3 "" H 5450 1450 50  0001 C CNN
	1    5450 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 1450 5300 1450
Connection ~ 5300 1450
Text GLabel 5500 1850 0    50   Input ~ 0
VGND
$Comp
L myAmp:R R7
U 1 1 61A62DEA
P 5650 1650
F 0 "R7" H 5580 1604 50  0000 R CNN
F 1 "100k" H 5580 1695 50  0000 R CNN
F 2 "myAmp:R_10MM_TT" V 5580 1650 50  0001 C CNN
F 3 "" H 5650 1650 50  0001 C CNN
	1    5650 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 1450 5650 1450
Wire Wire Line
	5650 1450 5650 1500
Wire Wire Line
	5500 1850 5650 1850
Wire Wire Line
	5650 1850 5650 1800
Connection ~ 5650 1450
Text GLabel 4600 650  2    50   Input ~ 0
BOOST
Wire Wire Line
	4600 650  4550 650 
Wire Wire Line
	4550 650  4550 950 
Connection ~ 4550 950 
Wire Wire Line
	4550 1550 4550 1850
Connection ~ 4550 1550
Wire Wire Line
	4550 1550 4450 1550
Text GLabel 4700 1850 2    50   Input ~ 0
CUT
Wire Wire Line
	4550 1850 4700 1850
$Comp
L myAmp:R_POT RV1
U 1 1 61A68DD2
P 2700 3750
F 0 "RV1" H 2630 3704 50  0000 R CNN
F 1 "10k" H 2630 3795 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 2700 3750 50  0001 C CNN
F 3 "" H 2550 3600 50  0001 C CNN
	1    2700 3750
	1    0    0    1   
$EndComp
$Comp
L myAmp:C C4
U 1 1 61A698B7
P 3100 3750
F 0 "C4" V 2868 3750 50  0000 C CNN
F 1 "820nF" V 2959 3750 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 3138 3600 50  0001 C CNN
F 3 "" H 3100 3750 50  0001 C CNN
	1    3100 3750
	0    1    1    0   
$EndComp
$Comp
L myAmp:C C5
U 1 1 61A6A91E
P 3500 3750
F 0 "C5" V 3268 3750 50  0000 C CNN
F 1 "22nF" V 3359 3750 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 3538 3600 50  0001 C CNN
F 3 "" H 3500 3750 50  0001 C CNN
	1    3500 3750
	0    1    1    0   
$EndComp
$Comp
L myAmp:R R11
U 1 1 61A6ACBE
P 3300 3050
F 0 "R11" H 3230 3004 50  0000 R CNN
F 1 "470" H 3230 3095 50  0000 R CNN
F 2 "myAmp:R_10MM_TT" V 3230 3050 50  0001 C CNN
F 3 "" H 3300 3050 50  0001 C CNN
	1    3300 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 3200 3300 3350
Wire Wire Line
	3300 3750 3400 3750
Wire Wire Line
	3200 3750 3300 3750
Connection ~ 3300 3750
Wire Wire Line
	2850 3750 2950 3750
Wire Wire Line
	3300 2900 3300 2850
Wire Wire Line
	3300 2850 3750 2850
Wire Wire Line
	4500 2850 4500 3350
Wire Wire Line
	4500 3350 4400 3350
Wire Wire Line
	3800 3250 3750 3250
Wire Wire Line
	3750 3250 3750 2850
Connection ~ 3750 2850
Wire Wire Line
	3750 2850 4500 2850
Wire Wire Line
	3800 3450 3750 3450
Wire Wire Line
	3750 3450 3750 3750
Wire Wire Line
	3750 3750 3600 3750
$Comp
L myAmp:R R14
U 1 1 61A733F4
P 4150 3750
F 0 "R14" V 3943 3750 50  0000 C CNN
F 1 "100k" V 4034 3750 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 4080 3750 50  0001 C CNN
F 3 "" H 4150 3750 50  0001 C CNN
	1    4150 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 3750 4000 3750
Connection ~ 3750 3750
Text GLabel 4450 3750 2    50   Input ~ 0
VGND
Wire Wire Line
	4450 3750 4300 3750
Text GLabel 2800 4050 2    50   Input ~ 0
CUT
Wire Wire Line
	2700 3900 2700 4050
Wire Wire Line
	2700 4050 2800 4050
Text Notes 3400 4100 0    150  ~ 0
125Hz
$Comp
L myAmp:NE5532 U2
U 3 1 61A7DA84
P 4600 7000
F 0 "U2" H 4558 7046 50  0000 L CNN
F 1 "NE5532" H 4558 6955 50  0000 L CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 4600 7000 50  0001 C CNN
F 3 "" H 4600 7000 50  0001 C CNN
	3    4600 7000
	1    0    0    -1  
$EndComp
$Comp
L myAmp:C C17
U 1 1 61A7DA8A
P 4150 7000
F 0 "C17" H 4055 6954 50  0000 R CNN
F 1 "100nF" H 4055 7045 50  0000 R CNN
F 2 "myAmp:C_1206" H 4188 6850 50  0001 C CNN
F 3 "" H 4150 7000 50  0001 C CNN
	1    4150 7000
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0106
U 1 1 61A7DA90
P 4350 6600
F 0 "#PWR0106" H 4350 6450 50  0001 C CNN
F 1 "+BATT" H 4365 6773 50  0000 C CNN
F 2 "" H 4350 6600 50  0001 C CNN
F 3 "" H 4350 6600 50  0001 C CNN
	1    4350 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 6700 4500 6650
Wire Wire Line
	4150 6650 4150 6900
Wire Wire Line
	4150 7100 4150 7350
Wire Wire Line
	4500 7350 4500 7300
Wire Wire Line
	4350 6600 4350 6650
Wire Wire Line
	4500 6650 4350 6650
Connection ~ 4350 6650
Wire Wire Line
	4350 6650 4150 6650
Wire Wire Line
	4150 7350 4350 7350
$Comp
L power:GND #PWR0107
U 1 1 61A7DA9F
P 4350 7450
F 0 "#PWR0107" H 4350 7200 50  0001 C CNN
F 1 "GND" H 4355 7277 50  0000 C CNN
F 2 "" H 4350 7450 50  0001 C CNN
F 3 "" H 4350 7450 50  0001 C CNN
	1    4350 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 7350 4350 7450
Connection ~ 4350 7350
Wire Wire Line
	4350 7350 4500 7350
$Comp
L myAmp:NE5532 U3
U 3 1 61A7F709
P 5650 7000
F 0 "U3" H 5608 7046 50  0000 L CNN
F 1 "NE5532" H 5608 6955 50  0000 L CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 5650 7000 50  0001 C CNN
F 3 "" H 5650 7000 50  0001 C CNN
	3    5650 7000
	1    0    0    -1  
$EndComp
$Comp
L myAmp:C C18
U 1 1 61A7F70F
P 5200 7000
F 0 "C18" H 5105 6954 50  0000 R CNN
F 1 "100nF" H 5105 7045 50  0000 R CNN
F 2 "myAmp:C_1206" H 5238 6850 50  0001 C CNN
F 3 "" H 5200 7000 50  0001 C CNN
	1    5200 7000
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0108
U 1 1 61A7F715
P 5400 6600
F 0 "#PWR0108" H 5400 6450 50  0001 C CNN
F 1 "+BATT" H 5415 6773 50  0000 C CNN
F 2 "" H 5400 6600 50  0001 C CNN
F 3 "" H 5400 6600 50  0001 C CNN
	1    5400 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 6700 5550 6650
Wire Wire Line
	5200 6650 5200 6900
Wire Wire Line
	5200 7100 5200 7350
Wire Wire Line
	5550 7350 5550 7300
Wire Wire Line
	5400 6600 5400 6650
Wire Wire Line
	5550 6650 5400 6650
Connection ~ 5400 6650
Wire Wire Line
	5400 6650 5200 6650
Wire Wire Line
	5200 7350 5400 7350
$Comp
L power:GND #PWR0109
U 1 1 61A7F724
P 5400 7450
F 0 "#PWR0109" H 5400 7200 50  0001 C CNN
F 1 "GND" H 5405 7277 50  0000 C CNN
F 2 "" H 5400 7450 50  0001 C CNN
F 3 "" H 5400 7450 50  0001 C CNN
	1    5400 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7350 5400 7450
Connection ~ 5400 7350
Wire Wire Line
	5400 7350 5550 7350
$Comp
L myAmp:NE5532 U4
U 3 1 61A821EC
P 6650 7000
F 0 "U4" H 6608 7046 50  0000 L CNN
F 1 "NE5532" H 6608 6955 50  0000 L CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 6650 7000 50  0001 C CNN
F 3 "" H 6650 7000 50  0001 C CNN
	3    6650 7000
	1    0    0    -1  
$EndComp
$Comp
L myAmp:C C19
U 1 1 61A821F2
P 6200 7000
F 0 "C19" H 6105 6954 50  0000 R CNN
F 1 "100nF" H 6105 7045 50  0000 R CNN
F 2 "myAmp:C_1206" H 6238 6850 50  0001 C CNN
F 3 "" H 6200 7000 50  0001 C CNN
	1    6200 7000
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0110
U 1 1 61A821F8
P 6400 6600
F 0 "#PWR0110" H 6400 6450 50  0001 C CNN
F 1 "+BATT" H 6415 6773 50  0000 C CNN
F 2 "" H 6400 6600 50  0001 C CNN
F 3 "" H 6400 6600 50  0001 C CNN
	1    6400 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 6700 6550 6650
Wire Wire Line
	6200 6650 6200 6900
Wire Wire Line
	6200 7100 6200 7350
Wire Wire Line
	6550 7350 6550 7300
Wire Wire Line
	6400 6600 6400 6650
Wire Wire Line
	6550 6650 6400 6650
Connection ~ 6400 6650
Wire Wire Line
	6400 6650 6200 6650
Wire Wire Line
	6200 7350 6400 7350
$Comp
L power:GND #PWR0111
U 1 1 61A82207
P 6400 7450
F 0 "#PWR0111" H 6400 7200 50  0001 C CNN
F 1 "GND" H 6405 7277 50  0000 C CNN
F 2 "" H 6400 7450 50  0001 C CNN
F 3 "" H 6400 7450 50  0001 C CNN
	1    6400 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 7350 6400 7450
Connection ~ 6400 7350
Wire Wire Line
	6400 7350 6550 7350
$Comp
L myAmp:R_POT RV2
U 1 1 61A96F2F
P 5200 3750
F 0 "RV2" H 5130 3704 50  0000 R CNN
F 1 "10k" H 5130 3795 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 5200 3750 50  0001 C CNN
F 3 "" H 5050 3600 50  0001 C CNN
	1    5200 3750
	1    0    0    1   
$EndComp
$Comp
L myAmp:C C6
U 1 1 61A96F35
P 5600 3750
F 0 "C6" V 5368 3750 50  0000 C CNN
F 1 "820nF" V 5459 3750 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 5638 3600 50  0001 C CNN
F 3 "" H 5600 3750 50  0001 C CNN
	1    5600 3750
	0    1    1    0   
$EndComp
$Comp
L myAmp:C C7
U 1 1 61A96F3B
P 6000 3750
F 0 "C7" V 5768 3750 50  0000 C CNN
F 1 "10nF" V 5859 3750 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 6038 3600 50  0001 C CNN
F 3 "" H 6000 3750 50  0001 C CNN
	1    6000 3750
	0    1    1    0   
$EndComp
$Comp
L myAmp:R R12
U 1 1 61A96F41
P 5800 3350
F 0 "R12" H 5730 3304 50  0000 R CNN
F 1 "470" H 5730 3395 50  0000 R CNN
F 2 "myAmp:R_10MM_TT" V 5730 3350 50  0001 C CNN
F 3 "" H 5800 3350 50  0001 C CNN
	1    5800 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5800 3500 5800 3750
Wire Wire Line
	5800 3750 5900 3750
Wire Wire Line
	5700 3750 5800 3750
Connection ~ 5800 3750
Wire Wire Line
	5350 3750 5500 3750
Wire Wire Line
	5800 3200 5800 2850
Wire Wire Line
	5800 2850 6250 2850
Wire Wire Line
	7000 2850 7000 3350
Wire Wire Line
	7000 3350 6900 3350
Wire Wire Line
	6300 3250 6250 3250
Wire Wire Line
	6250 3250 6250 2850
Connection ~ 6250 2850
Wire Wire Line
	6250 2850 7000 2850
Wire Wire Line
	6300 3450 6250 3450
Wire Wire Line
	6250 3450 6250 3750
Wire Wire Line
	6250 3750 6100 3750
$Comp
L myAmp:R R15
U 1 1 61A96F5D
P 6650 3750
F 0 "R15" V 6443 3750 50  0000 C CNN
F 1 "100k" V 6534 3750 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 6580 3750 50  0001 C CNN
F 3 "" H 6650 3750 50  0001 C CNN
	1    6650 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 3750 6500 3750
Connection ~ 6250 3750
Text GLabel 6950 3750 2    50   Input ~ 0
VGND
Wire Wire Line
	6950 3750 6800 3750
Wire Wire Line
	5200 3600 5200 3400
Wire Wire Line
	5200 3400 5250 3400
Text GLabel 5250 3400 2    50   Input ~ 0
BOOST
Text GLabel 5300 4050 2    50   Input ~ 0
CUT
Wire Wire Line
	5200 3900 5200 4050
Wire Wire Line
	5200 4050 5300 4050
Text Notes 5900 4100 0    150  ~ 0
250Hz
$Comp
L myAmp:R_POT RV3
U 1 1 61AAD8C2
P 7700 3750
F 0 "RV3" H 7630 3704 50  0000 R CNN
F 1 "10k" H 7630 3795 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 7700 3750 50  0001 C CNN
F 3 "" H 7550 3600 50  0001 C CNN
	1    7700 3750
	1    0    0    1   
$EndComp
$Comp
L myAmp:C C8
U 1 1 61AAD8C8
P 8100 3750
F 0 "C8" V 7868 3750 50  0000 C CNN
F 1 "390nF" V 7959 3750 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 8138 3600 50  0001 C CNN
F 3 "" H 8100 3750 50  0001 C CNN
	1    8100 3750
	0    1    1    0   
$EndComp
$Comp
L myAmp:C C9
U 1 1 61AAD8CE
P 8500 3750
F 0 "C9" V 8268 3750 50  0000 C CNN
F 1 "5.6nF" V 8359 3750 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 8538 3600 50  0001 C CNN
F 3 "" H 8500 3750 50  0001 C CNN
	1    8500 3750
	0    1    1    0   
$EndComp
$Comp
L myAmp:R R13
U 1 1 61AAD8D4
P 8300 3350
F 0 "R13" H 8230 3304 50  0000 R CNN
F 1 "470" H 8230 3395 50  0000 R CNN
F 2 "myAmp:R_10MM_TT" V 8230 3350 50  0001 C CNN
F 3 "" H 8300 3350 50  0001 C CNN
	1    8300 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	8300 3500 8300 3750
Wire Wire Line
	8300 3750 8400 3750
Wire Wire Line
	8200 3750 8300 3750
Connection ~ 8300 3750
Wire Wire Line
	7850 3750 8000 3750
Wire Wire Line
	8300 3200 8300 2850
Wire Wire Line
	8300 2850 8750 2850
Wire Wire Line
	9500 2850 9500 3350
Wire Wire Line
	9500 3350 9400 3350
Wire Wire Line
	8800 3250 8750 3250
Wire Wire Line
	8750 3250 8750 2850
Connection ~ 8750 2850
Wire Wire Line
	8750 2850 9500 2850
Wire Wire Line
	8800 3450 8750 3450
Wire Wire Line
	8750 3450 8750 3750
Wire Wire Line
	8750 3750 8600 3750
$Comp
L myAmp:R R16
U 1 1 61AAD8F0
P 9150 3750
F 0 "R16" V 8943 3750 50  0000 C CNN
F 1 "100k" V 9034 3750 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 9080 3750 50  0001 C CNN
F 3 "" H 9150 3750 50  0001 C CNN
	1    9150 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 3750 9000 3750
Connection ~ 8750 3750
Text GLabel 9450 3750 2    50   Input ~ 0
VGND
Wire Wire Line
	9450 3750 9300 3750
Wire Wire Line
	7700 3600 7700 3400
Wire Wire Line
	7700 3400 7750 3400
Text GLabel 7750 3400 2    50   Input ~ 0
BOOST
Text GLabel 7800 4050 2    50   Input ~ 0
CUT
Wire Wire Line
	7700 3900 7700 4050
Wire Wire Line
	7700 4050 7800 4050
Text Notes 8400 4100 0    150  ~ 0
500Hz
$Comp
L myAmp:R_POT RV4
U 1 1 61AAD901
P 2700 5200
F 0 "RV4" H 2630 5154 50  0000 R CNN
F 1 "10k" H 2630 5245 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 2700 5200 50  0001 C CNN
F 3 "" H 2550 5050 50  0001 C CNN
	1    2700 5200
	1    0    0    1   
$EndComp
$Comp
L myAmp:C C10
U 1 1 61AAD907
P 3100 5200
F 0 "C10" V 2868 5200 50  0000 C CNN
F 1 "200nF" V 2959 5200 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 3138 5050 50  0001 C CNN
F 3 "" H 3100 5200 50  0001 C CNN
	1    3100 5200
	0    1    1    0   
$EndComp
$Comp
L myAmp:C C11
U 1 1 61AAD90D
P 3500 5200
F 0 "C11" V 3268 5200 50  0000 C CNN
F 1 "2.7nF" V 3359 5200 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 3538 5050 50  0001 C CNN
F 3 "" H 3500 5200 50  0001 C CNN
	1    3500 5200
	0    1    1    0   
$EndComp
$Comp
L myAmp:R R17
U 1 1 61AAD913
P 3300 4800
F 0 "R17" H 3230 4754 50  0000 R CNN
F 1 "470" H 3230 4845 50  0000 R CNN
F 2 "myAmp:R_10MM_TT" V 3230 4800 50  0001 C CNN
F 3 "" H 3300 4800 50  0001 C CNN
	1    3300 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 4950 3300 5200
Wire Wire Line
	3300 5200 3400 5200
Wire Wire Line
	3200 5200 3300 5200
Connection ~ 3300 5200
Wire Wire Line
	2850 5200 3000 5200
Wire Wire Line
	3300 4650 3300 4300
Wire Wire Line
	3300 4300 3750 4300
Wire Wire Line
	4500 4300 4500 4800
Wire Wire Line
	4500 4800 4400 4800
Wire Wire Line
	3800 4700 3750 4700
Wire Wire Line
	3750 4700 3750 4300
Connection ~ 3750 4300
Wire Wire Line
	3750 4300 4500 4300
Wire Wire Line
	3800 4900 3750 4900
Wire Wire Line
	3750 4900 3750 5200
Wire Wire Line
	3750 5200 3600 5200
$Comp
L myAmp:R R20
U 1 1 61AAD92F
P 4150 5200
F 0 "R20" V 3943 5200 50  0000 C CNN
F 1 "100k" V 4034 5200 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 4080 5200 50  0001 C CNN
F 3 "" H 4150 5200 50  0001 C CNN
	1    4150 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 5200 4000 5200
Connection ~ 3750 5200
Text GLabel 4450 5200 2    50   Input ~ 0
VGND
Wire Wire Line
	4450 5200 4300 5200
Wire Wire Line
	2700 5050 2700 4850
Wire Wire Line
	2700 4850 2750 4850
Text GLabel 2750 4850 2    50   Input ~ 0
BOOST
Text GLabel 2800 5500 2    50   Input ~ 0
CUT
Wire Wire Line
	2700 5350 2700 5500
Wire Wire Line
	2700 5500 2800 5500
Text Notes 3400 5550 0    150  ~ 0
1KHz
$Comp
L myAmp:R_POT RV5
U 1 1 61AB9F9A
P 5200 5200
F 0 "RV5" H 5130 5154 50  0000 R CNN
F 1 "10k" H 5130 5245 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 5200 5200 50  0001 C CNN
F 3 "" H 5050 5050 50  0001 C CNN
	1    5200 5200
	1    0    0    1   
$EndComp
$Comp
L myAmp:C C12
U 1 1 61AB9FA0
P 5600 5200
F 0 "C12" V 5368 5200 50  0000 C CNN
F 1 "100nF" V 5459 5200 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 5638 5050 50  0001 C CNN
F 3 "" H 5600 5200 50  0001 C CNN
	1    5600 5200
	0    1    1    0   
$EndComp
$Comp
L myAmp:C C13
U 1 1 61AB9FA6
P 6000 5200
F 0 "C13" V 5768 5200 50  0000 C CNN
F 1 "1.5nF" V 5859 5200 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 6038 5050 50  0001 C CNN
F 3 "" H 6000 5200 50  0001 C CNN
	1    6000 5200
	0    1    1    0   
$EndComp
$Comp
L myAmp:R R18
U 1 1 61AB9FAC
P 5800 4800
F 0 "R18" H 5730 4754 50  0000 R CNN
F 1 "470" H 5730 4845 50  0000 R CNN
F 2 "myAmp:R_10MM_TT" V 5730 4800 50  0001 C CNN
F 3 "" H 5800 4800 50  0001 C CNN
	1    5800 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	5800 4950 5800 5200
Wire Wire Line
	5800 5200 5900 5200
Wire Wire Line
	5700 5200 5800 5200
Connection ~ 5800 5200
Wire Wire Line
	5350 5200 5500 5200
Wire Wire Line
	5800 4650 5800 4300
Wire Wire Line
	5800 4300 6250 4300
Wire Wire Line
	7000 4300 7000 4800
Wire Wire Line
	7000 4800 6900 4800
Wire Wire Line
	6300 4700 6250 4700
Wire Wire Line
	6250 4700 6250 4300
Connection ~ 6250 4300
Wire Wire Line
	6250 4300 7000 4300
Wire Wire Line
	6300 4900 6250 4900
Wire Wire Line
	6250 4900 6250 5200
Wire Wire Line
	6250 5200 6100 5200
$Comp
L myAmp:R R21
U 1 1 61AB9FC8
P 6650 5200
F 0 "R21" V 6443 5200 50  0000 C CNN
F 1 "100k" V 6534 5200 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 6580 5200 50  0001 C CNN
F 3 "" H 6650 5200 50  0001 C CNN
	1    6650 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 5200 6500 5200
Connection ~ 6250 5200
Text GLabel 6950 5200 2    50   Input ~ 0
VGND
Wire Wire Line
	6950 5200 6800 5200
Wire Wire Line
	5200 5050 5200 4850
Wire Wire Line
	5200 4850 5250 4850
Text GLabel 5250 4850 2    50   Input ~ 0
BOOST
Text GLabel 5300 5500 2    50   Input ~ 0
CUT
Wire Wire Line
	5200 5350 5200 5500
Wire Wire Line
	5200 5500 5300 5500
Text Notes 5900 5550 0    150  ~ 0
2KHz
$Comp
L myAmp:R_POT RV6
U 1 1 61AB9FD9
P 7700 5200
F 0 "RV6" H 7630 5154 50  0000 R CNN
F 1 "10k" H 7630 5245 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 7700 5200 50  0001 C CNN
F 3 "" H 7550 5050 50  0001 C CNN
	1    7700 5200
	1    0    0    1   
$EndComp
$Comp
L myAmp:C C14
U 1 1 61AB9FDF
P 8100 5200
F 0 "C14" V 7868 5200 50  0000 C CNN
F 1 "47nF" V 7959 5200 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 8138 5050 50  0001 C CNN
F 3 "" H 8100 5200 50  0001 C CNN
	1    8100 5200
	0    1    1    0   
$EndComp
$Comp
L myAmp:C C15
U 1 1 61AB9FE5
P 8500 5200
F 0 "C15" V 8268 5200 50  0000 C CNN
F 1 "680pF" V 8359 5200 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 8538 5050 50  0001 C CNN
F 3 "" H 8500 5200 50  0001 C CNN
	1    8500 5200
	0    1    1    0   
$EndComp
$Comp
L myAmp:R R19
U 1 1 61AB9FEB
P 8300 4800
F 0 "R19" H 8230 4754 50  0000 R CNN
F 1 "470" H 8230 4845 50  0000 R CNN
F 2 "myAmp:R_10MM_TT" V 8230 4800 50  0001 C CNN
F 3 "" H 8300 4800 50  0001 C CNN
	1    8300 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	8300 4950 8300 5200
Wire Wire Line
	8300 5200 8400 5200
Wire Wire Line
	8200 5200 8300 5200
Connection ~ 8300 5200
Wire Wire Line
	7850 5200 8000 5200
Wire Wire Line
	8300 4650 8300 4300
Wire Wire Line
	8300 4300 8750 4300
Wire Wire Line
	9500 4300 9500 4800
Wire Wire Line
	9500 4800 9400 4800
Wire Wire Line
	8800 4700 8750 4700
Wire Wire Line
	8750 4700 8750 4300
Connection ~ 8750 4300
Wire Wire Line
	8750 4300 9500 4300
Wire Wire Line
	8800 4900 8750 4900
Wire Wire Line
	8750 4900 8750 5200
Wire Wire Line
	8750 5200 8600 5200
$Comp
L myAmp:R R22
U 1 1 61ABA007
P 9150 5200
F 0 "R22" V 8943 5200 50  0000 C CNN
F 1 "100k" V 9034 5200 50  0000 C CNN
F 2 "myAmp:R_10MM_TT" V 9080 5200 50  0001 C CNN
F 3 "" H 9150 5200 50  0001 C CNN
	1    9150 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 5200 9000 5200
Connection ~ 8750 5200
Text GLabel 9450 5200 2    50   Input ~ 0
VGND
Wire Wire Line
	9450 5200 9300 5200
Wire Wire Line
	7700 5050 7700 4850
Wire Wire Line
	7700 4850 7750 4850
Text GLabel 7750 4850 2    50   Input ~ 0
BOOST
Text GLabel 7800 5500 2    50   Input ~ 0
CUT
Wire Wire Line
	7700 5350 7700 5500
Wire Wire Line
	7700 5500 7800 5500
Text Notes 8400 5550 0    150  ~ 0
4KHz
Text GLabel 2750 3000 2    50   Input ~ 0
BOOST
Wire Wire Line
	2700 3000 2750 3000
Wire Wire Line
	2700 3600 2700 3000
$Comp
L myAmp:C C3
U 1 1 61AEDBDF
P 3100 3350
F 0 "C3" V 2868 3350 50  0000 C CNN
F 1 "820nF" V 2959 3350 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 3138 3200 50  0001 C CNN
F 3 "" H 3100 3350 50  0001 C CNN
	1    3100 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 3350 2950 3350
Wire Wire Line
	2950 3350 2950 3750
Connection ~ 2950 3750
Wire Wire Line
	2950 3750 3000 3750
Wire Wire Line
	3200 3350 3300 3350
Connection ~ 3300 3350
Wire Wire Line
	3300 3350 3300 3750
$Comp
L myAmp:NE5532 U1
U 2 1 61B963FD
P 4950 1450
F 0 "U1" H 4950 1083 50  0000 C CNN
F 1 "NE5532" H 4950 1174 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 4950 1450 50  0001 C CNN
F 3 "" H 4950 1450 50  0001 C CNN
	2    4950 1450
	1    0    0    1   
$EndComp
$Comp
L myAmp:NE5532 U2
U 1 1 61B98AD5
P 6600 3350
F 0 "U2" H 6600 2983 50  0000 C CNN
F 1 "NE5532" H 6600 3074 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 6600 3350 50  0001 C CNN
F 3 "" H 6600 3350 50  0001 C CNN
	1    6600 3350
	1    0    0    1   
$EndComp
$Comp
L myAmp:NE5532 U2
U 2 1 61B9A9D0
P 4100 3350
F 0 "U2" H 4100 2983 50  0000 C CNN
F 1 "NE5532" H 4100 3074 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 4100 3350 50  0001 C CNN
F 3 "" H 4100 3350 50  0001 C CNN
	2    4100 3350
	1    0    0    1   
$EndComp
$Comp
L myAmp:NE5532 U3
U 1 1 61B9B51D
P 4100 4800
F 0 "U3" H 4100 4433 50  0000 C CNN
F 1 "NE5532" H 4100 4524 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 4100 4800 50  0001 C CNN
F 3 "" H 4100 4800 50  0001 C CNN
	1    4100 4800
	1    0    0    1   
$EndComp
$Comp
L myAmp:NE5532 U3
U 2 1 61B9C077
P 9100 3350
F 0 "U3" H 9100 2983 50  0000 C CNN
F 1 "NE5532" H 9100 3074 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 9100 3350 50  0001 C CNN
F 3 "" H 9100 3350 50  0001 C CNN
	2    9100 3350
	1    0    0    1   
$EndComp
$Comp
L myAmp:NE5532 U4
U 1 1 61B9C921
P 9100 4800
F 0 "U4" H 9100 4433 50  0000 C CNN
F 1 "NE5532" H 9100 4524 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 9100 4800 50  0001 C CNN
F 3 "" H 9100 4800 50  0001 C CNN
	1    9100 4800
	1    0    0    1   
$EndComp
$Comp
L myAmp:NE5532 U4
U 2 1 61B9D658
P 6600 4800
F 0 "U4" H 6600 4433 50  0000 C CNN
F 1 "NE5532" H 6600 4524 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 6600 4800 50  0001 C CNN
F 3 "" H 6600 4800 50  0001 C CNN
	2    6600 4800
	1    0    0    1   
$EndComp
$Comp
L myAmp:CONN_01X04 J?
U 1 1 61A6BC03
P 750 7100
AR Path="/6173FC4B/61A6BC03" Ref="J?"  Part="1" 
AR Path="/61A4AF27/61A6BC03" Ref="J?"  Part="1" 
AR Path="/61A6BC03" Ref="J4"  Part="1" 
F 0 "J4" H 667 6817 50  0000 C CNN
F 1 "CONN_01X04" V 850 7100 50  0001 C CNN
F 2 "myAmp:PIN_1x04" H 750 7100 50  0001 C CNN
F 3 "" H 750 7100 50  0001 C CNN
	1    750  7100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A6BC09
P 1150 7300
AR Path="/6173FC4B/61A6BC09" Ref="#PWR?"  Part="1" 
AR Path="/61A4AF27/61A6BC09" Ref="#PWR?"  Part="1" 
AR Path="/61A6BC09" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 1150 7050 50  0001 C CNN
F 1 "GND" H 1155 7127 50  0000 C CNN
F 2 "" H 1150 7300 50  0001 C CNN
F 3 "" H 1150 7300 50  0001 C CNN
	1    1150 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  7250 1150 7250
Wire Wire Line
	1150 7250 1150 7300
$Comp
L power:+BATT #PWR?
U 1 1 61A6BC11
P 1150 7050
AR Path="/6173FC4B/61A6BC11" Ref="#PWR?"  Part="1" 
AR Path="/61A4AF27/61A6BC11" Ref="#PWR?"  Part="1" 
AR Path="/61A6BC11" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 1150 6900 50  0001 C CNN
F 1 "+BATT" H 1165 7223 50  0000 C CNN
F 2 "" H 1150 7050 50  0001 C CNN
F 3 "" H 1150 7050 50  0001 C CNN
	1    1150 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 7050 1150 7150
Wire Wire Line
	950  7150 1150 7150
NoConn ~ 950  7050
NoConn ~ 950  6950
$Comp
L myAmp:R R8
U 1 1 615268DC
P 1800 2150
AR Path="/615268DC" Ref="R8"  Part="1" 
AR Path="/60D4580B/615268DC" Ref="R?"  Part="1" 
AR Path="/61A4AF27/615268DC" Ref="R?"  Part="1" 
F 0 "R8" H 1870 2196 50  0000 L CNN
F 1 "1M" H 1870 2105 50  0000 L CNN
F 2 "myAmp:R_10MM_TT" V 1730 2150 50  0001 C CNN
F 3 "" H 1800 2150 50  0001 C CNN
	1    1800 2150
	1    0    0    -1  
$EndComp
$Comp
L myAmp:J201 Q1
U 1 1 615268E2
P 2150 1700
AR Path="/615268E2" Ref="Q1"  Part="1" 
AR Path="/60D4580B/615268E2" Ref="Q?"  Part="1" 
AR Path="/61A4AF27/615268E2" Ref="Q?"  Part="1" 
F 0 "Q1" H 2341 1796 50  0000 L CNN
F 1 "MMBFJ201" H 2341 1705 50  0000 L CNN
F 2 "myAmp:SOT-23_with_jig" H 2150 1700 50  0001 C CNN
F 3 "" H 2150 1650 50  0001 L CNN
	1    2150 1700
	1    0    0    -1  
$EndComp
$Comp
L myAmp:JACK_MONO J1
U 1 1 615268E8
P 1050 1550
AR Path="/615268E8" Ref="J1"  Part="1" 
AR Path="/60D4580B/615268E8" Ref="J?"  Part="1" 
AR Path="/61A4AF27/615268E8" Ref="J?"  Part="1" 
F 0 "J1" H 1033 1965 50  0000 C CNN
F 1 "JACK_MONO" H 1033 1874 50  0000 C CNN
F 2 "myAmp:JACK_CL13106" H 1300 1500 50  0001 C CNN
F 3 "" H 1150 1500 50  0001 C CNN
	1    1050 1550
	1    0    0    -1  
$EndComp
$Comp
L myAmp:Zener D1
U 1 1 615268EE
P 1600 1950
AR Path="/615268EE" Ref="D1"  Part="1" 
AR Path="/60D4580B/615268EE" Ref="D?"  Part="1" 
AR Path="/61A4AF27/615268EE" Ref="D?"  Part="1" 
F 0 "D1" V 1600 2100 50  0000 L CNN
F 1 "1N4773a" V 1500 2100 50  0000 L CNN
F 2 "myAmp:DO41" H 1600 1950 50  0001 C CNN
F 3 "" H 1600 1950 50  0000 C CNN
	1    1600 1950
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:Zener D2
U 1 1 615268F4
P 1600 2250
AR Path="/615268F4" Ref="D2"  Part="1" 
AR Path="/60D4580B/615268F4" Ref="D?"  Part="1" 
AR Path="/61A4AF27/615268F4" Ref="D?"  Part="1" 
F 0 "D2" V 1550 2000 50  0000 L CNN
F 1 "1N4773a" V 1650 1750 50  0000 L CNN
F 2 "myAmp:DO41" H 1600 2250 50  0001 C CNN
F 3 "" H 1600 2250 50  0000 C CNN
	1    1600 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 2050 1600 2150
Wire Wire Line
	1950 1750 1800 1750
Wire Wire Line
	1600 1750 1600 1850
$Comp
L power:GND #PWR0114
U 1 1 615268FD
P 1600 2450
AR Path="/615268FD" Ref="#PWR0114"  Part="1" 
AR Path="/60D4580B/615268FD" Ref="#PWR?"  Part="1" 
AR Path="/61A4AF27/615268FD" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 1600 2200 50  0001 C CNN
F 1 "GND" H 1605 2277 50  0000 C CNN
F 2 "" H 1600 2450 50  0001 C CNN
F 3 "" H 1600 2450 50  0001 C CNN
	1    1600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2450 1600 2350
Wire Wire Line
	1800 1750 1800 2000
Connection ~ 1800 1750
Wire Wire Line
	1800 1750 1600 1750
$Comp
L power:GND #PWR0115
U 1 1 61526907
P 1800 2450
AR Path="/61526907" Ref="#PWR0115"  Part="1" 
AR Path="/60D4580B/61526907" Ref="#PWR?"  Part="1" 
AR Path="/61A4AF27/61526907" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 1800 2200 50  0001 C CNN
F 1 "GND" H 1805 2277 50  0000 C CNN
F 2 "" H 1800 2450 50  0001 C CNN
F 3 "" H 1800 2450 50  0001 C CNN
	1    1800 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2300 1800 2450
$Comp
L power:GND #PWR0116
U 1 1 6152690E
P 2250 2500
AR Path="/6152690E" Ref="#PWR0116"  Part="1" 
AR Path="/60D4580B/6152690E" Ref="#PWR?"  Part="1" 
AR Path="/61A4AF27/6152690E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 2250 2250 50  0001 C CNN
F 1 "GND" H 2255 2327 50  0000 C CNN
F 2 "" H 2250 2500 50  0001 C CNN
F 3 "" H 2250 2500 50  0001 C CNN
	1    2250 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 61526914
P 1650 1400
AR Path="/61526914" Ref="#PWR0117"  Part="1" 
AR Path="/60D4580B/61526914" Ref="#PWR?"  Part="1" 
AR Path="/61A4AF27/61526914" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 1650 1150 50  0001 C CNN
F 1 "GND" H 1655 1227 50  0000 C CNN
F 2 "" H 1650 1400 50  0001 C CNN
F 3 "" H 1650 1400 50  0001 C CNN
	1    1650 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1350 1500 1350
Wire Wire Line
	1500 1350 1500 1450
Wire Wire Line
	1500 1650 1450 1650
Wire Wire Line
	1450 1450 1500 1450
Connection ~ 1500 1450
Wire Wire Line
	1500 1450 1500 1650
Wire Wire Line
	1500 1350 1650 1350
Wire Wire Line
	1650 1350 1650 1400
Connection ~ 1500 1350
Wire Wire Line
	2250 2100 2250 2050
Wire Wire Line
	2250 2400 2250 2450
Connection ~ 1600 1750
Wire Wire Line
	2250 1400 2250 1450
Connection ~ 2250 1450
Wire Wire Line
	2250 1450 2250 1500
Wire Wire Line
	1450 1750 1600 1750
Wire Wire Line
	2250 1450 2700 1450
$Comp
L myAmp:R R9
U 1 1 615269D5
P 2250 2250
AR Path="/615269D5" Ref="R9"  Part="1" 
AR Path="/60D4580B/615269D5" Ref="R?"  Part="1" 
AR Path="/61A4AF27/615269D5" Ref="R?"  Part="1" 
F 0 "R9" H 2300 2300 50  0000 L CNN
F 1 "1K5" H 2300 2200 50  0000 L CNN
F 2 "myAmp:R_10MM_TT" V 2180 2250 50  0001 C CNN
F 3 "" H 2250 2250 50  0001 C CNN
	1    2250 2250
	-1   0    0    -1  
$EndComp
Text Label 2350 1450 0    50   ~ 0
jfet_d
Text Label 2250 1950 0    50   ~ 0
jfet_s
Text Label 1800 1650 0    50   ~ 0
jfet_g
Wire Wire Line
	1800 1650 1800 1750
$Comp
L myAmp:R R4
U 1 1 615269E3
P 2250 1250
AR Path="/615269E3" Ref="R4"  Part="1" 
AR Path="/60D4580B/615269E3" Ref="R?"  Part="1" 
AR Path="/61A4AF27/615269E3" Ref="R?"  Part="1" 
F 0 "R4" H 2300 1200 50  0000 L CNN
F 1 "1M" H 2300 1300 50  0000 L CNN
F 2 "myAmp:R_10MM_TT" V 2180 1250 50  0001 C CNN
F 3 "" H 2250 1250 50  0001 C CNN
	1    2250 1250
	1    0    0    1   
$EndComp
Wire Wire Line
	2250 1000 2250 1050
$Comp
L myAmp:R R10
U 1 1 615269EA
P 2400 2250
AR Path="/615269EA" Ref="R10"  Part="1" 
AR Path="/60D4580B/615269EA" Ref="R?"  Part="1" 
AR Path="/61A4AF27/615269EA" Ref="R?"  Part="1" 
F 0 "R10" H 2450 2300 50  0000 L CNN
F 1 "1M" H 2450 2200 50  0000 L CNN
F 2 "myAmp:R_10MM_TT" V 2330 2250 50  0001 C CNN
F 3 "" H 2400 2250 50  0001 C CNN
	1    2400 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2050 2400 2050
Wire Wire Line
	2400 2050 2400 2100
Connection ~ 2250 2050
Wire Wire Line
	2250 2050 2250 1900
Wire Wire Line
	2400 2400 2400 2450
Wire Wire Line
	2400 2450 2250 2450
Connection ~ 2250 2450
Wire Wire Line
	2250 2450 2250 2500
$Comp
L myAmp:R R3
U 1 1 615269F8
P 2100 1250
AR Path="/615269F8" Ref="R3"  Part="1" 
AR Path="/60D4580B/615269F8" Ref="R?"  Part="1" 
AR Path="/61A4AF27/615269F8" Ref="R?"  Part="1" 
F 0 "R3" H 2150 1200 50  0000 L CNN
F 1 "15K" H 2150 1300 50  0000 L CNN
F 2 "myAmp:R_10MM_TT" V 2030 1250 50  0001 C CNN
F 3 "" H 2100 1250 50  0001 C CNN
	1    2100 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2100 1100 2100 1050
Wire Wire Line
	2100 1050 2250 1050
Connection ~ 2250 1050
Wire Wire Line
	2250 1050 2250 1100
Wire Wire Line
	2250 1450 2100 1450
Wire Wire Line
	2100 1450 2100 1400
$Comp
L power:+BATT #PWR0118
U 1 1 61ED0FDA
P 2250 1000
F 0 "#PWR0118" H 2250 850 50  0001 C CNN
F 1 "+BATT" H 2265 1173 50  0000 C CNN
F 2 "" H 2250 1000 50  0001 C CNN
F 3 "" H 2250 1000 50  0001 C CNN
	1    2250 1000
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 61B5A9D1
P 10850 6250
AR Path="/6173FC4B/61B5A9D1" Ref="J?"  Part="1" 
AR Path="/61A4AF27/61B5A9D1" Ref="J?"  Part="1" 
AR Path="/61B5A9D1" Ref="J3"  Part="1" 
F 0 "J3" H 10927 6291 50  0000 L CNN
F 1 "HOLE" H 10927 6200 50  0000 L CNN
F 2 "myAmp:MountingHole" H 10850 6250 50  0001 C CNN
F 3 "" H 10850 6250 50  0001 C CNN
	1    10850 6250
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 61B5A9CB
P 10850 6050
AR Path="/6173FC4B/61B5A9CB" Ref="J?"  Part="1" 
AR Path="/61A4AF27/61B5A9CB" Ref="J?"  Part="1" 
AR Path="/61B5A9CB" Ref="J2"  Part="1" 
F 0 "J2" H 10927 6091 50  0000 L CNN
F 1 "HOLE" H 10927 6000 50  0000 L CNN
F 2 "myAmp:MountingHole" H 10850 6050 50  0001 C CNN
F 3 "" H 10850 6050 50  0001 C CNN
	1    10850 6050
	1    0    0    -1  
$EndComp
$Comp
L myAmp:CONN_01X02 J5
U 1 1 61A6E5BB
P 6700 1500
F 0 "J5" H 6617 1317 50  0000 C CNN
F 1 "CONN_01X02" V 6800 1500 50  0001 C CNN
F 2 "myAmp:PIN_1x02" H 6700 1500 50  0001 C CNN
F 3 "" H 6700 1500 50  0001 C CNN
	1    6700 1500
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 61A7E4C3
P 6400 1650
AR Path="/61A7E4C3" Ref="#PWR0119"  Part="1" 
AR Path="/60D4580B/61A7E4C3" Ref="#PWR?"  Part="1" 
AR Path="/61A4AF27/61A7E4C3" Ref="#PWR?"  Part="1" 
F 0 "#PWR0119" H 6400 1400 50  0001 C CNN
F 1 "GND" H 6405 1477 50  0000 C CNN
F 2 "" H 6400 1650 50  0001 C CNN
F 3 "" H 6400 1650 50  0001 C CNN
	1    6400 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1550 6400 1550
Wire Wire Line
	6400 1550 6400 1650
Wire Wire Line
	5650 1450 6500 1450
Text Label 6100 1450 0    50   ~ 0
OUT
$EndSCHEMATC
