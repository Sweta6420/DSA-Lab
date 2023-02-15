module q4(D,Clock,R);
input [4:0]D;
input Clock;
output [4:0]R;
DFF stage0 (D[4],Clock,R[4]);
DFF stage1 (D[3],Clock,R[3]);
DFF stage2 (D[2],Clock,R[2]);
DFF stage3 (D[1],Clock,R[1]);
DFF stage4 (D[0],Clock,R[0]);
endmodule

module DFF(D,Clock,Q);
input D,Clock;
output reg Q;
always @(posedge Clock)
	Q<=D;
endmodule

	
