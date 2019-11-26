set people;
set tracks;
param like{tracks, people};
param trackcount;
set tracklist:= 1..trackcount;

var play{tracks,tracklist} binary;
var dance{people, tracklist} binary;
var drink{people, tracklist} binary;
var gone{people, tracklist} binary;


s.t. PlayExatlyOneSong {l in tracklist}:
	sum{t in tracks} play[t,l]=1;

s.t. ExactlyOneState{l in tracklist, p in people}:
	dance[p,l] + drink[p,l] + gone[p,l] = 1;

s.t. NoLikeNoDance {p in people, l in tracklist}:
	dance[p,l] <= 1 - sum{t in tracks: like[t,p]==0} play[t,l];

s.t. NoLikeTwoGone{p in people, l in tracklist: l != 1}:
	gone[p,l] >= -1 + sum{t in tracks: like[t,p]==0} play[t,l] + sum{t in tracks: like[t,p]==0} play[t,l - 1];

s.t. WhenGoneNoBack{p in people, l in tracklist: l !=1}:
	gone[p,l] >= gone[p,l-1];

s.t. WhenNoGoneButLike{p in people, l in tracklist}:
	dance[p,l] >= sum{t in tracks: like[t,p] == 1} play[t,l] - gone[p,l];

s.t. NoGoneFirst{p in people}:
	gone[p,1] = 0;
maximize BeerSell:
	sum{l in tracklist, p in people} drink[p,l];

solve;

printf "%20s"," ";
for {p in people}
     printf "\t%s", p;
printf "\n\n";
for{l in tracklist}{
     for{t in tracks: play[t,l] == 1}{
          printf "%2d. %16s", l, t;
     }
     for {p in people}{
          for {{0}:dance[p,l] == 1} printf "\tDance";
          for {{0}:drink[p,l] == 1} printf "\tDrink";
          for {{0}:gone[p,l] == 1} printf "\tGone";
     }
     printf "\n\n";
}

data;
set people:= andi guszti patrik tina mate;
set tracks:= freedom hell shipping its whisky summer love;
param like:
	andi	guszti	patrik	tina	mate:=
freedom	1	1	1	1	1
hell	1	0	1	0	1
shipping	1	0	0	1	0
its	0	1	1	1	0
whisky	0	0	0	0	1
summer	1	1	0	0	1
love	0	1	0	0	0
;
param trackcount := 5;

end;