module ex2b(a,b,c,d,f1,f2);
input a,b,c,d;
output f1,f2;
or(k1,~a,~b,c);
or(k2,~a,b,~d);
or(k3,b,~c,d);
or(k4,a,~b,~c);
and(f1,k1,k2,k3,k4);
assign f2=((~a|~b|c)&(~a|b|~d)&(b|~c|d)&(a|~b|~c));
endmodule

