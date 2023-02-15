module ex3(a,b,c,d,f1,f2);
input a,b,c,d;
output f1,f2;
and(k1,a,b,d);
and(k2,a,c,d);
and(k3,a,b,c);
and(k4,b,c,d);
or(f1,k1,k2,k3,k4);
assign f2= ((a&b&c)|(a&b&d)|(a&c&d)|(b&c&d));
endmodule

