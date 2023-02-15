module compare4(a,b,l,e,g);
input [3:0] a, b;
output l,e,g;
wire l1,l2,g1,g2,e1,e2;
compare2 stage0 (a[3:2],b[3:2],l1,e1,g1);
compare2 stage1 (a[1:0],b[1:0],l2,e2,g2);
assign e = (e1&e2);
assign g = g1 | (e1&g2);
assign l = e ~| g;

endmodule

module compare2(a0,b0,l0,e0,g0);
input [1:0] a0, b0;
output l0,e0,g0;
wire [1:0] i0;
assign i0 = {a0[1]~^b0[1], a0[0]~^b0[0]};
assign e0 = i0[1]&i0[0];
assign g0 = a0[1]&(~b0[1]) | i0[1]&a0[0]&(~b0[0]);
assign l0 = e0 ~| g0;
endmodule
