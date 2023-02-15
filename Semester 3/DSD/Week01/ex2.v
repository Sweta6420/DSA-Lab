module ex2(a,b,c,d,f,g,fb,gb);
input a,b,c,d;
output f,g,fb,gb;
nand (k1,a,b);
xor (f,k1,c,d);
nor (g,b,c,d);
assign fb = (~(a&b)^c^d);
assign gb = ~((b|c)|d);
endmodule
