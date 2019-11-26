param ndays;
set days := 1..ndays;
set cars;
param initialb;
param garage;
param price{cars, days};
param interest;
param garageprice;

var buy{cars,days} integer;
var budget{0..ndays} >= 0;
var caringarage{cars, 0..ndays} >= 0;
var loan{days};
var bankbal{0..ndays} <= 0, >= -200000;
var rentgarage{days} >= 0, integer;


s.t. InitBudget:
	budget[0]=initialb;

s.t. InitGarage{c in cars}:
	caringarage[c,0]=0;

s.t. InitBankBalance:
	bankbal[0]=0;

s.t. BalanceChange{d in days}:
	budget[d]=budget[d-1] - sum{c in cars} buy[c,d]*price[c,d] + loan[d] - rentgarage[d]*garageprice;

s.t. BankBalanceChange{d in days}:
	bankbal[d]=bankbal[d-1] * (1+interest) - loan[d];

s.t. NoLoansAtTheEnd:
	bankbal[ndays] = 0;

s.t. CarAvailability{d in days, c in cars}:
	caringarage[c,d] = caringarage[c,d-1] + buy[c,d];

s.t. GarageLimitCantBeMore{d in days}:
	sum{c in cars} caringarage[c,d] <= garage + rentgarage[d];

maximize MoneyEarned:
	budget[ndays];


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
	printf "\tBank Balance: %d\n", bankbal[d-1]*(1+interest);
	printf "\tLoan: %d\n", loan[d];
	printf "\tGarage rent: %d\n", rentgarage[d];
	printf "\tBudeget: %d\n", budget[d];
	printf "\tBank: %d\n", bankbal[d];
	printf "\n\n";
}


data;

param ndays := 5;
set cars := w l k t s;
param initialb := 200000;
param interest := 0.05;
param garageprice := 4000;
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