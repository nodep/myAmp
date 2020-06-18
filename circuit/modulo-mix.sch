EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
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
L myAmp:R R?
U 1 1 5F066997
P 4450 2300
AR Path="/5F066997" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F066997" Ref="R17"  Part="1" 
F 0 "R17" V 4450 2300 50  0000 C CNN
F 1 "10K" V 4550 2300 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4380 2300 50  0001 C CNN
F 3 "" H 4450 2300 50  0001 C CNN
	1    4450 2300
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:C C?
U 1 1 5F06699D
P 4000 2300
AR Path="/5F06699D" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F06699D" Ref="C18"  Part="1" 
F 0 "C18" V 4050 2200 50  0000 R CNN
F 1 "1µF" V 4050 2500 50  0000 R CNN
F 2 "myAmp:C_5MM_1206" H 4038 2150 50  0001 C CNN
F 3 "" H 4000 2300 50  0001 C CNN
	1    4000 2300
	0    -1   -1   0   
$EndComp
Text Label 3300 2300 0    50   ~ 0
FVL
Wire Wire Line
	4100 2300 4300 2300
$Comp
L myAmp:R R?
U 1 1 5F0669A5
P 4950 2300
AR Path="/5F0669A5" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F0669A5" Ref="R28"  Part="1" 
F 0 "R28" V 4950 2300 50  0000 C CNN
F 1 "10K" V 5050 2300 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4880 2300 50  0001 C CNN
F 3 "" H 4950 2300 50  0001 C CNN
	1    4950 2300
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:R_POT_DBL RV?
U 1 1 5F0669AB
P 4700 2550
AR Path="/5F0669AB" Ref="RV?"  Part="1" 
AR Path="/5F048FD6/5F0669AB" Ref="RV7"  Part="1" 
F 0 "RV7" H 4630 2596 50  0000 R CNN
F 1 "10K" H 4630 2505 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD902_xx15K" H 4700 2550 50  0001 C CNN
F 3 "" H 4700 2550 50  0001 C CNN
	1    4700 2550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4800 2300 4700 2300
Wire Wire Line
	4700 2400 4700 2300
Connection ~ 4700 2300
Wire Wire Line
	4700 2300 4600 2300
Wire Wire Line
	4550 2550 4200 2550
$Comp
L myAmp:R R?
U 1 1 5F0669B7
P 4450 2800
AR Path="/5F0669B7" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F0669B7" Ref="R18"  Part="1" 
F 0 "R18" V 4450 2800 50  0000 C CNN
F 1 "10K" V 4550 2800 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4380 2800 50  0001 C CNN
F 3 "" H 4450 2800 50  0001 C CNN
	1    4450 2800
	0    -1   1    0   
$EndComp
$Comp
L myAmp:R R?
U 1 1 5F0669BD
P 4950 2800
AR Path="/5F0669BD" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F0669BD" Ref="R29"  Part="1" 
F 0 "R29" V 4950 2800 50  0000 C CNN
F 1 "10K" V 5050 2800 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4880 2800 50  0001 C CNN
F 3 "" H 4950 2800 50  0001 C CNN
	1    4950 2800
	0    -1   1    0   
$EndComp
Wire Wire Line
	4600 2800 4700 2800
Wire Wire Line
	4700 2700 4700 2800
Connection ~ 4700 2800
Wire Wire Line
	4700 2800 4800 2800
$Comp
L myAmp:C C?
U 1 1 5F0669C7
P 4000 2800
AR Path="/5F0669C7" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F0669C7" Ref="C19"  Part="1" 
F 0 "C19" V 4050 2700 50  0000 R CNN
F 1 "1µF" V 4050 3000 50  0000 R CNN
F 2 "myAmp:C_5MM_1206" H 4038 2650 50  0001 C CNN
F 3 "" H 4000 2800 50  0001 C CNN
	1    4000 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 2800 4300 2800
Text Label 3300 2800 0    50   ~ 0
PAL
Wire Wire Line
	5100 2300 5200 2300
Wire Wire Line
	5200 2800 5100 2800
