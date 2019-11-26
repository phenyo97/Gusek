set F;
set P;

param tm{F};
param vm{P};
param tav{F,P};
param ktg; 

var X {F,P} >= 0;
s.t. PiacIgeny {p in P}:
	sum{f in F} X [f,p] >= vm[p];
s.t. FarmKapac {y in F}:
	sum{p in P} X [y,p] <= tm[y];

minimize Osszkoltseg:
	ktg*sum{f in F, p in P}tav[f,p]*X[f,p];

data;
	set F:= V K S;
	set P:= GY SZ;
	param ktg:=1;
	param tm:=
		V 150
		K 50
		S 100
		;
	param vm:=
		GY 200
		SZ 100
		;
	param tav:
		GY	SZ:=
	V	80	160
	K	40	190
	S	120	40
	; 