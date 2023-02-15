`timescale 1ns/1ns
`include "q4.v"

module q4_tb;
reg [3:0] w;
wire [1:0] y;
wire z;

q4 ex1(w,y,z);
initial begin
    $dumpfile("q4_tb.vcd");
    $dumpvars(0,q4_tb);
	w = 4'b0000; #20;
  	w = 4'b0001; #20;
    	w = 4'b0010; #20;
    	w = 4'b0100; #20;
    	w = 4'b1000; #20;
    $display("Test Complete");    
end
endmodule
