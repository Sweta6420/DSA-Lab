module addsub(cin,X,y1,S,cout);
input cin;
input [3:0] X,y1;
output [3:0] S;
output cout;
wire [3:0] Y;
assign Y[0]=cin^y1[0];
assign Y[1]=cin^y1[1];
assign Y[2]=cin^y1[2];
assign Y[3]=cin^y1[3];
adder4 stage0 (cin,X,Y,S,cout);
endmodule

module adder4(ci,x0,y0,s0,co);
input ci;
input [3:0] x0,y0;
output [3:0] s0;
output co;
fulladd stage0 (ci,x0[0],y0[0],s0[0], c1);
fulladd stage1 (c1,x0[1],y0[1],s0[1], c2);
fulladd stage2 (c2,x0[2],y0[2],s0[2], c3);
fulladd stage3 (c3,x0[3],y0[3],s0[3], co);
endmodule

module fulladd (Ci, x, y, s, Co);
input Ci, x, y;
output s, Co;
assign s = x ^ y ^ Ci;
assign Co = (x & y) | (x & Ci) | (y & Ci);
endmodule
