module ex2(a,b,c,d,f1,f2);
input a,b,c,d;
output f1,f2;
nor(k1,b,c);
nor(k2,b,d);
nor(k3,d,d);
nor(k4,a,c,k3);
nor(k5,k1,k2,k4);
nor(f1,k5,k5);
assign g = ((b ~| c) ~| (b ~| d) ~| ((a ~| c )~| (d ~| d))); //notworking
assign f2 = (g ~| g);
endmodule
