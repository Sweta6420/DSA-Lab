`timescale 1ns/1ns
`include "ex1.v"
module ex1_tb;

reg x0,y0,x1,y1,x2,y2,ci1,ci2;
wire c0,s0,co1,s1,co2,s2;

halfadder ha(x0,y0,c0,s0);
fulladder fa(x1,y1,ci1,co1,s1);
dfulladder dfa(x2,y2,ci2,co2,s2);
initial begin
	$dumpfile("ex1_tb.vcd");
	$dumpvars(0,ex1_tb);
	x0=0; y0=0; x1=0; y1=0; ci1=0; x2=0; y2=0; ci2=0; #20;
	x0=0; y0=1; x1=0; y1=0; ci1=1; x2=0; y2=0; ci2=1; #20;
	x0=1; y0=0; x1=0; y1=1; ci1=0; x2=0; y2=1; ci2=0; #20;
	x0=1; y0=1; x1=0; y1=1; ci1=1; x2=0; y2=1; ci2=1; #20;
	x1=1; y1=0; ci1=0; x2=1; y2=0; ci2=0; #20;
	x1=1; y1=0; ci1=1; x2=1; y2=0; ci2=1; #20;
	x1=1; y1=1; ci1=0; x2=1; y2=1; ci2=0; #20;
	x1=1; y1=1; ci1=1; x2=1; y2=1; ci2=1; #20;
	$display ("Test Complete");
end 
endmodule

