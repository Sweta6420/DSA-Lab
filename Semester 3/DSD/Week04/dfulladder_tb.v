`timescale 1ns/1ns
`include "dfulladder.v"
module dfulladder_tb;

reg x2,y2,ci2;
wire co2,s2;

dfulladder dfa(x2,y2,ci2,co2,s2);
initial begin
	$dumpfile("dfulladder.vcd");
	$dumpvars(0,dfulladder_tb);
	x2=0; y2=0; ci2=0; #20;
	x2=0; y2=0; ci2=1; #20;
	x2=0; y2=1; ci2=0; #20;
	x2=0; y2=1; ci2=1; #20;
	x2=1; y2=0; ci2=0; #20;
	x2=1; y2=0; ci2=1; #20;
	x2=1; y2=1; ci2=0; #20;
	x2=1; y2=1; ci2=1; #20;
	$display ("Test Complete");
end 
endmodule

