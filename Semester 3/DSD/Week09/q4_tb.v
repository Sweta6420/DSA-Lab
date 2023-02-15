`timescale 1ns/1ns
`include "q4.v"

module q4_tb;
reg [2:0] s;
reg e;
reg [0:7] w;
wire f;
q4 uut(w,s,e,f);
initial begin
	$dumpfile("q4_tb.vcd");
	$dumpvars(0, q4_tb);
	w=8'b10101010; 
	s=0; e=1; #20; s=1; e=1; #20;
	s=2; e=1; #20; s=3; e=1; #20;
	s=4; e=1; #20; s=5; e=1; #20;
	s=6; e=1; #20; s=7; e=1; #20;
	$display("Test complete");
end
endmodule
