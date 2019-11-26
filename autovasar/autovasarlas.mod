set days;
set cars;
param price{cars, days};

var buy{cars,days} binary;

s.t. OneCarEachDay{d in days}:
	sum{c in cars} buy[c,d] = 1;

s.t. EachCarOnce{c in cars}:
	sum{d in days} buy[c,d] = 1;

minimize TotalCost:
	sum{c in cars, d in days} buy[c,d]*price[c,d];

solve;
printf "\n\n";
for{c in cars, d in days: buy[c,d]==1}
	printf "%s:\t%2s - %10d\n",c,d,price[c,d];

printf "\n\n";


data;

set days := h k sz cs p;
set cars := w l k t s;
param price:
	h	k	sz	cs	p:=
w	60000	65000	61000	66000	60000
l	50000	55000	63000	60000	52000
k	30000	32000	33000	30000	27000
t	70000	65000	77000	85000	100000
s	65000	70000	75000	90000	70000
;

end;