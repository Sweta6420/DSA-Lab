module q2(a,b,c,d,e,F,G,H);
input a,b,c,d,e;
output F,G,H;
wire [0:15] Y;
dec4to16 s0 ({a,b,c,d},e,Y);
assign F = Y[3] | Y[6] | Y[7] | Y[10] | Y[11] | Y[14];
assign G = Y[2] | Y[3] | Y[10] | Y[14];
assign H = Y[0] | Y[1] | Y[3] | Y[7] | Y[14] | Y[15];
endmodule

module dec4to16 (w,e,y);
input [3:0] w;
input e;
output [0:15] y;
wire [0:3] k;
dec2to4 s0 (w[3:2],e,k[0:3]);
dec2to4 s1 (w[1:0],k[0],y[0:3]);
dec2to4 s2 (w[1:0],k[1],y[4:7]);
dec2to4 s3 (w[1:0],k[2],y[8:11]);
dec2to4 s4 (w[1:0],k[3],y[12:15]);
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
