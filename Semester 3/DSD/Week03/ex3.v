module ex3(a,b,c,d,e,f);
input a,b,c,d,e;
output f;
assign g= (e&(~a|b));
assign f = (((c~^d)&g)|(~g&~c&d));
endmodule
