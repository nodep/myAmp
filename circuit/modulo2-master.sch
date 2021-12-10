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
L myAmp:TL072 U1
U 1 1 61B3CFD6
P 6100 3000
AR Path="/61B3CFD6" Ref="U1"  Part="1" 
AR Path="/5F048FD6/61B3CFD6" Ref="U?"  Part="1" 
F 0 "U1" H 6100 3367 50  0000 C CNN
F 1 "LM358" H 6100 3276 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 6100 3000 50  0001 C CNN
F 3 "" H 6100 3000 50  0001 C CNN
	1    6100 3000
	1    0    0    -1  
$EndComp
$Comp
L myAmp:NE5532 U1
U 3 1 5F0669D9
P 1150 2900
AR Path="/5F0669D9" Ref="U1"  Part="3" 
AR Path="/5F048FD6/5F0669D9" Ref="U?"  Part="3" 
F 0 "U1" H 1108 2946 50  0000 L CNN
F 1 "LM358" H 1108 2855 50  0000 L CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 1150 2900 50  0001 C CNN
F 3 "" H 1150 2900 50  0001 C CNN
	3    1150 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F0669E6
P 1050 3500
AR Path="/5F0669E6" Ref="#PWR05"  Part="1" 
AR Path="/5F048FD6/5F0669E6" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 1050 3250 50  0001 C CNN
F 1 "GND" H 1055 3327 50  0000 C CNN
F 2 "" H 1050 3500 50  0001 C CNN
F 3 "" H 1050 3500 50  0001 C CNN
	1    1050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 3500 1050 3300
$Comp
L myAmp:C C2
U 1 1 5F0669ED
P 850 2900
AR Path="/5F0669ED" Ref="C2"  Part="1" 
AR Path="/5F048FD6/5F0669ED" Ref="C?"  Part="1" 
F 0 "C2" H 950 3000 50  0000 C CNN
F 1 "100nF" H 1000 2800 50  0000 C CNN
F 2 "myAmp:C_FILM_L7.2mm_W3.5mm_P5.00mm" H 888 2750 50  0001 C CNN
F 3 "" H 850 2900 50  0001 C CNN
	1    850  2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	850  2800 850  2500
Wire Wire Line
	850  2500 1050 2500
Wire Wire Line
	1050 2500 1050 2600
Wire Wire Line
	850  3000 850  3300
Wire Wire Line
	850  3300 1050 3300
Connection ~ 1050 3300
Wire Wire Line
	1050 3300 1050 3200
Wire Wire Line
	5850 3450 6550 3450
$Comp
L myAmp:R_POT_DBL RV1
U 1 1 5F066A60
P 5700 3450
AR Path="/5F066A60" Ref="RV1"  Part="1" 
AR Path="/5F048FD6/5F066A60" Ref="RV?"  Part="1" 
F 0 "RV1" V 5700 3550 50  0000 R CNN
F 1 "50K" V 5600 3450 50  0000 C CNN
F 2 "myAmp:BOURNS_PTD901_xx15K" H 5700 3450 50  0001 C CNN
F 3 "" H 5700 3450 50  0001 C CNN
	1    5700 3450
	0    1    -1   0   
$EndComp
$Comp
L myAmp:R R5
U 1 1 61B16417
P 5300 3450
AR Path="/61B16417" Ref="R5"  Part="1" 
AR Path="/60D4580B/61B16417" Ref="R?"  Part="1" 
AR Path="/5F048FD6/61B16417" Ref="R?"  Part="1" 
F 0 "R5" V 5200 3500 50  0000 R CNN
F 1 "39k" V 5400 3550 50  0000 R CNN
F 2 "myAmp:R_10MM" V 5230 3450 50  0001 C CNN
F 3 "" H 5300 3450 50  0001 C CNN
	1    5300 3450
	0    -1   -1   0   
$EndComp
$Comp
L power:+24V #PWR08
U 1 1 61B18644
P 4050 4750
F 0 "#PWR08" H 4050 4600 50  0001 C CNN
F 1 "+24V" H 4065 4923 50  0000 C CNN
F 2 "" H 4050 4750 50  0001 C CNN
F 3 "" H 4050 4750 50  0001 C CNN
	1    4050 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 61B24DD8
