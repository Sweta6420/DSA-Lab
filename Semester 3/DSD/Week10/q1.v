module q1(D,Reset,Clock,Q);
input D,Reset,Clock;
output reg Q;
always @(posedge Clock or negedge Reset)
if (Reset==0) Q<=D;
else if (Reset==1) Q<=0;
endmodule
