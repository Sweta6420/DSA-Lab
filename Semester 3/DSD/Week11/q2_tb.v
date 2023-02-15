`timescale 1ns/1ns
`include "q2.v"
module q2_tb();
reg Clock,clear;
wire [4:0] Q;
q2 uut(Q,Clock,clear);

always #5 Clock=~Clock;
initial begin
	clear=0; Clock=1;
	#150 $finish;
end
initial begin
	$dumpfile("q2_tb.vcd");
	$dumpvars(0,q2_tb);
	$monitor($time, " clear=%b, Q=%5b", clear, Q );
	#10 clear =1;
end
endmodule
