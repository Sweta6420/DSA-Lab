module DFF (D, Clock, clear,Q);
input D,clear, Clock;
output reg Q;
always @ (posedge Clock)
begin
	if (clear==0) Q<=0;
	else Q<=D;
end
endmodule

module q2(Q,Clock,clear);
input Clock,clear;
output [4:0] Q;
DFF s0 (~Q[0],Clock,clear,Q[4]);
DFF s1 (Q[4],Clock,clear,Q[3]);
DFF s2 (Q[3],Clock,clear,Q[2]);
DFF s3 (Q[2],Clock,clear,Q[1]);
DFF s4 (Q[1],Clock,clear,Q[0]);
endmodule