P 4500 5000
AR Path="/61B24DD8" Ref="#PWR09"  Part="1" 
AR Path="/5F048FD6/61B24DD8" Ref="#PWR?"  Part="1" 
F 0 "#PWR09" H 4500 4750 50  0001 C CNN
F 1 "GND" H 4505 4827 50  0000 C CNN
F 2 "" H 4500 5000 50  0001 C CNN
F 3 "" H 4500 5000 50  0001 C CNN
	1    4500 5000
	0    1    -1   0   
$EndComp
Wire Wire Line
	4050 4750 4050 5100
$Comp
L power:GND #PWR04
U 1 1 61B48981
P 9450 3300
AR Path="/61B48981" Ref="#PWR04"  Part="1" 
AR Path="/5F048FD6/61B48981" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 9450 3050 50  0001 C CNN
F 1 "GND" H 9455 3127 50  0000 C CNN
F 2 "" H 9450 3300 50  0001 C CNN
F 3 "" H 9450 3300 50  0001 C CNN
	1    9450 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 3450 5550 3450
Connection ~ 6550 3000
Wire Wire Line
	6400 3000 6550 3000
$Comp
L myAmp:HOLE J4
U 1 1 61B20658
P 6000 6550
F 0 "J4" H 6078 6591 50  0000 L CNN
F 1 "HOLE" H 6078 6500 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6000 6550 50  0001 C CNN
F 3 "" H 6000 6550 50  0001 C CNN
	1    6000 6550
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J5
U 1 1 61B2226C
P 6000 6750
F 0 "J5" H 6078 6791 50  0000 L CNN
F 1 "HOLE" H 6078 6700 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6000 6750 50  0001 C CNN
F 3 "" H 6000 6750 50  0001 C CNN
	1    6000 6750
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J6
U 1 1 61B225A6
P 6000 6950
F 0 "J6" H 6078 6991 50  0000 L CNN
F 1 "HOLE" H 6078 6900 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6000 6950 50  0001 C CNN
F 3 "" H 6000 6950 50  0001 C CNN
	1    6000 6950
	1    0    0    -1  
$EndComp
$Comp
L myAmp:HOLE J7
U 1 1 61B22934
P 6000 7150
F 0 "J7" H 6078 7191 50  0000 L CNN
F 1 "HOLE" H 6078 7100 50  0000 L CNN
F 2 "myAmp:MountingHole" H 6000 7150 50  0001 C CNN
F 3 "" H 6000 7150 50  0001 C CNN
	1    6000 7150
	1    0    0    -1  
$EndComp
$Comp
L myAmp:CONN_01X04 J3
U 1 1 61B2338C
P 9800 3150
F 0 "J3" H 9878 3145 50  0000 L CNN
F 1 "CONN_01X04" V 9900 3150 50  0001 C CNN
F 2 "myAmp:PIN_1x04" H 9800 3150 50  0001 C CNN
F 3 "" H 9800 3150 50  0001 C CNN
	1    9800 3150
	1    0    0    -1  
$EndComp
$Comp
L myAmp:CONN_01X04 J2
U 1 1 61B5B672
P 4800 5150
F 0 "J2" H 4878 5145 50  0000 L CNN
F 1 "CONN_01X04" V 4900 5150 50  0001 C CNN
F 2 "myAmp:PIN_1x04" H 4800 5150 50  0001 C CNN
F 3 "" H 4800 5150 50  0001 C CNN
	1    4800 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5000 4600 5000
Wire Wire Line
	4050 5100 4600 5100
NoConn ~ 4600 5200
NoConn ~ 4600 5300
$Comp
L power:GND #PWR03
U 1 1 61B74417
P 9450 3100
AR Path="/61B74417" Ref="#PWR03"  Part="1" 
AR Path="/5F048FD6/61B74417" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 9450 2850 50  0001 C CNN
F 1 "GND" H 9455 2927 50  0000 C CNN
F 2 "" H 9450 3100 50  0001 C CNN
F 3 "" H 9450 3100 50  0001 C CNN
	1    9450 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	9450 3300 9600 3300
Wire Wire Line
	8700 3200 9600 3200
Wire Wire Line
	9450 3100 9600 3100
Wire Wire Line
	8700 3000 9600 3000
$Comp
L myAmp:OPAMP U1
U 2 1 61B7A1EA
P 6100 2000
F 0 "U1" H 6100 2367 50  0000 C CNN
F 1 "LM358" H 6100 2276 50  0000 C CNN
F 2 "myAmp:SOIC-8_3.9x4.9mm_P1.27mm" H 6100 2000 50  0001 C CNN
F 3 "" H 6100 2000 50  0001 C CNN
	2    6100 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2100 5700 2100