$Comp
L myAmp:TL072 U?
U 1 1 5F0669D1
P 6050 2450
AR Path="/5F0669D1" Ref="U?"  Part="1" 
AR Path="/5F048FD6/5F0669D1" Ref="U4"  Part="1" 
F 0 "U4" H 6050 2817 50  0000 C CNN
F 1 "NE5532" H 6050 2726 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 6050 2450 50  0001 C CNN
F 3 "" H 6050 2450 50  0001 C CNN
	1    6050 2450
	1    0    0    -1  
$EndComp
$Comp
L myAmp:NE5532 U?
U 3 1 5F0669D9
P 7600 3600
AR Path="/5F0669D9" Ref="U?"  Part="3" 
AR Path="/5F048FD6/5F0669D9" Ref="U4"  Part="3" 
F 0 "U4" H 7558 3646 50  0000 L CNN
F 1 "NE5532" H 7558 3555 50  0000 L CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 7600 3600 50  0001 C CNN
F 3 "" H 7600 3600 50  0001 C CNN
	3    7600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3200 7500 3250
$Comp
L power:GND #PWR?
U 1 1 5F0669E6
P 7500 4000
AR Path="/5F0669E6" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5F0669E6" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 7500 3750 50  0001 C CNN
F 1 "GND" H 7505 3827 50  0000 C CNN
F 2 "" H 7500 4000 50  0001 C CNN
F 3 "" H 7500 4000 50  0001 C CNN
	1    7500 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4000 7500 3950
$Comp
L myAmp:C C?
U 1 1 5F0669ED
P 7300 3600
AR Path="/5F0669ED" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F0669ED" Ref="C24"  Part="1" 
F 0 "C24" H 7400 3700 50  0000 C CNN
F 1 "100nF" H 7450 3500 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 7338 3450 50  0001 C CNN
F 3 "" H 7300 3600 50  0001 C CNN
	1    7300 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	7300 3500 7300 3250
Wire Wire Line
	7300 3250 7500 3250
Connection ~ 7500 3250
Wire Wire Line
	7500 3250 7500 3300
Wire Wire Line
	7300 3700 7300 3950
Wire Wire Line
	7300 3950 7500 3950
Connection ~ 7500 3950
Wire Wire Line
	7500 3950 7500 3900
Text Notes 4000 1700 0    150  ~ 0
wet/dry mixer
Wire Wire Line
	6200 2800 6400 2800
Wire Wire Line
	5200 2300 5200 2550
Connection ~ 5200 2550
Wire Wire Line
	5200 2550 5200 2800
Wire Wire Line
	6400 2450 6400 2600
Wire Wire Line
	6050 2650 6050 2600
Wire Wire Line
	6050 2600 6400 2600
Connection ~ 6400 2600
Wire Wire Line
	6400 2600 6400 2800
Wire Wire Line
	5200 2550 5400 2550
Wire Wire Line
	5400 2800 5900 2800
Connection ~ 5400 2550
$Comp
L myAmp:R R?
U 1 1 5F066A0A
P 4450 3650
AR Path="/5F066A0A" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F066A0A" Ref="R23"  Part="1" 
F 0 "R23" V 4450 3650 50  0000 C CNN
F 1 "10K" V 4550 3650 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4380 3650 50  0001 C CNN
F 3 "" H 4450 3650 50  0001 C CNN
	1    4450 3650
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:C C?
U 1 1 5F066A10
P 4000 3650
AR Path="/5F066A10" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F066A10" Ref="C21"  Part="1" 
F 0 "C21" V 4050 3550 50  0000 R CNN
F 1 "1µF" V 4050 3850 50  0000 R CNN
F 2 "myAmp:C_5MM_1206" H 4038 3500 50  0001 C CNN
F 3 "" H 4000 3650 50  0001 C CNN
	1    4000 3650
	0    -1   -1   0   
$EndComp
Text Label 3300 3650 0    50   ~ 0
FVR
Wire Wire Line
	4100 3650 4300 3650
$Comp
L myAmp:R R?
U 1 1 5F066A18
P 4950 3650
AR Path="/5F066A18" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F066A18" Ref="R30"  Part="1" 
F 0 "R30" V 4950 3650 50  0000 C CNN
F 1 "10K" V 5050 3650 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4880 3650 50  0001 C CNN
F 3 "" H 4950 3650 50  0001 C CNN
	1    4950 3650
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:R_POT_DBL RV?
U 2 1 5F066A1E
P 4700 3900
AR Path="/5F066A1E" Ref="RV?"  Part="1" 
AR Path="/5F048FD6/5F066A1E" Ref="RV7"  Part="2" 
F 0 "RV7" H 4630 3946 50  0000 R CNN
F 1 "10K" H 4630 3855 50  0000 R CNN
F 2 "myAmp:BOURNS_PTD902_xx15K" H 4700 3900 50  0001 C CNN
F 3 "" H 4700 3900 50  0001 C CNN
	2    4700 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4800 3650 4700 3650
