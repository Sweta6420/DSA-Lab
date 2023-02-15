module ex1(a,b,c,d,f1,f2);
input a,b,c,d;
output f1,f2;
and (k1,~a, b);
and(k2,c,d);
and(k3,~b,c);
and(k4,b,~c,~d);
or(f1,k1,k2,k3,k4);
assign f2= ((~a&b)|(c&d)|(~b&c)|(b&~c&~d));
endmodule

