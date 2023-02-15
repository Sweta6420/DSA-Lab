`timescale 1ns/1ns
`include "q3.v"

module q3_tb;
reg [3:0] B;
wire [3:0] E;

q3 ex1(B,E);
initial begin 
	$dumpfile("q3_tb.vcd");
	$dumpvars(0,q3_tb);
	B=0; #20;
	B=1; #20;
	B=2; #20;
	B=3; #20;
	B=4; #20;
	B=5; #20;
	B=6; #20;
	B=7; #20;
	B=8; #20;
	B=9; #20;
	B=10; #20;
	B=11; #20;
	B=12; #20;
	B=13; #20;
	B=14; #20;
	B=15; #20;	
	$display("Test Complete");
	
end 
endmodule