Wire Wire Line
	4700 3750 4700 3650
Connection ~ 4700 3650
Wire Wire Line
	4700 3650 4600 3650
$Comp
L myAmp:R R?
U 1 1 5F066A2A
P 4450 4150
AR Path="/5F066A2A" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F066A2A" Ref="R24"  Part="1" 
F 0 "R24" V 4450 4150 50  0000 C CNN
F 1 "10K" V 4550 4150 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4380 4150 50  0001 C CNN
F 3 "" H 4450 4150 50  0001 C CNN
	1    4450 4150
	0    -1   1    0   
$EndComp
$Comp
L myAmp:R R?
U 1 1 5F066A30
P 4950 4150
AR Path="/5F066A30" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F066A30" Ref="R31"  Part="1" 
F 0 "R31" V 4950 4150 50  0000 C CNN
F 1 "10K" V 5050 4150 50  0000 C CNN
F 2 "myAmp:R_10MM" V 4880 4150 50  0001 C CNN
F 3 "" H 4950 4150 50  0001 C CNN
	1    4950 4150
	0    -1   1    0   
$EndComp
Wire Wire Line
	4600 4150 4700 4150
Wire Wire Line
	4700 4050 4700 4150
Connection ~ 4700 4150
Wire Wire Line
	4700 4150 4800 4150
$Comp
L myAmp:C C?
U 1 1 5F066A3A
P 4000 4150
AR Path="/5F066A3A" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F066A3A" Ref="C23"  Part="1" 
F 0 "C23" V 4050 4050 50  0000 R CNN
F 1 "1µF" V 4050 4350 50  0000 R CNN
F 2 "myAmp:C_5MM_1206" H 4038 4000 50  0001 C CNN
F 3 "" H 4000 4150 50  0001 C CNN
	1    4000 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 4150 4300 4150
Text Label 3300 4150 0    50   ~ 0
PAR
Wire Wire Line
	5100 3650 5200 3650
Wire Wire Line
	5200 4150 5100 4150
$Comp
L myAmp:TL072 U?
U 2 1 5F066A44
P 6050 3800
AR Path="/5F066A44" Ref="U?"  Part="2" 
AR Path="/5F048FD6/5F066A44" Ref="U4"  Part="2" 
F 0 "U4" H 6050 4167 50  0000 C CNN
F 1 "NE5532" H 6050 4076 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 6050 3800 50  0001 C CNN
F 3 "" H 6050 3800 50  0001 C CNN
	2    6050 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4150 6450 4150
Wire Wire Line
	5200 3650 5200 3900
Connection ~ 5200 3900
Wire Wire Line
	5200 3900 5200 4150
Wire Wire Line
	6050 4000 6050 3950
Wire Wire Line
	6050 3950 6450 3950
Connection ~ 6450 3950
Wire Wire Line
	6450 3950 6450 4150
Wire Wire Line
	5200 3900 5400 3900
Wire Wire Line
	5400 4150 5900 4150
Connection ~ 5400 3900
$Comp
L myAmp:R_POT_DBL RV?
U 1 1 5F066A60
P 6050 2800
AR Path="/5F066A60" Ref="RV?"  Part="2" 
AR Path="/5F048FD6/5F066A60" Ref="RV8"  Part="1" 
F 0 "RV8" V 6050 2900 50  0000 R CNN
F 1 "10K" V 5950 2800 50  0000 C CNN
F 2 "myAmp:BOURNS_PTD902_xx15K" H 6050 2800 50  0001 C CNN
F 3 "" H 6050 2800 50  0001 C CNN
	1    6050 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 2450 6400 2450
Connection ~ 6400 2450
Wire Wire Line
	6350 3800 6450 3800
Connection ~ 6450 3800
Wire Wire Line
	5400 3900 5750 3900
Wire Wire Line
	6450 3800 6600 3800
