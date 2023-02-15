`timescale 1ns/1ns
`include "q4.v" 
module q4_tb();
reg Clock;
reg [4:0]D;
wire [4:0]R;

q4 uut(D,Clock,R);
initial begin
	$dumpfile("q4_tb.vcd");
	$dumpvars(0, q4_tb);
	D=5'b10000; Clock = 1; #20;
	D=5'b01001; Clock = 0; #20;
	D=5'b00000; Clock = 1; #20;
	D=5'b01001; Clock = 0; #20;
	D=5'b01001; Clock = 1; #20;
	D=5'b10000; Clock = 0; #20;
	$display("Test complete");
end
endmodule
