module q2(T,Reset,Clock,Q);
input T,Reset,Clock;
output reg Q;
always @(negedge Clock or negedge Reset)
if (Reset==0) Q<=0;
else Q <= Q^T;
endmodule
