module comp(a,b,l,e,g);
input [4:0] a, b;
output l,e,g;
wire [4:0] i;
assign i = {a[4]~^b[4],a[3]~^b[3],a[2]~^b[2],a[1]~^b[1],a[0]~^b[0]};
assign e = i[0]&i[1]&i[2]&i[3]&i[4];
assign g = (a[4]&(~b[4]) | i[4]&a[3]&(~b[3]) | i[4]&i[3]&a[2]&(~b[2]) | i[4]&i[3]&i[2]&a[1]&(~b[1]) | i[4]&i[3]&i[2]&i[1]&a[0]&(~b[0]));
assign l = e ~| g;
endmodule
