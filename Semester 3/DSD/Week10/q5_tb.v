`timescale 1ns/1ns
`include "q5.v" 
module q5_tb();
reg Clock,D;
wire [5:0]Q;

q5 uut(D,Clock,Q);
initial begin
	$dumpfile("q5_tb.vcd");
	$dumpvars(0, q5_tb);
	D=1'b1; Clock = 1; #10;
	D=1'b1; Clock = 0; #10;
	D=1'b0; Clock = 1; #10;
	D=1'b0; Clock = 0; #10;
	D=1'b1; Clock = 1; #10;
	D=1'b1; Clock = 0; #10;
	D=1'b1; Clock = 1; #10;
	D=1'b0; Clock = 0; #10;
	D=1'b1; Clock = 1; #10;
	D=1'b0; Clock = 0; #10;
	D=1'b1; Clock = 1; #10;
	D=1'b1; Clock = 0; #10;
	D=1'b1; Clock = 1; #10;
	D=1'b1; Clock = 0; #10;
	D=1'b0; Clock = 1; #10;
	D=1'b0; Clock = 0; #10;
	D=1'b1; Clock = 1; #10;
	D=1'b1; Clock = 0; #10;
	$display("Test complete");
end
endmodule
