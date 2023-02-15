module ex1(a,b,c,d,f1,f2);
input a,b,c,d;
output f1,f2;
nand(k1,b,b);
nand(k2,a,k1);
nand(k3,d,d);
nand(k4,c,k3);
nand(k5,k2,k4);
nand(f1,k5,k5);
assign g = ((a ~&(b ~& b))~&(c ~& (d ~& d)));
assign f2 = g ~& g;
endmodule
