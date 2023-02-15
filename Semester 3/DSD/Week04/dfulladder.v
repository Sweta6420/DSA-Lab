module dfulladder(x2,y2,ci2,co2,s2);
input x2,y2,ci2;
output co2,s2;
halfadder stage0 (x2,y2,co2_1,s2_1);
halfadder stage1 (s2_1,ci2,co2_2,s2);
assign co2 = co2_1|co2_2;
endmodule

module halfadder(x0,y0,c0,s0);
input x0,y0;
output c0,s0;
assign c0 = x0&y0;
assign s0 = x0^y0;
endmodule 
