set people;
set tracks;
param like{tracks, people};

var play{tracks} binary;

s.t. No3UnlikedSongs{p in people}:
	sum{t in tracks: like[t,p]==0} play[t] <= 2;

maximize tracklist:
	sum{t in tracks} play[t];

solve;
printf "\n\n";
printf "tracklist: \n";
for{t in tracks: play[t]==1}
	printf "- %s\n", t;
printf "\n people: \n";
for{p in people}
	printf "- %s (%d)\n", p,  sum{t in tracks: like[t,p]==0} play[t];

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

end;