module bcd(Cin,X1,Y1,S1,Cout);
input Cin;
input [3:0] X1,Y1;
output [3:0] S1;
output Cout;
wire [3:0] h,Stemp;
adder4 stage0 (Cin,X1,Y1,Stemp,Cout);
assign k = Cout | Stemp[1]&Stemp[3] | Stemp[2]&Stemp[3];
assign h[0]=0, h[1]=k, h[2]=k, h[3]=0;
adder4 s1 (Cin,Stemp,h,S1,Co);
endmodule

module adder4(cin,X,Y,S,cout);
input cin;
input [3:0] X,Y;
output [3:0] S;
output cout;
fulladd stage0 (cin,X[0],Y[0],S[0], c1);
fulladd stage1 (c1, X[1],Y[1],S[1],c2);
fulladd stage2 (c2, X[2],Y[2],S[2], c3);
fulladd stage3 (c3, X[3],Y[3],S[3], cout);
endmodule

module fulladd (Ci, x, y, s, Co);
input Ci, x, y;
output s, Co;
assign s = x ^ y ^ Ci;
assign Co = (x & y) | (x & Ci) | (y & Ci);
endmodule
