`timescale 1ns/1ns
`include "halfadder.v"
module halfadder_tb;

reg x0,y0;
wire c0,s0;

halfadder ha(x0,y0,c0,s0);
initial begin
	$dumpfile("halfadder_tb.vcd");
	$dumpvars(0,halfadder_tb);
	x0=0; y0=0; #20;
	x0=0; y0=1; #20;
	x0=1; y0=0; #20;
	x0=1; y0=1; #20;
	$display ("Test Complete");
end 
endmodule

