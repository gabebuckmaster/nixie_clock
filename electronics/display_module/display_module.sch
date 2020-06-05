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
Text Label 900  1300 0    60   ~ 0
+180V
Text Label 3400 2600 0    60   ~ 0
T2_7
Text Label 3400 2700 0    60   ~ 0
T2_8
Text Label 3400 2800 0    60   ~ 0
T2_9
Text Label 3400 1900 0    60   ~ 0
T2_0
Text Label 3400 2100 0    60   ~ 0
T2_2
Text Label 3400 2000 0    60   ~ 0
T2_1
Text Label 3400 2200 0    60   ~ 0
T2_3
Text Label 3400 2500 0    60   ~ 0
T2_6
Text Label 3400 2400 0    60   ~ 0
T2_5
Text Label 3400 2300 0    60   ~ 0
T2_4
Text Label 6250 2400 0    60   ~ 0
T3_5
Text Label 6250 2300 0    60   ~ 0
T3_4
Text Label 6250 1900 0    60   ~ 0
T3_0
Text Label 6250 2000 0    60   ~ 0
T3_1
Text Label 6250 2100 0    60   ~ 0
T3_2
Text Label 6250 2200 0    60   ~ 0
T3_3
Text Label 8650 2500 0    60   ~ 0
T4_6
Text Label 8650 2600 0    60   ~ 0
T4_7
Text Label 8650 2700 0    60   ~ 0
T4_8
Text Label 8650 2400 0    60   ~ 0
T4_5
Text Label 8650 2300 0    60   ~ 0
T4_4
Text Label 8650 2800 0    60   ~ 0
T4_9
Text Label 8650 2200 0    60   ~ 0
T4_3
Text Label 8650 2100 0    60   ~ 0
T4_2
Text Label 8650 2000 0    60   ~ 0
T4_1
Text Label 8650 1900 0    60   ~ 0
T4_0
Text Notes 8150 5250 0    60   ~ 0
Digit Current: 1.25mA\nComma Current: 0.15mA\nThe tubes are pretty bright under these conditions,\nso we’ll target 1.25mA and 0.15mA\n\n(180V-130V)/40kOhm = 1.25mA\n(180V-130V)/333kOhm = 0.15mA\n\n.00125*.00125*40k = 62.5 mW
$Comp
L Device:R_US R4
U 1 1 58EB1E65
P 4700 1550
F 0 "R4" H 4800 1650 50  0000 C CNN
F 1 "40.2k" H 4850 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4630 1550 50  0001 C CNN
F 3 "" H 4700 1550 50  0000 C CNN
	1    4700 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R11
U 1 1 58EB1FB3
P 9950 1550
F 0 "R11" H 10100 1650 50  0000 C CNN
F 1 "40.2k" H 10100 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9880 1550 50  0001 C CNN
F 3 "" H 9950 1550 50  0000 C CNN
	1    9950 1550
	1    0    0    -1  
$EndComp
Text Label 4700 2250 1    60   ~ 0
T2_AN
Text Label 9950 2200 1    60   ~ 0
T4_AN
Text Label 1300 2000 0    60   ~ 0
T1_1
Text Label 1300 2100 0    60   ~ 0
T1_2
Text Label 1300 1900 0    60   ~ 0
T1_0
Text Label 1300 2900 0    60   ~ 0
T1_COMMA
Text Label 6250 2900 0    60   ~ 0
T3_COMMA
$Comp
L display_module-rescue:IN12B DISP1
U 1 1 58F9A58D
P 2700 2300
F 0 "DISP1" H 2700 2850 45  0000 L BNN
F 1 "IN12B" H 2700 2775 45  0000 L BNN
F 2 "display_module:IN-12B_nosocket" H 2730 2450 20  0001 C CNN
F 3 "" H 2700 2300 60  0001 C CNN
	1    2700 2300
	1    0    0    -1  
$EndComp
$Comp
L display_module-rescue:IN12B DISP2
U 1 1 58F9A5EA
P 4200 2300
F 0 "DISP2" H 4200 2850 45  0000 L BNN
F 1 "IN12B" H 4200 2775 45  0000 L BNN
F 2 "display_module:IN-12B_nosocket" H 4230 2450 20  0001 C CNN
F 3 "" H 4200 2300 60  0001 C CNN
	1    4200 2300
	1    0    0    -1  
