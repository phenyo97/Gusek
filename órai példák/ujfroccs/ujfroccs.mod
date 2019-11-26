set FF;

param ar {FF};
param szoda {FF};
param bor {FF};
param arany {FF};

var xf {FF} >=0;
s.t. SzodaHaszn{szf in FF}:
	sum{f in FF} xf[szf]  <= szoda[FF];
s.t. BorHaszn {bf in FF}:
	sum{f in FF} xf[bf] <= bor[FF];
maximize bevetel:
	sum{f in FF}xf*ar;

data 
	set FF: HL KF NF HM;
	param szoda:=150;
	param bor:=100;
	param ar:=
		HL 230
		KF 200
		NF 330
		HM 500
		;
	param arany:=
		szoda	bor:=
	HL	2	1
	KF	1	1
	NF	1	2
	HM	2	3
	;

end;
