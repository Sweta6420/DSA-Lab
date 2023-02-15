module q1b(a,b,c,d,f);
input a,b,c,d;
output f;
mux4to1 s0({(~d|c),d,1'b0,1'b0},{a,b},f);
endmodule

module mux4to1(w,s,f1);
input [0:3] w;
input [1:0] s;
output f1;
assign f1 = s[1] ? (s[0] ? w[3] :w[2]) : (s[0] ? w[1]:w[0]);
endmodule 