Wire Wire Line
	6400 2450 6550 2450
Wire Wire Line
	5400 2550 5750 2550
$Comp
L myAmp:HOLE J?
U 1 1 5F09C364
P 6550 6950
AR Path="/5F09C364" Ref="J?"  Part="1" 
AR Path="/60D4580B/5F09C364" Ref="J?"  Part="1" 
AR Path="/5F048FD6/5F09C364" Ref="J24"  Part="1" 
F 0 "J24" H 6627 6991 50  0000 L CNN
F 1 "HOLE" H 6627 6900 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6550 6950 50  0001 C CNN
F 3 "" H 6550 6950 50  0001 C CNN
	1    6550 6950
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5F09C36A
P 6550 7150
AR Path="/5F09C36A" Ref="J?"  Part="1" 
AR Path="/60D4580B/5F09C36A" Ref="J?"  Part="1" 
AR Path="/5F048FD6/5F09C36A" Ref="J25"  Part="1" 
F 0 "J25" H 6627 7191 50  0000 L CNN
F 1 "HOLE" H 6627 7100 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6550 7150 50  0001 C CNN
F 3 "" H 6550 7150 50  0001 C CNN
	1    6550 7150
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5F09C370
P 6550 7350
AR Path="/5F09C370" Ref="J?"  Part="1" 
AR Path="/60D4580B/5F09C370" Ref="J?"  Part="1" 
AR Path="/5F048FD6/5F09C370" Ref="J26"  Part="1" 
F 0 "J26" H 6627 7391 50  0000 L CNN
F 1 "HOLE" H 6627 7300 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6550 7350 50  0001 C CNN
F 3 "" H 6550 7350 50  0001 C CNN
	1    6550 7350
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J?
U 1 1 5F09C376
P 6550 7550
AR Path="/5F09C376" Ref="J?"  Part="1" 
AR Path="/60D4580B/5F09C376" Ref="J?"  Part="1" 
AR Path="/5F048FD6/5F09C376" Ref="J27"  Part="1" 
F 0 "J27" H 6627 7591 50  0000 L CNN
F 1 "HOLE" H 6627 7500 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6550 7550 50  0001 C CNN
F 3 "" H 6550 7550 50  0001 C CNN
	1    6550 7550
	1    0    0    -1  
$EndComp
$Comp
L myAmp:modulo-bus U16
U 1 1 5F1A9E20
P 1800 2900
F 0 "U16" H 1742 4215 50  0000 C CNN
F 1 "modulo-bus" H 1742 4124 50  0000 C CNN
F 2 "myAmp:modulo-bus" V 2000 3600 50  0001 C CNN
F 3 "" H 1450 3450 50  0001 C CNN
	1    1800 2900
	-1   0    0    -1  
$EndComp
$Comp
L myAmp:TLE2426 U?
U 1 1 5F1BF589
P 9900 1150
AR Path="/5F1BF589" Ref="U?"  Part="1" 
AR Path="/60D4580B/5F1BF589" Ref="U?"  Part="1" 
AR Path="/5F048FD6/5F1BF589" Ref="U17"  Part="1" 
F 0 "U17" H 9867 1515 50  0000 C CNN
F 1 "TLE2426" H 9867 1424 50  0000 C CNN
F 2 "myAmp:TO-92_Inline_Wide" H 9700 950 50  0001 C CNN
F 3 "" H 9700 950 50  0001 C CNN
	1    9900 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1BF58F
P 9900 1700
AR Path="/5F1BF58F" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/5F1BF58F" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5F1BF58F" Ref="#PWR0171"  Part="1" 
F 0 "#PWR0171" H 9900 1450 50  0001 C CNN
F 1 "GND" H 9905 1527 50  0000 C CNN
F 2 "" H 9900 1700 50  0001 C CNN
F 3 "" H 9900 1700 50  0001 C CNN
	1    9900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1050 9450 1150
Wire Wire Line
	9450 1150 9550 1150
