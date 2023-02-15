`timescale 1ns/1ns
`include "q2.v"
module q2_tb;
reg [3:0] w;
reg e;
wire [0:15] y;
q2 ex1(w,e,y);
initial begin
    $dumpfile("q2_tb.vcd");
    $dumpvars(0,q2_tb);
	w=0; e=1; #20; w=1; e=1; #20;
	w=2; e=1; #20; w=3; e=1; #20;
	w=4; e=1; #20; w=5; e=1; #20;
	w=6; e=1; #20; w=7; e=1; #20;  
	w=8; e=1; #20; w=9; e=1; #20;
	w=10; e=1; #20; w=11; e=1; #20;
	w=12; e=1; #20; w=13; e=1; #20;
	w=14; e=1; #20;	w=15; e=1; #20;
    $display("Test Complete");    
end
endmodule
