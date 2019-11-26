var xtm>=0;
var xtsz>=0;
var xtp>=0;
var xtt>=0;
var xpm>=0;
var xpsz>=0;
var xpp>=0;
var xpt>=0;
var xim>=0;
var xisz>=0;
var xip>=0;
var xit>=0;
var xbm>=0;
var xbsz>=0;
var xbp>=0;
var xbt>=0;

s.t. matek:
	xtm+xpm+xim+xbm>=519;
s.t. szgm:
	xtsz+xpsz+xisz+xbsz>=129;
s.t. prog:
	xtp+xpp+xip+xbp>=40;
s.t. tesi:
	xtt+xpt+xit+xbt>=11.5;
minimize koltseg:
	500*xtm+20*xtsz+30*xtp+0*xtt+10*xpm+100*xpsz+1*xpp+2.5*xpt+1*xim+2*xisz+3*xip+4*xpt+5*xbm+6*xbsz+7*xbp+8*xbt;

end;