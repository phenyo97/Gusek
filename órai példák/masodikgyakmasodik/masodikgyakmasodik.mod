var xkgy >=0;
var xvgy >=0;
var xsgy >=0;
var xksz >=0;
var xvsz >=0;
var xssz >=0;
var fkgy >=0, int;
var fvgy >=0, int;
var fsgy >=0, int;
var fksz >=0, int;
var fvsz >=0, int;
var fssz >=0, int;
s.t. Komarom:
	xkgy+xksz<=100;
s.t. Veszprem:
	xvgy+xvsz<=200;
s.t. Sarvar:
	xsgy+xssz<=150;
s.t. Gyor:
	xkgy+xvgy+xsgy>=250;
s.t. Szombathely:
	xksz+xvsz+xssz>=150;

s.t.KomGyor:
	xkgy<=20*fkgy;
s.t.VeszGyor:
	xvgy<=20*fvgy;
s.t.SarGyor:
	xsgy<=20*fsgy;
s.t.KomSzom:
	xksz<=20*fksz;
s.t.VeszSzom:
	xvsz<=20*fvsz;
s.t.SarSzom:
	xssz<=20*fssz;

minimize Koltseg:
	40*xkgy+180*xksz+80*xvgy+120*xvsz+150*xsgy+40*xssz+fkgy*10*40*2+fvgy*10*80*2+fsgy*10*150*2+fksz*10*180*2+fvsz*10*120*2+fssz*10*40*2;

end;