Wire Wire Line
	5700 2100 5700 2350
Wire Wire Line
	5700 2350 6500 2350
Wire Wire Line
	6500 2350 6500 2000
Wire Wire Line
	6500 2000 6400 2000
Wire Wire Line
	5800 1900 5500 1900
Wire Wire Line
	5500 1900 5500 2900
Connection ~ 5500 2900
Wire Wire Line
	5500 2900 5800 2900
Wire Wire Line
	6550 3000 6550 3450
$Comp
L myAmp:CONN_01X02 J1
U 1 1 61B281AE
P 4050 3500
F 0 "J1" H 3967 3317 50  0000 C CNN
F 1 "CONN_01X02" V 4150 3500 50  0001 C CNN
F 2 "myAmp:PIN_1x02" H 4050 3500 50  0001 C CNN
F 3 "" H 4050 3500 50  0001 C CNN
	1    4050 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4350 3550 4350 3650
Wire Wire Line
	4250 3550 4350 3550
$Comp
L power:GND #PWR06
U 1 1 61B28DD3
P 4350 3650
AR Path="/61B28DD3" Ref="#PWR06"  Part="1" 
AR Path="/5F048FD6/61B28DD3" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 4350 3400 50  0001 C CNN
F 1 "GND" H 4355 3477 50  0000 C CNN
F 2 "" H 4350 3650 50  0001 C CNN
F 3 "" H 4350 3650 50  0001 C CNN
	1    4350 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3100 5700 3100
Wire Wire Line
	5700 3100 5700 3300
$Comp
L myAmp:R R4
U 1 1 61BA818D
P 4900 3150
AR Path="/61BA818D" Ref="R4"  Part="1" 
AR Path="/60D4580B/61BA818D" Ref="R?"  Part="1" 
AR Path="/5F048FD6/61BA818D" Ref="R?"  Part="1" 
F 0 "R4" H 5100 3200 50  0000 R CNN
F 1 "470k" H 5150 3100 50  0000 R CNN
F 2 "myAmp:R_10MM" V 4830 3150 50  0001 C CNN
F 3 "" H 4900 3150 50  0001 C CNN
	1    4900 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2900 4900 3000
Connection ~ 4900 2900
Wire Wire Line
	4900 2900 5500 2900
Wire Wire Line
	4900 3300 4900 3450
Wire Wire Line
	4900 3450 5150 3450
$Comp
L myAmp:C C4
U 1 1 61BAA65D
P 4500 3450
AR Path="/61BAA65D" Ref="C4"  Part="1" 
AR Path="/5F048FD6/61BAA65D" Ref="C?"  Part="1" 
F 0 "C4" V 4550 3350 50  0000 C CNN
F 1 "680nF" V 4450 3250 50  0000 C CNN
F 2 "myAmp:C_FILM_L7.2mm_W5.5mm_P5.00mm" H 4538 3300 50  0001 C CNN
F 3 "" H 4500 3450 50  0001 C CNN
	1    4500 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4250 3450 4400 3450
Wire Wire Line
	4600 3450 4900 3450
Connection ~ 4900 3450
$Comp
L myAmp:BC547 Q1
U 1 1 5F1BF59E
P 2850 2300
AR Path="/5F1BF59E" Ref="Q1"  Part="1" 
AR Path="/60D4580B/5F1BF59E" Ref="Q?"  Part="1" 
AR Path="/5F048FD6/5F1BF59E" Ref="Q?"  Part="1" 
F 0 "Q1" H 3041 2346 50  0000 L CNN
F 1 "BC547" H 3041 2255 50  0000 L CNN
F 2 "myAmp:TO-92_Inline_Wide" H 3050 2225 50  0001 L CIN
F 3 "" H 2850 2300 50  0000 L CNN
	1    2850 2300
	1    0    0    -1  
$EndComp
$Comp
L myAmp:BC557 Q2
U 1 1 5F1BF5A4
P 2850 3500
AR Path="/5F1BF5A4" Ref="Q2"  Part="1" 
AR Path="/60D4580B/5F1BF5A4" Ref="Q?"  Part="1" 
AR Path="/5F048FD6/5F1BF5A4" Ref="Q?"  Part="1" 
F 0 "Q2" H 3041 3454 50  0000 L CNN
F 1 "BC557" H 3041 3545 50  0000 L CNN
F 2 "myAmp:TO-92_Inline_Wide" H 3050 3425 50  0001 L CIN
F 3 "" H 2850 3500 50  0001 L CNN
	1    2850 3500
	1    0    0    1   
