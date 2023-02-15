module mux4to1(W,S,f);
input [0:3] W;
input [1:0] S;
output f;
wire [0:1] k;
mux2to1 stage0 (W[0:1],S[0],k[0]);
mux2to1 stage1 (W[2:3],S[0],k[1]);
mux2to1 stage2 (k[0:1],S[1],f);
endmodule

module mux2to1(w,s,f1);
input [0:1] w;
input s;
output f1;
reg f1;
always @(w or s)
if (s==0) f1=w[0];
else f1=w[1];
endmodule
