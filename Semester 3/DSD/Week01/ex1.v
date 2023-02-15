module ex1(a,b,c,d,f,fb);
input a,b,c,d;
output f, fb;
and (k1,a,b);
or (k2,k1,c);
and (k3,~k2,d);
or (k4, k2, d);
and (f,k3,k4);
assign fb = (~((a&b|c))&d)&(((a&b)|c)|d);
endmodule