$EndComp
$Comp
L myAmp:R R2
U 1 1 5F1BF5AA
P 2950 2700
AR Path="/5F1BF5AA" Ref="R2"  Part="1" 
AR Path="/60D4580B/5F1BF5AA" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F1BF5AA" Ref="R?"  Part="1" 
F 0 "R2" H 2900 2650 50  0000 R CNN
F 1 "10" H 2900 2750 50  0000 R CNN
F 2 "myAmp:R_10MM" V 2880 2700 50  0001 C CNN
F 3 "" H 2950 2700 50  0001 C CNN
	1    2950 2700
	-1   0    0    1   
$EndComp
$Comp
L myAmp:R R3
U 1 1 5F1BF5B0
P 2950 3100
AR Path="/5F1BF5B0" Ref="R3"  Part="1" 
AR Path="/60D4580B/5F1BF5B0" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F1BF5B0" Ref="R?"  Part="1" 
F 0 "R3" H 2900 3050 50  0000 R CNN
F 1 "10" H 2900 3150 50  0000 R CNN
F 2 "myAmp:R_10MM" V 2880 3100 50  0001 C CNN
F 3 "" H 2950 3100 50  0001 C CNN
	1    2950 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2950 2850 2950 2900
Wire Wire Line
	2600 2900 2950 2900
Connection ~ 2950 2900
Wire Wire Line
	2950 2900 2950 2950
Wire Wire Line
	2950 3250 2950 3300
Wire Wire Line
	2950 2500 2950 2550
$Comp
L myAmp:1N4148 D1
U 1 1 5F1BF5BD
P 2600 2600
AR Path="/5F1BF5BD" Ref="D1"  Part="1" 
AR Path="/60D4580B/5F1BF5BD" Ref="D?"  Part="1" 
AR Path="/5F048FD6/5F1BF5BD" Ref="D?"  Part="1" 
F 0 "D1" V 2650 2750 50  0000 R CNN
F 1 "1N4148" V 2550 2950 50  0000 R CNN
F 2 "myAmp:DO35" H 2600 2600 50  0001 C CNN
F 3 "" H 2600 2600 50  0001 C CNN
	1    2600 2600
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:1N4148 D2
U 1 1 5F1BF5C3
P 2600 3200
AR Path="/5F1BF5C3" Ref="D2"  Part="1" 
AR Path="/60D4580B/5F1BF5C3" Ref="D?"  Part="1" 
AR Path="/5F048FD6/5F1BF5C3" Ref="D?"  Part="1" 
F 0 "D2" V 2650 3350 50  0000 R CNN
F 1 "1N4148" V 2550 3550 50  0000 R CNN
F 2 "myAmp:DO35" H 2600 3200 50  0001 C CNN
F 3 "" H 2600 3200 50  0001 C CNN
	1    2600 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 2750 2600 2900
Wire Wire Line
	2600 2900 2600 3050
Connection ~ 2600 2900
Wire Wire Line
	2150 2900 2600 2900
$Comp
L myAmp:R R6
U 1 1 5F1BF5CD
P 2600 3700
AR Path="/5F1BF5CD" Ref="R6"  Part="1" 
AR Path="/60D4580B/5F1BF5CD" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F1BF5CD" Ref="R?"  Part="1" 
F 0 "R6" H 2800 3650 50  0000 R CNN
F 1 "4K7" H 2800 3750 50  0000 R CNN
F 2 "myAmp:R_10MM" V 2530 3700 50  0001 C CNN
F 3 "" H 2600 3700 50  0001 C CNN
	1    2600 3700
	-1   0    0    1   
$EndComp
$Comp
L myAmp:R R1
U 1 1 5F1BF5D3
P 2600 2100
AR Path="/5F1BF5D3" Ref="R1"  Part="1" 
AR Path="/60D4580B/5F1BF5D3" Ref="R?"  Part="1" 
AR Path="/5F048FD6/5F1BF5D3" Ref="R?"  Part="1" 
F 0 "R1" H 2650 2050 50  0000 L CNN
F 1 "4K7" H 2800 2150 50  0000 R CNN
F 2 "myAmp:R_10MM" V 2530 2100 50  0001 C CNN
F 3 "" H 2600 2100 50  0001 C CNN
	1    2600 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 2250 2600 2300
