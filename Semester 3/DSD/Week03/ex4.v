module ex4(a,b,c,d,f);
input a,b,c,d;
output f;
nor(k1,d,d);
nor(k2,a,a);
nor(k3,c,c);
nor(k4,k2,k3);
nor(f,k1,k4);
endmodule
