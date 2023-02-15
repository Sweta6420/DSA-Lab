`timescale 1ns/1ns
`include "ex3.v"

module ex3_tb;

reg a,b,c,d,e;
wire f;

ex3 ex(a,b,c,d,e,f);
initial begin
	$dumpfile("ex3_tb.vcd");
	$dumpvars(0,ex3_tb);
	a=0; b=0; c=0; d=0; e=0; #10;
	a=0; b=0; c=0; d=0; e=1; #10;
	a=0; b=0; c=0; d=1; e=0; #10;
	a=0; b=0; c=0; d=1; e=1; #10;
	a=0; b=0; c=1; d=0; e=0; #10;
	a=0; b=0; c=1; d=0; e=1; #10;
	a=0; b=0; c=1; d=1; e=0; #10;
	a=0; b=0; c=1; d=1; e=1; #10;
	a=0; b=1; c=0; d=0; e=0; #10;
	a=0; b=1; c=0; d=0; e=1; #10;
	a=0; b=1; c=0; d=1; e=0; #10;
	a=0; b=1; c=0; d=1; e=1; #10;
	a=0; b=1; c=1; d=0; e=0; #10;
	a=0; b=1; c=1; d=0; e=1; #10;
	a=0; b=1; c=1; d=1; e=0; #10;
	a=0; b=1; c=1; d=1; e=1; #10;
	a=1; b=0; c=0; d=0; e=0; #10;
	a=1; b=0; c=0; d=0; e=1; #10;
	a=1; b=0; c=0; d=1; e=0; #10;
	a=1; b=0; c=0; d=1; e=1; #10;
	a=1; b=0; c=1; d=0; e=0; #10;
	a=1; b=0; c=1; d=0; e=1; #10;
	a=1; b=0; c=1; d=1; e=0; #10;
	a=1; b=0; c=1; d=1; e=1; #10;
	a=1; b=1; c=0; d=0; e=0; #10;
	a=1; b=1; c=0; d=0; e=1; #10;
	a=1; b=1; c=0; d=1; e=0; #10;
	a=1; b=1; c=0; d=1; e=1; #10;
	a=1; b=1; c=1; d=0; e=0; #10;
	a=1; b=1; c=1; d=0; e=1; #10;
	a=1; b=1; c=1; d=1; e=0; #10;
	a=1; b=1; c=1; d=1; e=1; #10;	
	$display ("Test Complete");
	
	end 
	endmodule
