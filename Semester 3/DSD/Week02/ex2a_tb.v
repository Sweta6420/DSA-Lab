`timescale 1ns/1ns
`include "ex2a.v"

module ex2a_tb;

reg a,b,c,d;
wire f1,f2;

ex2a ex(a,b,c,d,f1,f2);
initial begin
	$dumpfile("ex2a_tb.vcd");
	$dumpvars(0,ex2a_tb);
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
