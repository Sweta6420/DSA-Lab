`timescale 1ns/1ns
`include "q1.v"

module q1_tb;
reg [2:0] w;
reg e;
wire [0:7] y;

q1 ex1(w,e,y);
initial begin
    $dumpfile("q1_tb.vcd");
    $dumpvars(0,q1_tb);
	w=0; e=1; #20;
	w=1; e=1; #20;
	w=2; e=1; #20;
	w=3; e=1; #20;
	w=4; e=1; #20;
	w=5; e=1; #20;
	w=6; e=1; #20;
	w=7; e=1; #20;  
    $display("Test Complete");    
end
endmodule
