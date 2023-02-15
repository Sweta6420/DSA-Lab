`timescale 1ns/1ns
`include "convert.v"

module convert_tb();
reg [3:0] a;
wire [3:0]b;

convert uut(a,b);
initial begin 
	$dumpfile("convert_tb.vcd");
	$dumpvars(0,convert_tb);
	a= 4'b1010;#20;
	a= 4'b0101;#20;
	a= 4'b0100;#20;
	a= 4'b0111;#20;
	a= 4'b1001;#20;
	$display("Test Complete");	
end 
endmodule