$EndComp
$Comp
L display_module-rescue:IN12B DISP3
U 1 1 58F9A653
P 7700 2300
F 0 "DISP3" H 7700 2850 45  0000 L BNN
F 1 "IN12B" H 7700 2775 45  0000 L BNN
F 2 "display_module:IN-12B_nosocket" H 7730 2450 20  0001 C CNN
F 3 "" H 7700 2300 60  0001 C CNN
	1    7700 2300
	1    0    0    -1  
$EndComp
$Comp
L display_module-rescue:IN12B DISP4
U 1 1 58F9A6A9
P 9450 2300
F 0 "DISP4" H 9450 2850 45  0000 L BNN
F 1 "IN12B" H 9450 2775 45  0000 L BNN
F 2 "display_module:IN-12B_nosocket" H 9480 2450 20  0001 C CNN
F 3 "" H 9450 2300 60  0001 C CNN
	1    9450 2300
	1    0    0    -1  
$EndComp
$Comp
L display_module-rescue:C C1
U 1 1 5904E507
P 1600 6200
F 0 "C1" H 1625 6300 50  0000 L CNN
F 1 "1u" H 1625 6100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1638 6050 50  0001 C CNN
F 3 "" H 1600 6200 50  0000 C CNN
	1    1600 6200
	1    0    0    -1  
$EndComp
$Comp
L display_module-rescue:GND #PWR01
U 1 1 5904E6E9
P 2100 6150
F 0 "#PWR01" H 2100 5900 50  0001 C CNN
F 1 "GND" H 2100 6000 50  0000 C CNN
F 2 "" H 2100 6150 50  0000 C CNN
F 3 "" H 2100 6150 50  0000 C CNN
	1    2100 6150
	1    0    0    -1  
$EndComp
Text Label 1850 6000 0    60   ~ 0
+12V
Text Label 6350 5350 0    60   ~ 0
CLK
Text Label 6350 5150 0    60   ~ 0
DATA_IN
Text Label 6400 4850 0    60   ~ 0
+180V
$Comp
L display_module-rescue:GND #PWR02
U 1 1 5904F638
P 1600 6350
F 0 "#PWR02" H 1600 6100 50  0001 C CNN
F 1 "GND" H 1600 6200 50  0000 C CNN
F 2 "" H 1600 6350 50  0000 C CNN
F 3 "" H 1600 6350 50  0000 C CNN
	1    1600 6350
	1    0    0    -1  
$EndComp
Text Label 1850 4800 0    60   ~ 0
CLK
NoConn ~ 2400 2200
NoConn ~ 2400 2300
NoConn ~ 2400 2400
NoConn ~ 2400 2500
NoConn ~ 2400 2600
NoConn ~ 2400 2700
NoConn ~ 2400 2800
NoConn ~ 3900 2900
NoConn ~ 7400 2600
NoConn ~ 7400 2700
NoConn ~ 7400 2800
NoConn ~ 9150 2900
Text Label 4000 3900 2    60   ~ 0
T3_5
Text Label 4000 4000 2    60   ~ 0
T3_4
Text Label 4000 4100 2    60   ~ 0
T4_0
Text Label 4000 4300 2    60   ~ 0
T4_8
Text Label 4000 4400 2    60   ~ 0
T4_7
Text Label 4000 4500 2    60   ~ 0
T3_3
Text Label 4000 4600 2    60   ~ 0
T4_6
Text Label 4000 4800 2    60   ~ 0
T4_4
Text Label 4000 4700 2    60   ~ 0
T4_5
Text Label 4000 4900 2    60   ~ 0
T3_2
Text Label 4000 5000 2    60   ~ 0
T3_1
Text Label 4000 4200 2    60   ~ 0
T4_9
Text Label 4000 5200 2    60   ~ 0
T3_0
Text Label 4000 5400 2    60   ~ 0
T4_2
Text Label 4000 5500 2    60   ~ 0
T4_1
Text Label 4000 6200 2    60   ~ 0
T2_0
Text Label 4000 6400 2    60   ~ 0
T2_2
Text Label 4000 5900 2    60   ~ 0
T1_0
Text Label 4000 6500 2    60   ~ 0
T2_3
Text Label 4000 6100 2    60   ~ 0
T2_1
Text Label 4000 6300 2    60   ~ 0
T2_9
Text Label 4000 5700 2    60   ~ 0
T1_COMMA
Text Label 4000 5800 2    60   ~ 0
T1_1
Text Label 4000 6000 2    60   ~ 0
T1_2
Text Label 4000 6600 2    60   ~ 0
T2_8
Text Label 4000 6700 2    60   ~ 0
T2_7
Text Label 4000 6800 2    60   ~ 0
T2_6
Text Label 4000 6900 2    60   ~ 0
T2_5
Text Label 4000 7000 2    60   ~ 0
T2_4
Text Label 4000 5100 2    60   ~ 0
T3_COMMA
Text Label 4000 5300 2    60   ~ 0
T4_3
NoConn ~ 7400 2500
$Comp
L display_module-rescue:HV5122 U1
U 1 1 5949B05E
P 2850 4900
F 0 "U1" H 2850 6050 60  0000 C CNN
F 1 "HV5122" H 2850 6150 60  0000 C CNN
F 2 "display_module:PQFP-44_10x10mm_Pitch0.8mm" H 2850 4900 60  0001 C CNN
F 3 "" H 2850 4900 60  0001 C CNN
	1    2850 4900
	1    0    0    -1  
