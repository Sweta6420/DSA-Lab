`timescale 1ns/1ns
`include "ae1.v"

module ae1_tb;

reg a,b,c;
wire f1, f2;

ae1 uut(a,b,c,f1,f2);
initial begin
	$dumpfile("ae1_tb.vcd");
	$dumpvars(0,ae1_tb);
	a=0; 
	b=0; 
	c=0; 
	#20;
	
	a=0; 
	b=0; 
	c=1; 
	#20;
	
	a=0; 
	b=1; 
	c=0; 
	#20;
	
	a=0; 
	b=1; 
	c=1; 
	#20;
	
	a=1; 
	b=0; 
	c=0; 
	#20;
	
	a=1; 
	b=0; 
	c=1; 
	#20;
	
	a=1; 
	b=1; 
	c=0; 
	#20;
	
	a=1; 
	b=1; 
	c=1; 
	#20;	
	$display ("Test Complete");
	
end 
endmodule

