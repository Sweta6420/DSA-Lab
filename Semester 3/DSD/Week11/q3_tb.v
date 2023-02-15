`timescale 1ns/1ns
`include "q3.v"
module q3_tb();
reg Clock,clear;
wire [3:0] Q;
q3 uut(Clock,clear,Q);

always #5 Clock=~Clock;
initial begin
	clear=0; Clock=1;
	#160 $finish;
end
initial begin
	$dumpfile("q3_tb.vcd");
	$dumpvars(0,q3_tb);
	$monitor($time, " clear=%b, Q=%4b", clear, Q );
	#10 clear =1;
end
endmodule
