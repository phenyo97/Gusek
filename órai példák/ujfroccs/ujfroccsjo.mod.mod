set BorFajta;
param SzArany{BorFajta};
param BArany{BorFajta};
param Ara{BorFajta};

var Keveres{BorFajta} >=0, integer;

#Ne legyen tobb szoda elhasználva mint amim van
s.t. SzodaKorlat:
	sum{b in BorFajta} Keveres[b]*SzArany[b]<=150;
s.t. BorKorlat:
	sum{b in BorFajta} Keveres[b]*BArany[b]<=100;

maximize Profit:
	sum{b in BorFajta} Keveres[b]*Ara[b];
solve;
printf"\n\n";
printf"A legjobb bor kombinacio: \n";
for{b in BorFajta: Keveres[b]>0}
	printf"%s-->%d\n",b, Keveres[b];
data;
set BorFajta:=HL KF NF HM;
	param Ara:=
		HL 230
		KF 200
		NF 330
		HM 500
		;
param SzArany:=
	HL	2
	KF	1
	NF	1
	HM	2
	;
	param BArany:=
	HL	1
	KF	1
	NF	2
	HM	3
	;

end;