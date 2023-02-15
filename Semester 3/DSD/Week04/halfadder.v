module halfadder(x0,y0,c0,s0);
input x0,y0;
output c0,s0;
assign c0 = x0&y0;
assign s0 = x0^y0;
endmodule 
