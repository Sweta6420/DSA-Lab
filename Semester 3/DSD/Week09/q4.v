module q4(w,s,e,f);
input [0:7] w;
input [2:0] s;
input e;
output f;
wire [0:7] y;
dec3to8 s0(s,e,y);
and (t0,w[0],y[0]);
and (t1,w[1],y[1]);
and (t2,w[2],y[2]);
and (t3,w[3],y[3]);
and (t4,w[4],y[4]);
and (t5,w[5],y[5]);
and (t6,w[6],y[6]);
and (t7,w[7],y[7]);
or (f,t0,t1,t2,t3,t4,t5,t6,t7);
endmodule

module dec3to8 (W,E,Y);
input [2:0] W;
input E;
output reg [0:7] Y;
always @(W or E)
begin
if (E == 0) Y = 8'b00000000;
else
	case (W)
	0: Y = 8'b10000000; 1: Y = 8'b01000000;
	2: Y = 8'b00100000; 3: Y = 8'b00010000;
	4: Y = 8'b00001000; 5: Y = 8'b00000100;
	6: Y = 8'b00000010; 7: Y = 8'b00000001;
	endcase
end
endmodule
