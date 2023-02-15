`timescale 1ns/1ns
`include "mux16to1.v"

module mux16to1_tb;
reg [0:15]W;
reg [3:0]S;
wire f;

mux16to1 uut(W,S,f);
initial begin 
	$dumpfile("mux16to1_tb.vcd");
	$dumpvars(0,mux16to1_tb);
	W=16'b1010101010101010;
	S=4'b0000;#20; S=4'b0001;#20;
	S=4'b0010;#20; S=4'b0011;#20;
	S=4'b0100;#20; S=4'b0101;#20;
	S=4'b0110;#20; S=4'b0111;#20;
	S=4'b1000;#20; S=4'b1001;#20;
	S=4'b1010;#20; S=4'b1011;#20;
	S=4'b1100;#20; S=4'b1101;#20;
	S=4'b1110;#20; S=4'b1111;#20;
	$display("Test Complete");	
end 
endmodule
