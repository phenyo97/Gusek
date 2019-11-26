var xHL >=0;
var xKF >=0;
var xNF >=0;
var xHM >=0;
var xVH >=0;
var xSF >=0;
var xKRF >=0;
var xSHF >=0;
var xPF >=0;
s.t. SzodaKapacitas:
	2*xHL + xKF + xNF + 2*xHM + 3*xVH + 4*xSF + xKRF + 9*xSHF + 3*xPF <= 1500;
s.t. BorKapacitas:
	xHL + xKF + 2*xNF + 3*xHM + 2*xVH + xSF + 9*xKRF + xSHF + 6*xPF <= 1000;
maximize TeljesBevetel:
	230*xHL + 200*xKF + 330*xNF + 500*xHM + 400*xVH + 280*xSF + 1800*xKRF + 300*xSHF + 900*xPF;

end;