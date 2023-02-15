module q3(J,K,Reset,Clock,Q);
input J,K,Reset,Clock;
output reg Q;
always @(posedge Clock)
if (Reset==1) Q<=0;
else Q <= (Q&(~K)) | ((~Q)&J);
endmodule