Wire Wire Line
	2650 2300 2600 2300
Connection ~ 2600 2300
Wire Wire Line
	2600 2300 2600 2450
Wire Wire Line
	2600 3350 2600 3500
Wire Wire Line
	2650 3500 2600 3500
Connection ~ 2600 3500
Wire Wire Line
	2600 3500 2600 3550
$Comp
L myAmp:CPOL C1
U 1 1 5F1BF5E1
P 2150 2350
AR Path="/5F1BF5E1" Ref="C1"  Part="1" 
AR Path="/60D4580B/5F1BF5E1" Ref="C?"  Part="1" 
AR Path="/5F048FD6/5F1BF5E1" Ref="C?"  Part="1" 
F 0 "C1" H 2200 2450 50  0000 L CNN
F 1 "100μF" H 2200 2250 50  0000 L CNN
F 2 "myAmp:CPOL_D6.3_P2.5" H 2150 2350 50  0001 C CNN
F 3 "" H 2150 2350 50  0001 C CNN
	1    2150 2350
	-1   0    0    -1  
$EndComp
$Comp
L myAmp:CPOL C3
U 1 1 61B3CFDE
P 2150 3450
AR Path="/61B3CFDE" Ref="C3"  Part="1" 
AR Path="/60D4580B/61B3CFDE" Ref="C?"  Part="1" 
AR Path="/5F048FD6/61B3CFDE" Ref="C?"  Part="1" 
F 0 "C3" H 2200 3550 50  0000 L CNN
F 1 "100μF" H 2200 3350 50  0000 L CNN
F 2 "myAmp:CPOL_D6.3_P2.5" H 2150 3450 50  0001 C CNN
F 3 "" H 2150 3450 50  0001 C CNN
	1    2150 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 61B3CFDF
P 2600 4000
AR Path="/61B3CFDF" Ref="#PWR07"  Part="1" 
AR Path="/60D4580B/61B3CFDF" Ref="#PWR?"  Part="1" 
AR Path="/5F048FD6/61B3CFDF" Ref="#PWR?"  Part="1" 
F 0 "#PWR07" H 2600 3750 50  0001 C CNN
F 1 "GND" H 2605 3827 50  0000 C CNN
F 2 "" H 2600 4000 50  0001 C CNN
F 3 "" H 2600 4000 50  0001 C CNN
	1    2600 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3700 2950 3900
Wire Wire Line
	2950 3900 2600 3900
Wire Wire Line
	2150 3900 2150 3550
Wire Wire Line
	2150 3350 2150 2900
Connection ~ 2150 2900
Wire Wire Line
	2150 2450 2150 2900
Wire Wire Line
	2950 1900 2600 1900
Wire Wire Line
	2150 1900 2150 2250
Wire Wire Line
	2950 1900 2950 2100
Wire Wire Line
	2600 1950 2600 1900
Connection ~ 2600 1900
Wire Wire Line
	2600 1900 2150 1900
Wire Wire Line
	2600 3850 2600 3900
Connection ~ 2600 3900
Wire Wire Line
	2600 3900 2150 3900
Wire Wire Line
	2600 4000 2600 3900
$Comp
L power:+24V #PWR01
U 1 1 61B6D7B1
P 2600 1800
F 0 "#PWR01" H 2600 1650 50  0001 C CNN
F 1 "+24V" H 2615 1973 50  0000 C CNN
F 2 "" H 2600 1800 50  0001 C CNN
F 3 "" H 2600 1800 50  0001 C CNN
	1    2600 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1800 2600 1900
Wire Wire Line
	2950 2900 4900 2900
$Comp
L power:+24V #PWR02
U 1 1 61B76C57
P 1050 2350
F 0 "#PWR02" H 1050 2200 50  0001 C CNN
F 1 "+24V" H 1065 2523 50  0000 C CNN
F 2 "" H 1050 2350 50  0001 C CNN
F 3 "" H 1050 2350 50  0001 C CNN
	1    1050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2350 1050 2500