Text Notes 8750 2300 0    150  ~ 0
virtual ground
$Comp
L myAmp:BC547 Q?
U 1 1 5F1BF59E
P 9150 3100
AR Path="/5F1BF59E" Ref="Q?"  Part="1" 
AR Path="/60D4580B/5F1BF59E" Ref="Q?"  Part="1" 
AR Path="/5F048FD6/5F1BF59E" Ref="Q4"  Part="1" 
F 0 "Q4" H 9341 3146 50  0000 L CNN
F 1 "BC547" H 9341 3055 50  0000 L CNN
F 2 "myAmp:TO-92_Inline_Wide" H 9350 3025 50  0001 L CIN
F 3 "" H 9150 3100 50  0000 L CNN
	1    9150 3100
	1    0    0    -1  
$EndComp
$Comp
L myAmp:BC557 Q?
U 1 1 5F1BF5A4
P 9150 4300
AR Path="/5F1BF5A4" Ref="Q?"  Part="1" 
AR Path="/60D4580B/5F1BF5A4" Ref="Q?"  Part="1" 
AR Path="/5F048FD6/5F1BF5A4" Ref="Q5"  Part="1" 
F 0 "Q5" H 9341 4254 50  0000 L CNN
F 1 "BC557" H 9341 4345 50  0000 L CNN
F 2 "myAmp:TO-92_Inline_Wide" H 9350 4225 50  0001 L CIN
F 3 "" H 9150 4300 50  0001 L CNN
	1    9150 4300
	1    0    0    1   
$EndComp
$Comp
L myAmp:R R?
U 1 1 5F1BF5AA
P 9250 3500
AR Path="/5F1BF5AA" Ref="R?"  Part="1" 
AR Path="/60D4580B/5F1BF5AA" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F1BF5AA" Ref="R43"  Part="1" 
F 0 "R43" H 9200 3450 50  0000 R CNN
F 1 "10" H 9200 3550 50  0000 R CNN
F 2 "myAmp:R_10MM" V 9180 3500 50  0001 C CNN
F 3 "" H 9250 3500 50  0001 C CNN
	1    9250 3500
	-1   0    0    1   
$EndComp
$Comp
L myAmp:R R?
U 1 1 5F1BF5B0
P 9250 3900
AR Path="/5F1BF5B0" Ref="R?"  Part="1" 
AR Path="/60D4580B/5F1BF5B0" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F1BF5B0" Ref="R44"  Part="1" 
F 0 "R44" H 9200 3850 50  0000 R CNN
F 1 "10" H 9200 3950 50  0000 R CNN
F 2 "myAmp:R_10MM" V 9180 3900 50  0001 C CNN
F 3 "" H 9250 3900 50  0001 C CNN
	1    9250 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	9250 3650 9250 3700
Wire Wire Line
	8900 3700 9250 3700
Connection ~ 9250 3700
Wire Wire Line
	9250 3700 10100 3700
Wire Wire Line
	9250 3700 9250 3750
Wire Wire Line
	9250 4050 9250 4100
Wire Wire Line
	9250 3300 9250 3350
$Comp
L myAmp:1N4148 D?
U 1 1 5F1BF5BD
P 8900 3400
AR Path="/5F1BF5BD" Ref="D?"  Part="1" 
AR Path="/60D4580B/5F1BF5BD" Ref="D?"  Part="1" 
AR Path="/5F048FD6/5F1BF5BD" Ref="D8"  Part="1" 
F 0 "D8" V 8950 3550 50  0000 R CNN
F 1 "1N4148" V 8850 3750 50  0000 R CNN
F 2 "myAmp:DO35" H 8900 3400 50  0001 C CNN
F 3 "" H 8900 3400 50  0001 C CNN
	1    8900 3400
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:1N4148 D?
U 1 1 5F1BF5C3
P 8900 4000
AR Path="/5F1BF5C3" Ref="D?"  Part="1" 
AR Path="/60D4580B/5F1BF5C3" Ref="D?"  Part="1" 
AR Path="/5F048FD6/5F1BF5C3" Ref="D9"  Part="1" 
F 0 "D9" V 8950 4150 50  0000 R CNN
F 1 "1N4148" V 8850 4350 50  0000 R CNN
F 2 "myAmp:DO35" H 8900 4000 50  0001 C CNN
F 3 "" H 8900 4000 50  0001 C CNN
	1    8900 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8900 3550 8900 3700
Wire Wire Line
	8900 3700 8900 3850
Connection ~ 8900 3700
Wire Wire Line
	8450 3700 8900 3700
