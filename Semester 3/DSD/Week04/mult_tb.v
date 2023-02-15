`timescale 1ns/1ns
`include "mult.v"

module mult_tb;
reg [1:0] a,b;
wire [3:0] p;

mult uut(a,b,p);
initial begin
	$dumpfile("mult.vcd");
	$dumpvars(0,mult_tb);
	a=2; b=3; #20;
	a=1; b=2; #20;
	a=1; b=3; #20;
	a=1; b=1; #20;
	$display("Test complete");
end
endmodule

//half and full -  truth table and block diagram, code, testbench, waveform
//decomposed full adder - block diagram using half adder, code, testbench, waveform
//multiplier - block diagram, verilog code and test bench, waveform
//bcd adder - 

