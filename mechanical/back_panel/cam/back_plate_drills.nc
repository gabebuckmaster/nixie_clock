%
(back_plate_drills)
(Peck drills from 1mm above to 1mm below 1.6mm material. Coordinate system in center of piece.)
(T2  D=2.38 CR=0 TAPER=118deg - ZMIN=-4.315 - drill)
G90
G17
G21
G28 G91 Z0
G90

(Drill2)
T2 M6
S10000 M3
G54
M7
G0 X51 Y-18
Z20
Z10
Z5
G1 Z-4.315 F500
G0 Z10
Y18
Z5
G1 Z-4.315 F500
G0 Z10
X0
Z5
G1 Z-4.315 F500
G0 Z10
Y-18
Z5
G1 Z-4.315 F500
G0 Z10
X-51
Z5
G1 Z-4.315 F500
G0 Z10
Y18
Z5
G1 Z-4.315 F500
G0 Z10
Z20
M9
G28 G91 Z0
G90
G28 G91 X0 Y0
G90
M30
%