Connection ~ 1050 2500
$Comp
L myAmp:C C5
U 1 1 61B88D26
P 6950 3000
AR Path="/61B88D26" Ref="C5"  Part="1" 
AR Path="/5F048FD6/61B88D26" Ref="C?"  Part="1" 
F 0 "C5" V 7050 3100 50  0000 C CNN
F 1 "680nF" V 6800 3000 50  0000 C CNN
F 2 "myAmp:C_FILM_L7.2mm_W5.5mm_P5.00mm" H 6988 2850 50  0001 C CNN
F 3 "" H 6950 3000 50  0001 C CNN
	1    6950 3000
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:R R7
U 1 1 61B8CD59
P 7400 3000
AR Path="/61B8CD59" Ref="R7"  Part="1" 
AR Path="/60D4580B/61B8CD59" Ref="R?"  Part="1" 
AR Path="/5F048FD6/61B8CD59" Ref="R?"  Part="1" 
F 0 "R7" V 7300 3050 50  0000 R CNN
F 1 "1k" V 7500 3100 50  0000 R CNN
F 2 "myAmp:R_10MM" V 7330 3000 50  0001 C CNN
F 3 "" H 7400 3000 50  0001 C CNN
	1    7400 3000
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:R R8
U 1 1 61B8D96D
P 7150 3350
AR Path="/61B8D96D" Ref="R8"  Part="1" 
AR Path="/60D4580B/61B8D96D" Ref="R?"  Part="1" 
AR Path="/5F048FD6/61B8D96D" Ref="R?"  Part="1" 
F 0 "R8" H 7350 3400 50  0000 R CNN
F 1 "470k" H 7400 3300 50  0000 R CNN
F 2 "myAmp:R_10MM" V 7080 3350 50  0001 C CNN
F 3 "" H 7150 3350 50  0001 C CNN
	1    7150 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3000 6550 3000
Wire Wire Line
	7050 3000 7150 3000
Wire Wire Line
	7150 3000 7150 3200
Connection ~ 7150 3000
Wire Wire Line
	7150 3000 7250 3000
$Comp
L power:GND #PWR010
U 1 1 61B945A1
P 7150 4700
AR Path="/61B945A1" Ref="#PWR010"  Part="1" 
AR Path="/5F048FD6/61B945A1" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 7150 4450 50  0001 C CNN
F 1 "GND" H 7155 4527 50  0000 C CNN
F 2 "" H 7150 4700 50  0001 C CNN
F 3 "" H 7150 4700 50  0001 C CNN
	1    7150 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3500 7150 4550
$Comp
L myAmp:1N4148 D3
U 1 1 61B971C0
P 7900 3250
AR Path="/61B971C0" Ref="D3"  Part="1" 
AR Path="/60D4580B/61B971C0" Ref="D?"  Part="1" 
AR Path="/5F048FD6/61B971C0" Ref="D?"  Part="1" 
F 0 "D3" V 7950 3400 50  0000 R CNN
F 1 "1N4148" V 7850 3600 50  0000 R CNN
F 2 "myAmp:DO35" H 7900 3250 50  0001 C CNN
F 3 "" H 7900 3250 50  0001 C CNN
	1    7900 3250
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:1N4148 D5
U 1 1 61B9787A
P 7900 3600
AR Path="/61B9787A" Ref="D5"  Part="1" 
AR Path="/60D4580B/61B9787A" Ref="D?"  Part="1" 
AR Path="/5F048FD6/61B9787A" Ref="D?"  Part="1" 
F 0 "D5" V 7950 3750 50  0000 R CNN
F 1 "1N4148" V 7850 3950 50  0000 R CNN
F 2 "myAmp:DO35" H 7900 3600 50  0001 C CNN
F 3 "" H 7900 3600 50  0001 C CNN
	1    7900 3600
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:1N4148 D7
U 1 1 61B97B35
P 7900 3950
AR Path="/61B97B35" Ref="D7"  Part="1" 
AR Path="/60D4580B/61B97B35" Ref="D?"  Part="1" 
AR Path="/5F048FD6/61B97B35" Ref="D?"  Part="1" 
F 0 "D7" V 7950 4100 50  0000 R CNN
F 1 "1N4148" V 7850 4300 50  0000 R CNN
F 2 "myAmp:DO35" H 7900 3950 50  0001 C CNN
F 3 "" H 7900 3950 50  0001 C CNN
	1    7900 3950
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:1N4148 D9
U 1 1 61B97FF0
P 7900 4300
AR Path="/61B97FF0" Ref="D9"  Part="1" 
AR Path="/60D4580B/61B97FF0" Ref="D?"  Part="1" 
AR Path="/5F048FD6/61B97FF0" Ref="D?"  Part="1" 
F 0 "D9" V 7950 4450 50  0000 R CNN
F 1 "1N4148" V 7850 4650 50  0000 R CNN
F 2 "myAmp:DO35" H 7900 4300 50  0001 C CNN
F 3 "" H 7900 4300 50  0001 C CNN
	1    7900 4300
	0    -1   -1   0   
