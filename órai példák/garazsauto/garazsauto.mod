set cars;
param ndays;
set days := 1..ndays;
param price {cars, days};
param initbudget;

var buy{cars, days} integer;
var sell{cars, days} integer;

s.t. DontOverBuy{d in days}:
	initbudget - sum{n in 1..d} sum{c in cars} price[c,n]* buy[c,n] >=0;
s.t. DontSellScam {c in cars, d in days}:
	sum {n in 1..d} buy[c,n] >=0;
maximize EndMoney:
	initbudget-sum{d in days, c in cars} price[c,d]* buy[c,d];

solve;

for {d in days}
{
    printf "Day %2d:\n",d;
    printf "\tBUY:";
    for{c in cars : buy[c,d]!=0}
        printf " %s(%d)",c,buy[c,d];
    printf "\n";
    printf "\tSELL:";
    for{c in cars : sell[c,d]!=0}
        printf " %s(%d)",c,sell[c,d];
    printf "\n\t--------------------\n";
  /*  printf "\tGARAGE [%d/%d]:", sum{dd in 1..d, c in Cars} (buy[dd,c]-sell[dd,c]),garagecapacity;*/
    for{c in cars : sum{dd in 1..d} (buy[c,dd]-sell[c,dd])!= 0}
       printf " %s(%d)",c,sum{dd in 1..d} (buy[c,dd]-sell[c,dd]);
    printf "\n";
    printf "\tBUDGET: %d", initbudget+sum{dd in 1..d, c in cars} price[c,dd]*(sell[c,dd]-buy[c,dd]);
    printf "\n\n";    
}

data;

set cars:= audi subaru ford skoda honda;
param initbudget:= 30;
param ndays:= 5;
param price (tr):
	audi	subaru	ford	skoda	honda:=
1	10	8	9	15	10
2	11	9	9	8	11
3	9	10	9	13	10
4	7	11	9	9	11
5	8	12	9	10	10
;
