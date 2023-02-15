`timescale 1ns/1ns
`include "ex2.v"

module ex2_tb;

reg a,b,c,d;
wire f,g,fb,gb;

ex2 ex(a,b,c,d,f,g,fb,gb);
initial begin
	$dumpfile("ex2_tb.vcd");
	$dumpvars(0,ex2_tb);
	a=0; b=0; c=0; d=0; #20;
	a=0; b=0; c=0; d=1; #20;
	a=0; b=0; c=1; d=0; #20;
	a=0; b=0; c=1; d=1; #20;
	a=0; b=1; c=0; d=0; #20;
	a=0; b=1; c=0; d=1; #20;
	a=0; b=1; c=1; d=0; #20;
	a=0; b=1; c=1; d=1; #20;
	a=1; b=0; c=0; d=0; #20;
	a=1; b=0; c=0; d=1; #20;
	a=1; b=0; c=1; d=0; #20;
	a=1; b=0; c=1; d=1; #20;
	a=1; b=1; c=0; d=0; #20;
	a=1; b=1; c=0; d=1; #20;
	a=1; b=1; c=1; d=0; #20;
	a=1; b=1; c=1; d=1; #20;
	$display ("Test Complete");
	
	end 
	endmodule
