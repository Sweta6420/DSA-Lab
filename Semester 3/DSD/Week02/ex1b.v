module ex1b(a,b,c,d,f1,f2);
input a,b,c,d;
output f1,f2;
and (k1,~b,c);
and(k2,b,~c,~d);
and(k3,~b,d);
or(f1,k1,k2,k3);
assign f2=((~b&c)|(b&~c&~d)|(~b&d));
endmodule

