module q5(D,Clock,Q);
input D,Clock;
output [5:0]Q;
DFF stage0(D,Clock,Q[5]);
DFF stage1(Q[5],Clock,Q[4]);
DFF stage2(Q[4],Clock,Q[3]);
DFF stage3(Q[3],Clock,Q[2]);
DFF stage4(Q[2],Clock,Q[1]);
DFF stage5(Q[1],Clock,Q[0]);
endmodule

module DFF(D,Clock,Q);
input D,Clock;
output reg Q;
always @(posedge Clock)
	Q<=D;
endmodule