$EndComp
Text Label 1750 4900 0    60   ~ 0
DATA_IN
Text Label 1850 4600 0    60   ~ 0
+12V
NoConn ~ 2150 5000
NoConn ~ 2150 6600
NoConn ~ 2150 6700
NoConn ~ 2150 6800
NoConn ~ 2150 6900
NoConn ~ 2150 7000
$Comp
L Device:R_US R1
U 1 1 5949E9D7
P 2250 1900
F 0 "R1" V 2200 1750 50  0000 C CNN
F 1 "40.2k" V 2200 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 1900 50  0001 C CNN
F 3 "" H 2250 1900 50  0000 C CNN
	1    2250 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R2
U 1 1 5949EA89
P 1950 2000
F 0 "R2" V 1900 1850 50  0000 C CNN
F 1 "40.2k" V 1900 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1880 2000 50  0001 C CNN
F 3 "" H 1950 2000 50  0000 C CNN
	1    1950 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R3
U 1 1 5949EAFA
P 2250 2100
F 0 "R3" V 2200 1950 50  0000 C CNN
F 1 "40.2k" V 2200 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 2100 50  0001 C CNN
F 3 "" H 2250 2100 50  0000 C CNN
	1    2250 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R12
U 1 1 5949EC76
P 2250 2900
F 0 "R12" V 2300 2750 50  0000 C CNN
F 1 "332k" V 2300 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 2900 50  0001 C CNN
F 3 "" H 2250 2900 50  0000 C CNN
	1    2250 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R5
U 1 1 5949EEB8
P 7250 1900
F 0 "R5" V 7200 1700 50  0000 C CNN
F 1 "40.2k" V 7200 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7180 1900 50  0001 C CNN
F 3 "" H 7250 1900 50  0000 C CNN
	1    7250 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R6
U 1 1 5949EF95
P 6900 2000
F 0 "R6" V 6850 1800 50  0000 C CNN
F 1 "40.2k" V 6850 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6830 2000 50  0001 C CNN
F 3 "" H 6900 2000 50  0000 C CNN
	1    6900 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R7
U 1 1 5949EFDD
P 7250 2100
F 0 "R7" V 7200 1950 50  0000 C CNN
F 1 "40.2k" V 7200 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7180 2100 50  0001 C CNN
F 3 "" H 7250 2100 50  0000 C CNN
	1    7250 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R8
U 1 1 5949F029
P 6900 2200
F 0 "R8" V 6850 2050 50  0000 C CNN
F 1 "40.2k" V 6850 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6830 2200 50  0001 C CNN
F 3 "" H 6900 2200 50  0000 C CNN
	1    6900 2200
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R9
U 1 1 5949F078
P 7250 2300
F 0 "R9" V 7200 2150 50  0000 C CNN
F 1 "40.2k" V 7200 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7180 2300 50  0001 C CNN
F 3 "" H 7250 2300 50  0000 C CNN
	1    7250 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R10
