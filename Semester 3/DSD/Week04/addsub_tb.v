`timescale 1ns/1ns
`include "addsub.v"

module addsub_tb;
reg [3:0] X,y1;
reg cin;
wire [3:0] S;
wire cout;

addsub ex(cin,X, y1, S, cout);
initial begin
	$dumpfile("addsub.vcd");
	$dumpvars(0,addsub_tb);
	X=1; y1=1; cin=1; #20; 
	X=1; y1=1; cin=0; #20;
	X=4; y1=3; cin=1; #20;
	X=7; y1=1; cin=1; #20;
	X=6; y1=6; cin=0; #20;
	X=2; y1=5; cin=0; #20;
	$display("Test complete");
end
endmodule
