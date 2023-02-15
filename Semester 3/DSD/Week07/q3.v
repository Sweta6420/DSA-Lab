module q3(B,E);
input [3:0] B;
output [3:0] E;
mux8to1 s0 ({1'b0,1'b0,B[0],1'b1,1'b1,1'b1,1'b1,1'b1},B[3:1],E[3]);
mux8to1 s1 ({B[0],1'b1,~(B[0]),1'b0,B[0],1'b1,1'b1,1'b1},B[3:1],E[2]);
mux8to1 s2 ({~B[0],B[0],~B[0],B[0],~B[0],B[0],~B[0],B[0]},B[3:1],E[1]);
mux8to1 s3 ({~B[0],~B[0],~B[0],~B[0],~B[0],~B[0],~B[0],~B[0]},B[3:1],E[0]);
endmodule

module mux8to1 (w,s,f);
input [0:7] w;
input [2:0] s;
output f;
reg f;
always @(w or s)
case (s)
0: f = w[0];
1: f = w[1];
2: f = w[2];
3: f = w[3];
4: f = w[4];
5: f = w[5];
6: f = w[6];
7: f = w[7];
endcase
endmodule
