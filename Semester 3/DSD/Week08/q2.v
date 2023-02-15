module q2(w,e,y);
input [3:0] w;
input e;
output [0:15] y;
dec3to8 s0 (w[2:0],e&(~w[3]),y[0:7]);
dec3to8 s1 (w[2:0],e&w[3],y[8:15]);
endmodule

module dec3to8(w,e,y);
input [2:0] w;
input e;
output reg [0:7] y;
integer k;
always @(w,e)
for (k=0; k<=7; k=k+1) 
	if ((w==k) && (e==1)) y[k]=1;
	else y[k]=0;
endmodule
