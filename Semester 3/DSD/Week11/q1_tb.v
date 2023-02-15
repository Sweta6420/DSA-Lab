`timescale 1ns/1ns
`include "q1.v"

module q1_tb() ;
reg clear, Clock;
wire [3:0] Q;
q1 uut(Clock,clear, Q);
always #5 Clock=~Clock;
initial begin
	clear=0;
	Clock=1;
	#150 $finish;
end
initial begin
	$dumpfile("q1_tb.vcd");
	$dumpvars(0,q1_tb);
	$monitor($time, " clear=%b, Q=%4b", clear, Q );
	#10 clear =1;
end
endmodule
