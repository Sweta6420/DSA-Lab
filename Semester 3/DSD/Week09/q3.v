module q3(a,b,c,e,f);
input a,b,c,e;
output f;
wire [0:3] y;
dec2to4 s0 ({a,b},e,y);
and (t1,c,y[1]);
and (t2,c,y[2]);
assign f = t1 | t2 | y[3];
endmodule

module dec2to4 (w,e,y);
input [1:0] w;
input e;
output reg [0:3] y;
always @(w or e)
	if (e==0) y=0;
	else 
		case (w)
		0: y=8;
		1: y=4;
		2: y=2;
		3: y=1;
		endcase
endmodule
