module mux16to1(W,S,f);
input [0:15] W;
input [3:0] S;
output f;
wire [0:3] k;
mux4to1 stage0 (W[0:3], S[1:0], k[0]);
mux4to1 stage1 (W[4:7], S[1:0], k[1]);
mux4to1 stage2 (W[8:11], S[1:0], k[2]);
mux4to1 stage3 (W[12:15], S[1:0], k[3]);
mux4to1 stage4 (k[0:3], S[3:2], f);
endmodule

module mux4to1(w,s,f1);
input [0:3] w;
input [1:0] s;
output f1;
assign f1 = s[1] ? (s[0] ? w[3]:w[2]) : (s[0] ? w[1]:w[0]);
endmodule
