`timescale 1ns/1ns
`include "struct.v"

module struct_tb;

reg a,b;
wire c;

struct uut(a,b,c);
initial begin

	$dumpfile("struct_tb.vcd");
	$dumpvars(0,struct_tb);
	
	a=0;
	b=0;
	#20;
	
	a=0;
	b=1;
	#20;
	
	a=1;
	b=0;
	#20;
	
	a=1;
	b=1;
	#20;
	
	$display ("Test Complete");

end

endmodule