U 1 1 5949F0CB
P 6900 2400
F 0 "R10" V 6850 2200 50  0000 C CNN
F 1 "40.2k" V 6850 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6830 2400 50  0001 C CNN
F 3 "" H 6900 2400 50  0000 C CNN
	1    6900 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R13
U 1 1 5949F11F
P 7250 2900
F 0 "R13" V 7300 2750 50  0000 C CNN
F 1 "332k" V 7300 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7180 2900 50  0001 C CNN
F 3 "" H 7250 2900 50  0000 C CNN
	1    7250 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 1900 3400 1900
Wire Wire Line
	6250 1900 7100 1900
Wire Wire Line
	9150 1900 8650 1900
Wire Wire Line
	9150 2800 8650 2800
Wire Wire Line
	8650 2700 9150 2700
Wire Wire Line
	9150 2600 8650 2600
Wire Wire Line
	8650 2500 9150 2500
Wire Wire Line
	9150 2400 8650 2400
Wire Wire Line
	8650 2300 9150 2300
Wire Wire Line
	9150 2200 8650 2200
Wire Wire Line
	8650 2100 9150 2100
Wire Wire Line
	9150 2000 8650 2000
Wire Wire Line
	6750 2000 6250 2000
Wire Wire Line
	6250 2100 7100 2100
Wire Wire Line
	6750 2200 6250 2200
Wire Wire Line
	6250 2300 7100 2300
Wire Wire Line
	6750 2400 6250 2400
Wire Wire Line
	3400 2000 3900 2000
Wire Wire Line
	3900 2100 3400 2100
Wire Wire Line
	3400 2200 3900 2200
Wire Wire Line
	3900 2300 3400 2300
Wire Wire Line
	3400 2400 3900 2400
Wire Wire Line
	3900 2500 3400 2500
Wire Wire Line
	3400 2600 3900 2600
Wire Wire Line
	3400 2700 3900 2700
Wire Wire Line
	3900 2800 3400 2800
Wire Wire Line
	3200 1300 3200 2300
Wire Wire Line
	4700 1700 4700 2300
Connection ~ 3200 1300
Wire Wire Line
	4700 1300 4700 1400
Connection ~ 4700 1300
Wire Wire Line
	8200 1300 8200 2300
Connection ~ 8200 1300
Wire Wire Line
	9950 1300 9950 1400
Wire Wire Line
	9950 1700 9950 2300
Wire Wire Line
	900  1300 3200 1300
Wire Wire Line
	1800 2000 1300 2000
Wire Wire Line
	1300 1900 2100 1900
Wire Wire Line
	1300 2100 2100 2100
Wire Wire Line
	1300 2900 2100 2900
Wire Wire Line
	6250 2900 7100 2900
Wire Wire Line
	1600 6000 2150 6000
Wire Wire Line
	6700 5450 6350 5450
Wire Wire Line
	6700 5350 6350 5350
Wire Wire Line
	6700 5150 6350 5150
Wire Wire Line
	6700 4850 6400 4850
Wire Wire Line
	1600 6050 1600 6000
Wire Wire Line
	3550 3900 4000 3900
Wire Wire Line
	3550 4000 4000 4000
Wire Wire Line
	3550 4100 4000 4100
Wire Wire Line
	3550 4300 4000 4300
Wire Wire Line
	3550 4400 4000 4400
Wire Wire Line
	3550 4500 4000 4500
Wire Wire Line
	3550 4600 4000 4600
Wire Wire Line
	3550 4800 4000 4800
Wire Wire Line
	3550 4700 4000 4700
Wire Wire Line
	3550 4900 4000 4900
Wire Wire Line
	3550 5000 4000 5000
Wire Wire Line
	3550 4200 4000 4200
Wire Wire Line
	3550 5200 4000 5200
Wire Wire Line
	3550 5400 4000 5400
Wire Wire Line
	3550 5500 4000 5500
Wire Wire Line
	3550 6200 4000 6200
Wire Wire Line
	3550 6400 4000 6400
Wire Wire Line
	3550 5900 4000 5900
Wire Wire Line
	3550 6500 4000 6500
Wire Wire Line
	3550 6100 4000 6100
Wire Wire Line
	3550 6300 4000 6300
