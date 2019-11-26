set festival;
set band;
param zene{band, festival};

var goto{festival} binary;

s.t. MustSeeEach {b in band}:
	sum{f in festival} goto[f] * zene[b,f] >= 1;

minimize festivalsWeGo:
	sum {f in festival} goto[f];

solve;

printf "\n\n";
for {f in festival: goto[f]==1}
	printf "%s\n", f;
printf "\n\n";



data;
set festival := rm sz v mf f;
set band := d m e l i v im;
param zene:
	rm	sz	v	mf	f:=
d	0	1	1	1	1
m	1	1	0	0	1
e	1	0	0	1	0
l	1	1	1	0	1
i	0	1	1	1	1
v	0	0	1	1	0
im	1	1	0	1	1
;

end;
