`timescale 1ns/1ns
`include "q4.v"

module q4_tb;
reg [3:0] B;
wire [3:0] G;

q4 ex1(B,G);
initial begin 
	$dumpfile("q4_tb.vcd");
	$dumpvars(0,q4_tb);
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
