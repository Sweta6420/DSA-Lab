`timescale 1ns/1ns
`include "g2b.v"

module g2b_tb();
reg [2:0] g;
wire [2:0]b;

g2b uut(g,b);
initial begin 
	$dumpfile("g2b_tb.vcd");
	$dumpvars(0,g2b_tb);
	g= 4'b101;#20;
	g= 4'b010;#20;
	g= 4'b110;#20;
	g= 4'b011;#20;
	g= 4'b100;#20;
	$display("Test Complete");	
end 
endmodule
