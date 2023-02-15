`timescale 1ns/1ns
`include "bcd.v"

module bcd_tb;
reg Cin;
reg [3:0] X1,Y1;
wire [3:0] S1;
wire Cout;

bcd uut(Cin,X1,Y1,S1,Cout);
initial begin
	$dumpfile("bcd.vcd");
	$dumpvars(0,bcd_tb);
	X1=1; Y1=1; Cin=0; #20; 
	X1=9; Y1=7; Cin=0; #20;
	X1=4; Y1=3; Cin=0; #20;
	X1=6; Y1=9; Cin=0; #20;
	X1=6; Y1=6; Cin=0; #20;
	X1=2; Y1=5; Cin=0; #20;
	$display("Test complete");
end
endmodule
