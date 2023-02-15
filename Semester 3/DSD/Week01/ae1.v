module ae1(a,b,c,f1,f2);
input a,b,c;
output f1,f2;
and (k1,a,~c);
and (k2, b, c);
and (k3, ~b, ~c);
or (f1, k1,k2,k3);
or (k4, a, ~b, c);
or (k5, a, b, ~c);
or (k6, ~a, b, ~c);
and (f2, k4, k5, k6);
endmodule
