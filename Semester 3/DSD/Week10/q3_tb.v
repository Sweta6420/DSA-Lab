`timescale 1ns/1ns
`include "q3.v" 
module q3_tb();
reg J,K,Clock,Reset;
wire Q;

q3 uut(J,K,Reset,Clock,Q);
initial begin
	$dumpfile("q3_tb.vcd");
	$dumpvars(0, q3_tb);
	J=1; K=0; Reset=0; Clock=1; #20;
	J=1; K=0; Reset=0; Clock=0; #20;
	J=0; K=1; Reset=0; Clock=1; #20;
	J=0; K=0; Reset=0; Clock=0; #20;
	J=1; K=1; Reset=0; Clock=1; #20;
	J=1; K=0; Reset=1; Clock=0; #20;
	J=0; K=1; Reset=1; Clock=1; #20;
	J=0; K=0; Reset=1; Clock=0; #20;
	J=1; K=1; Reset=1; Clock=1; #20;
	$display("Test complete");
end
endmodule