$EndComp
$Comp
L myAmp:1N4148 D10
U 1 1 61B9E69A
P 8200 4300
AR Path="/61B9E69A" Ref="D10"  Part="1" 
AR Path="/60D4580B/61B9E69A" Ref="D?"  Part="1" 
AR Path="/5F048FD6/61B9E69A" Ref="D?"  Part="1" 
F 0 "D10" V 8250 4500 50  0000 R CNN
F 1 "1N4148" V 8150 4650 50  0000 R CNN
F 2 "myAmp:DO35" H 8200 4300 50  0001 C CNN
F 3 "" H 8200 4300 50  0001 C CNN
	1    8200 4300
	0    1    1    0   
$EndComp
$Comp
L myAmp:1N4148 D8
U 1 1 61B9E6A0
P 8200 3950
AR Path="/61B9E6A0" Ref="D8"  Part="1" 
AR Path="/60D4580B/61B9E6A0" Ref="D?"  Part="1" 
AR Path="/5F048FD6/61B9E6A0" Ref="D?"  Part="1" 
F 0 "D8" V 8250 4100 50  0000 R CNN
F 1 "1N4148" V 8150 4300 50  0000 R CNN
F 2 "myAmp:DO35" H 8200 3950 50  0001 C CNN
F 3 "" H 8200 3950 50  0001 C CNN
	1    8200 3950
	0    1    1    0   
$EndComp
$Comp
L myAmp:1N4148 D6
U 1 1 61B9E6A6
P 8200 3600
AR Path="/61B9E6A6" Ref="D6"  Part="1" 
AR Path="/60D4580B/61B9E6A6" Ref="D?"  Part="1" 
AR Path="/5F048FD6/61B9E6A6" Ref="D?"  Part="1" 
F 0 "D6" V 8250 3750 50  0000 R CNN
F 1 "1N4148" V 8150 3950 50  0000 R CNN
F 2 "myAmp:DO35" H 8200 3600 50  0001 C CNN
F 3 "" H 8200 3600 50  0001 C CNN
	1    8200 3600
	0    1    1    0   
$EndComp
$Comp
L myAmp:1N4148 D4
U 1 1 61B9E6AC
P 8200 3250
AR Path="/61B9E6AC" Ref="D4"  Part="1" 
AR Path="/60D4580B/61B9E6AC" Ref="D?"  Part="1" 
AR Path="/5F048FD6/61B9E6AC" Ref="D?"  Part="1" 
F 0 "D4" V 8250 3400 50  0000 R CNN
F 1 "1N4148" V 8150 3600 50  0000 R CNN
F 2 "myAmp:DO35" H 8200 3250 50  0001 C CNN
F 3 "" H 8200 3250 50  0001 C CNN
	1    8200 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	7550 3000 7900 3000
Wire Wire Line
	7900 3000 7900 3100
Wire Wire Line
	7900 3000 8200 3000
Wire Wire Line
	8200 3000 8200 3100
Connection ~ 7900 3000
Wire Wire Line
	7900 3400 7900 3450
Wire Wire Line
	8200 3400 8200 3450
Wire Wire Line
	8200 3750 8200 3800
Wire Wire Line
	7900 3750 7900 3800
Wire Wire Line
	7900 4100 7900 4150
Wire Wire Line
	8200 4100 8200 4150
Wire Wire Line
	7900 4450 7900 4550
Wire Wire Line
	7900 4550 8200 4550
Wire Wire Line
	8200 4550 8200 4450
Wire Wire Line
	7900 4550 7150 4550
Connection ~ 7900 4550
Connection ~ 7150 4550
Wire Wire Line
	7150 4550 7150 4700
Wire Wire Line
	8200 3000 8700 3000
Wire Wire Line
	8700 3000 8700 3200
Connection ~ 8200 3000
Connection ~ 8700 3000
Text Label 4300 3450 0    50   ~ 0
in
Text Label 9050 3000 0    50   ~ 0
out
Text Label 3650 2900 0    50   ~ 0
VGND
$EndSCHEMATC