$Comp
L myAmp:R R?
U 1 1 5F1BF5CD
P 8900 4500
AR Path="/5F1BF5CD" Ref="R?"  Part="1" 
AR Path="/60D4580B/5F1BF5CD" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F1BF5CD" Ref="R42"  Part="1" 
F 0 "R42" H 9100 4450 50  0000 R CNN
F 1 "4K7" H 9100 4550 50  0000 R CNN
F 2 "myAmp:R_10MM" V 8830 4500 50  0001 C CNN
F 3 "" H 8900 4500 50  0001 C CNN
	1    8900 4500
	-1   0    0    1   
$EndComp
$Comp
L myAmp:R R?
U 1 1 5F1BF5D3
P 8900 2900
AR Path="/5F1BF5D3" Ref="R?"  Part="1" 
AR Path="/60D4580B/5F1BF5D3" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F1BF5D3" Ref="R41"  Part="1" 
F 0 "R41" H 8950 2850 50  0000 L CNN
F 1 "4K7" H 9100 2950 50  0000 R CNN
F 2 "myAmp:R_10MM" V 8830 2900 50  0001 C CNN
F 3 "" H 8900 2900 50  0001 C CNN
	1    8900 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	8900 3050 8900 3100
Wire Wire Line
	8950 3100 8900 3100
Connection ~ 8900 3100
Wire Wire Line
	8900 3100 8900 3250
Wire Wire Line
	8900 4150 8900 4300
Wire Wire Line
	8950 4300 8900 4300
Connection ~ 8900 4300
Wire Wire Line
	8900 4300 8900 4350
$Comp
L myAmp:CPOL C?
U 1 1 5F1BF5E1
P 8450 3150
AR Path="/5F1BF5E1" Ref="C?"  Part="1" 
AR Path="/60D4580B/5F1BF5E1" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F1BF5E1" Ref="C52"  Part="1" 
F 0 "C52" H 8500 3250 50  0000 L CNN
F 1 "220μF" H 8500 3050 50  0000 L CNN
F 2 "myAmp:CPOL_D6.3_P2.5" H 8450 3150 50  0001 C CNN
F 3 "" H 8450 3150 50  0001 C CNN
	1    8450 3150
	-1   0    0    -1  
$EndComp
$Comp
L myAmp:CPOL C?
U 1 1 5F1BF5E7
P 8450 4250
AR Path="/5F1BF5E7" Ref="C?"  Part="1" 
AR Path="/60D4580B/5F1BF5E7" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F1BF5E7" Ref="C53"  Part="1" 
F 0 "C53" H 8500 4350 50  0000 L CNN
F 1 "220μF" H 8500 4150 50  0000 L CNN
F 2 "myAmp:CPOL_D6.3_P2.5" H 8450 4250 50  0001 C CNN
F 3 "" H 8450 4250 50  0001 C CNN
	1    8450 4250
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1BF5ED
P 8900 4800
AR Path="/5F1BF5ED" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/5F1BF5ED" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5F1BF5ED" Ref="#PWR0172"  Part="1" 
F 0 "#PWR0172" H 8900 4550 50  0001 C CNN
F 1 "GND" H 8905 4627 50  0000 C CNN
F 2 "" H 8900 4800 50  0001 C CNN
F 3 "" H 8900 4800 50  0001 C CNN
	1    8900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4500 9250 4700
Wire Wire Line
	9250 4700 8900 4700
Wire Wire Line
	8450 4700 8450 4350
Wire Wire Line
	8450 4150 8450 3700
Connection ~ 8450 3700
Wire Wire Line
	8450 3250 8450 3700
Wire Wire Line
	9250 2700 8900 2700
Wire Wire Line
	8450 2700 8450 3050
Wire Wire Line
	9250 2700 9250 2900
Wire Wire Line
	8900 2750 8900 2700
Connection ~ 8900 2700
Wire Wire Line
	8900 2700 8450 2700
Wire Wire Line
	8900 2700 8900 2650
Wire Wire Line
	8900 4650 8900 4700
Connection ~ 8900 4700
Wire Wire Line
	8900 4700 8450 4700
Wire Wire Line
	8900 4800 8900 4700