Wire Wire Line
	3550 5700 4000 5700
Wire Wire Line
	3550 5800 4000 5800
Wire Wire Line
	3550 6000 4000 6000
Wire Wire Line
	3550 6600 4000 6600
Wire Wire Line
	3550 6700 4000 6700
Wire Wire Line
	3550 6800 4000 6800
Wire Wire Line
	3550 6900 4000 6900
Wire Wire Line
	3550 7000 4000 7000
Wire Wire Line
	3550 5100 4000 5100
Wire Wire Line
	3550 5300 4000 5300
Wire Wire Line
	2150 6100 2100 6100
Wire Wire Line
	2100 6100 2100 6150
Wire Wire Line
	1850 4800 2150 4800
Wire Wire Line
	2150 4900 1750 4900
Wire Wire Line
	2150 4600 2100 4600
Wire Wire Line
	2400 2000 2100 2000
Wire Wire Line
	7050 2400 7400 2400
Wire Wire Line
	7050 2200 7400 2200
Wire Wire Line
	7050 2000 7400 2000
$Comp
L display_module-rescue:GND #PWR03
U 1 1 594A026B
P 6250 5300
F 0 "#PWR03" H 6250 5050 50  0001 C CNN
F 1 "GND" H 6250 5150 50  0000 C CNN
F 2 "" H 6250 5300 50  0000 C CNN
F 3 "" H 6250 5300 50  0000 C CNN
	1    6250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 5250 6250 5250
Wire Wire Line
	6250 5250 6250 5300
NoConn ~ 3550 5600
Wire Wire Line
	3200 1300 4700 1300
Wire Wire Line
	4700 1300 8200 1300
Wire Wire Line
	8200 1300 9950 1300
Wire Wire Line
	2150 4700 2100 4700
Wire Wire Line
	2100 4700 2100 4600
Connection ~ 2100 4600
Wire Wire Line
	2100 4600 1850 4600
$Comp
L display_module-rescue:GND #PWR0101
U 1 1 5ECE8FAB
P 6300 4700
F 0 "#PWR0101" H 6300 4450 50  0001 C CNN
F 1 "GND" H 6300 4550 50  0000 C CNN
F 2 "" H 6300 4700 50  0000 C CNN
F 3 "" H 6300 4700 50  0000 C CNN
	1    6300 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4650 6300 4650
Wire Wire Line
	6300 4650 6300 4700
NoConn ~ 6700 4750
Text Label 6350 5450 0    50   ~ 0
+12V
$Comp
L Mechanical:MountingHole H1
U 1 1 5ECF299A
P 8350 5650
F 0 "H1" H 8450 5696 50  0000 L CNN
F 1 "MountingHole" H 8450 5605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 8350 5650 50  0001 C CNN
F 3 "~" H 8350 5650 50  0001 C CNN
	1    8350 5650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5ECF2D0F
P 9100 5650
F 0 "H2" H 9200 5696 50  0000 L CNN
F 1 "MountingHole" H 9200 5605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 9100 5650 50  0001 C CNN
F 3 "~" H 9100 5650 50  0001 C CNN
	1    9100 5650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5ECF339E
P 8350 5900
F 0 "H3" H 8450 5946 50  0000 L CNN
F 1 "MountingHole" H 8450 5855 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 8350 5900 50  0001 C CNN
F 3 "~" H 8350 5900 50  0001 C CNN
	1    8350 5900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5ECF3C37
P 9100 5900
F 0 "H4" H 9200 5946 50  0000 L CNN
F 1 "MountingHole" H 9200 5855 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 9100 5900 50  0001 C CNN
F 3 "~" H 9100 5900 50  0001 C CNN
	1    9100 5900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5ECFC03B
P 6900 4750
F 0 "J1" H 6980 4792 50  0000 L CNN
F 1 "Conn_01x03" H 6980 4701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6900 4750 50  0001 C CNN
F 3 "~" H 6900 4750 50  0001 C CNN
	1    6900 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5ECFCC25
P 6900 5250
F 0 "J2" H 6980 5242 50  0000 L CNN
F 1 "Conn_01x04" H 6980 5151 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6900 5250 50  0001 C CNN
F 3 "~" H 6900 5250 50  0001 C CNN
	1    6900 5250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
