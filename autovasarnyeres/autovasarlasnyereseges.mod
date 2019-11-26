param ndays;
set days := 1..ndays;
set cars;
param initialb;
param garage;
param price{cars, days};

var buy{cars,days} integer;

s.t. DontOverBuy{d in days}:
	initialb - sum{d2 in 1..d, c in cars} buy[c,d2] * price[c,d2] >= 0;
s.t. GarageLimitCantBeMore{d in days}:
	sum{d2 in 1..d, c in cars} buy[c,d2] <= garage;
s.t. DontSellScam{d in days, c in cars}:
	sum{d2 in 1..d} buy[c,d2] >= 0;

maximize MoneyEarned:
	initialb - sum{d in days, c in cars} buy[c,d] * price[c,d];


solve;

printf "\n\n";
for {d in days}{
	printf "Days %d\n", d;
	printf "\tSell: ";
	for {c in cars: buy[c,d] < 0}
		printf "%s(%d)", c, - buy[c,d];
		printf "\n";
	printf "\tBuys: ";
	for {c in cars: buy[c,d] > 0}
		printf "%s(%d)", c, buy[c,d];
			printf "\n";
	printf "\tBudeget: %d\n", initialb - sum{d2 in 1..d, c in cars} buy[c,d2] * price[c,d2];
	printf "\n\n";
}





data;

param ndays := 5;
set cars := w l k t s;
param initialb := 200000;
param garage := 4;
param price:
	1	2	3	4	5:=
w	60000	65000	61000	66000	60000
l	50000	55000	63000	60000	52000
k	30000	32000	33000	30000	27000
t	70000	65000	77000	85000	100000
s	65000	70000	75000	90000	70000
;

end;