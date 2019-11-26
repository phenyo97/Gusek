var xK >=0;
var xS >=0;
var xV >=0;
s.t. GyorbeKolts:
	40*xK + 85*xS + 80*xV = 205*280;
s.t. SzombathelyKolts:
	160*xK + 50*xS + 150*xV = 360*120;
minimize Koltseg:
	50*xK + 150*xS + 200*xV;