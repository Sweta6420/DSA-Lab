`timescale 1ns/1ns
`include "fulladder.v"
module fulladder_tb;

reg x1,y1,ci1;
wire co1,s1;

fulladder fa(x1,y1,ci1,co1,s1);
initial begin
	$dumpfile("fulladder.vcd");
	$dumpvars(0,fulladder_tb);
	x1=0; y1=0; ci1=0; #20;
	x1=0; y1=0; ci1=1; #20;
	x1=0; y1=1; ci1=0; #20;
	x1=0; y1=1; ci1=1; #20;
	x1=1; y1=0; ci1=0; #20;
	x1=1; y1=0; ci1=1; #20;
	x1=1; y1=1; ci1=0; #20;
	x1=1; y1=1; ci1=1; #20;
	$display ("Test Complete");
end 
endmodule