$Comp
L power:+12V #PWR?
U 1 1 5F1BF60B
P 9450 1050
AR Path="/5F1BF60B" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/5F1BF60B" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5F1BF60B" Ref="#PWR0173"  Part="1" 
F 0 "#PWR0173" H 9450 900 50  0001 C CNN
F 1 "+12V" H 9465 1223 50  0000 C CNN
F 2 "" H 9450 1050 50  0001 C CNN
F 3 "" H 9450 1050 50  0001 C CNN
	1    9450 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5F1BF611
P 8900 2650
AR Path="/5F1BF611" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/5F1BF611" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5F1BF611" Ref="#PWR0174"  Part="1" 
F 0 "#PWR0174" H 8900 2500 50  0001 C CNN
F 1 "+12V" H 8915 2823 50  0000 C CNN
F 2 "" H 8900 2650 50  0001 C CNN
F 3 "" H 8900 2650 50  0001 C CNN
	1    8900 2650
	1    0    0    -1  
$EndComp
$Comp
L myAmp:SW_SPDT SW?
U 1 1 5F1BF617
P 9950 2900
AR Path="/5F1BF617" Ref="SW?"  Part="1" 
AR Path="/60D4580B/5F1BF617" Ref="SW?"  Part="1" 
AR Path="/5F048FD6/5F1BF617" Ref="SW5"  Part="1" 
F 0 "SW5" H 9950 2669 50  0000 C CNN
F 1 "disc/TLE2426" H 9950 2760 50  0000 C CNN
F 2 "myAmp:ESP2010_switch" H 9950 2900 50  0001 C CNN
F 3 "" H 9950 2900 50  0001 C CNN
	1    9950 2900
	1    0    0    1   
$EndComp
Wire Wire Line
	10700 1150 10700 2850
Wire Wire Line
	10700 2850 10050 2850
Wire Wire Line
	10050 2950 10100 2950
Wire Wire Line
	10100 2950 10100 3700
Text Label 9400 2500 0    50   ~ 0
MIX_VGND
Text Label 10700 1150 0    50   ~ 0
vgnd_tle
Text Label 9600 3700 0    50   ~ 0
vgnd_disc
NoConn ~ 2150 1950
NoConn ~ 2150 2150
NoConn ~ 2150 2250
NoConn ~ 2150 3150
NoConn ~ 2150 3250
NoConn ~ 2150 3350
NoConn ~ 2150 3450
NoConn ~ 2150 3550
NoConn ~ 2150 3650
$Comp
L power:+12V #PWR?
U 1 1 5F1DA304
P 7500 3200
AR Path="/5F1DA304" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/5F1DA304" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5F1DA304" Ref="#PWR0175"  Part="1" 
F 0 "#PWR0175" H 7500 3050 50  0001 C CNN
F 1 "+12V" H 7515 3373 50  0000 C CNN
F 2 "" H 7500 3200 50  0001 C CNN
F 3 "" H 7500 3200 50  0001 C CNN
	1    7500 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1DB0E2
P 2400 1850
AR Path="/5F1DB0E2" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5F1DB0E2" Ref="#PWR0176"  Part="1" 
F 0 "#PWR0176" H 2400 1600 50  0001 C CNN
F 1 "GND" H 2405 1677 50  0000 C CNN
F 2 "" H 2400 1850 50  0001 C CNN
F 3 "" H 2400 1850 50  0001 C CNN
	1    2400 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2400 1850 2150 1850
$Comp
L power:+12V #PWR?
U 1 1 5F1DE673
P 2400 2050
AR Path="/5F1DE673" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/5F1DE673" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5F1DE673" Ref="#PWR0177"  Part="1" 
F 0 "#PWR0177" H 2400 1900 50  0001 C CNN
F 1 "+12V" H 2415 2223 50  0000 C CNN
F 2 "" H 2400 2050 50  0001 C CNN
F 3 "" H 2400 2050 50  0001 C CNN
	1    2400 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 2050 2150 2050
Wire Wire Line
	3150 2800 3150 2450
Wire Wire Line
	3150 2450 2150 2450
Wire Wire Line
	3150 2800 3900 2800
Wire Wire Line
	2150 2550 3100 2550
Wire Wire Line
	3100 2550 3100 4150
Wire Wire Line
	3100 4150 3900 4150
Wire Wire Line
	2350 2300 2350 2750
Wire Wire Line
	2350 2750 2150 2750
Wire Wire Line
	2350 2300 3900 2300
