var rm binary;
var sz binary;
var v binary;
var mf binary;

s.t. dal:
	sz + v + mf >= 1;
s.t. met:
	rm + sz >= 1;
s.t. elu:
	rm + mf  >= 1;
s.t. liva: 
	rm + sz + v >= 1;
s.t. ie:
	sz + v + mf >= 1;
s.t. vir:
	v + mf >= 1;

minimize fesztivalokszam:
	rm + sz + v + mf;

end;