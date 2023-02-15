`timescale 1ns/1ns
`include "q3.v"
module q3_tb;
reg [3:0] w;
wire [0:15] y;
q3 uut(w,y);
initial begin
	$dumpfile("q3_tb.vcd");
    	$dumpvars(0,q3_tb);
	w=0; #20; w=1; #20;
   	w=2; #20; w=3; #20;
   	w=4; #20; w=5; #20;
   	w=6; #20; w=7; #20;
   	w=8; #20; w=9; #20;
   	w=10; #20; w=11; #20;
   	w=12; #20; w=13; #20;
   	w=14; #20; w=15; #20;
    	$display("Test Complete");    
end
endmodule
