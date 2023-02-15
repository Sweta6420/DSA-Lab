module q4(B,G);
input [3:0] B;
output [3:0] G;
xor (k,B[1],B[0]);
mux4to1 s0 ({1'b0,1'b0,1'b1,1'b1},B[3:2],G[3]);
mux4to1 s1 ({1'b0,1'b1,1'b1,1'b0},B[3:2],G[2]);
mux4to1 s2 ({B[1],~B[1],B[1],~B[1]},B[3:2],G[1]);
mux4to1 s3 ({k,k,k,k},B[3:2],G[0]);
endmodule	

module mux4to1(w,s,f1);
input [0:3] w;
input [1:0] s;
output f1;
assign f1 = s[1] ? (s[0] ? w[3]:w[2]) : (s[0] ? w[1]:w[0]);
endmodule 
