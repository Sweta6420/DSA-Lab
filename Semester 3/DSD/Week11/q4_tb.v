`timescale 1ns/1ns
`include "q4.v"
module q4_tb();
reg Clock,clear;
wire [3:0] Q;
q4 uut(Clock,clear,Q);

always #5 Clock=~Clock;
initial begin
	clear=0; Clock=1;
	#160 $finish;
end
initial begin
	$dumpfile("q4_tb.vcd");
	$dumpvars(0,q4_tb);
	$monitor($time, " clear=%b, Q=%4b", clear, Q );
	#10 clear =1;
end
endmodule