Wire Wire Line
	2350 3650 2350 2850
Wire Wire Line
	2350 2850 2150 2850
Wire Wire Line
	2350 3650 3900 3650
Text Label 5400 2200 0    50   ~ 0
MIX_VGND
Wire Wire Line
	5400 2200 5400 2350
Wire Wire Line
	5400 2350 5750 2350
Text Label 5400 3550 0    50   ~ 0
MIX_VGND
Wire Wire Line
	5400 3550 5400 3700
Wire Wire Line
	5400 3700 5750 3700
Wire Wire Line
	9400 2500 9400 2900
Wire Wire Line
	9400 2900 9850 2900
Wire Wire Line
	6450 3800 6450 3950
NoConn ~ 2150 3050
Wire Wire Line
	2150 3950 2250 3950
Wire Wire Line
	2150 4150 2250 4150
Wire Wire Line
	2150 4250 2500 4250
Text Label 2250 3950 0    50   ~ 0
MIXL
Text Label 2250 4150 0    50   ~ 0
MIXR
Text Label 4200 2550 0    50   ~ 0
MIX_VGND
Text Label 4200 3900 0    50   ~ 0
MIX_VGND
Wire Wire Line
	4200 3900 4550 3900
$Comp
L power:GND #PWR?
U 1 1 5EEFD6B6
P 2500 4050
AR Path="/5EEFD6B6" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/5EEFD6B6" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5EEFD6B6" Ref="#PWR0178"  Part="1" 
F 0 "#PWR0178" H 2500 3800 50  0001 C CNN
F 1 "GND" H 2505 3877 50  0000 C CNN
F 2 "" H 2500 4050 50  0001 C CNN
F 3 "" H 2500 4050 50  0001 C CNN
	1    2500 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2150 4050 2500 4050
$Comp
L power:GND #PWR?
U 1 1 5EF027A4
P 2500 4250
AR Path="/5EF027A4" Ref="#PWR?"  Part="1" 
AR Path="/60D4580B/5EF027A4" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/5EF027A4" Ref="#PWR0179"  Part="1" 
F 0 "#PWR0179" H 2500 4000 50  0001 C CNN
F 1 "GND" H 2505 4077 50  0000 C CNN
F 2 "" H 2500 4250 50  0001 C CNN
F 3 "" H 2500 4250 50  0001 C CNN
	1    2500 4250
	0    -1   -1   0   
$EndComp
Text Label 6550 2450 0    50   ~ 0
MIXL
Text Label 6600 3800 0    50   ~ 0
MIXR
NoConn ~ 2150 3750
$Comp
L myAmp:R_POT_DBL RV?
U 2 1 5F066A4C
P 6050 4150
AR Path="/5F066A4C" Ref="RV?"  Part="2" 
AR Path="/5F048FD6/5F066A4C" Ref="RV8"  Part="2" 
F 0 "RV8" V 6050 4250 50  0000 R CNN
F 1 "10K" V 5950 4150 50  0000 C CNN
F 2 "myAmp:BOURNS_PTD902_xx15K" H 6050 4150 50  0001 C CNN
F 3 "" H 6050 4150 50  0001 C CNN
	2    6050 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 3900 5400 4150
Wire Wire Line
	5400 2550 5400 2800
$Comp
L myAmp:C C?
U 1 1 5F1BF598
P 9450 1400
AR Path="/5F1BF598" Ref="C?"  Part="1" 
AR Path="/60D4580B/5F1BF598" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F1BF598" Ref="C54"  Part="1" 
F 0 "C54" H 9400 1300 50  0000 R CNN
F 1 "100nF" H 9300 1500 50  0000 C CNN
F 2 "myAmp:C_5MM_1206" H 9488 1250 50  0001 C CNN
F 3 "" H 9450 1400 50  0001 C CNN
	1    9450 1400
	1    0    0    1   
$EndComp
Wire Wire Line
	9450 1150 9450 1300
Connection ~ 9450 1150
Wire Wire Line
	9900 1500 9900 1600
Wire Wire Line
	10200 1150 10700 1150
Wire Wire Line
	9450 1500 9450 1600
Wire Wire Line
	9450 1600 9900 1600
Connection ~ 9900 1600
Wire Wire Line
	9900 1600 9900 1700
$EndSCHEMATC
