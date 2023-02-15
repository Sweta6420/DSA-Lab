`timescale 1ns/1ns
`include "q3.v"
module q3_tb;
reg a,b,c,e;
wire f;
q3 uut(a,b,c,e,f);
initial begin	
	$dumpfile("q3_tb.vcd");
	$dumpvars(0,q3_tb);
	a=0; b=0; c=0; e=1; #20;
	a=0; b=0; c=1; e=1; #20;
	a=0; b=1; c=0; e=1; #20;
	a=0; b=1; c=1; e=1; #20;
	a=1; b=0; c=0; e=1; #20;
	a=1; b=0; c=1; e=1; #20;
	a=1; b=1; c=0; e=1; #20;
	a=1; b=1; c=1; e=1; #20;
	$display ("Test Complete");	
end 
endmodule

	
