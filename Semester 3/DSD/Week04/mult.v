module mult(a,b,p);
input [1:0] a,b;
output [3:0] p;
assign p[0]=a[0]&b[0];
wire [1:0] k1,k2;
assign k1={1'b0,a[1]&b[0]};
assign k2={a[1]&b[1],a[0]&b[1]};
adder2 st1(1'b0,k1,k2,p[2:1],p[3]);
endmodule

module adder2(ci,x0,y0,s0,co);
input ci;
input [1:0] x0,y0;
output [1:0] s0;
output co;
fulladd stage0 (ci,x0[0],y0[0],s0[0], c1);
fulladd stage1 (c1,x0[1],y0[1],s0[1], co);
endmodule

module fulladd (Ci, x, y, s, Co);
input Ci, x, y;
output s, Co;
assign s = x ^ y ^ Ci;
assign Co = (x & y) | (x & Ci) | (y & Ci);
endmodule
