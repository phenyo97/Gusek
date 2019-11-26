var xkgy >=0;
var xvgy >=0;
var xsgy >=0;
var xksz >=0;
var xvsz >=0;
var xssz >=0;
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

minimize Koltseg:
	40*xkgy+180*xksz+80*xvgy+120*xvsz+150*xsgy+40*xssz;

end;