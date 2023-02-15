module mux16to1case(W,S,f);
input [0:15] W;
input [3:0] S;
output f;
wire [0:1] k0;
mux8to1 stg0 (W[0:7], S[2:0], k0[0]);
mux8to1 stg1 (W[8:15], S[2:0], k0[1]);
mux2to1 stg2 (k0[0:1], S[3], f);
endmodule

module mux8to1(w1,s1,f1);
input [0:7] w1;
input [2:0] s1;
output f1;
reg f1;
always @(w1 or s1)
case (s1)
0: f1=w1[0]; 1: f1=w1[1];
2: f1=w1[2]; 3: f1=w1[3];
4: f1=w1[4]; 5: f1=w1[5];
6: f1=w1[6]; 7: f1=w1[7];
endcase
endmodule

module mux2to1(w,s,f0);
input [0:1] w;
input s;
output f0;
reg f0;
always @(w or s)
case (s)
0: f0 = w[0];
1: f0 = w[1];
endcase
endmodule

