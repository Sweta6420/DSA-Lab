module TFF(T,Clock,clear,Q);
input T,Clock,clear;
output reg Q;
always @(negedge Clock or negedge clear)
begin 
	if ( clear==0) Q<=0;
	else if ( T==1) Q<=~Q;
	else Q<=Q;
end
endmodule

module dec2to4 (w,e,y);
input [1:0] w;
input e;
output reg [0:3] y;
always @(w or e)
    if (e==0) y=0;
    else
        case (w)
        0: y=8; 1: y=4;
        2: y=2; 3: y=1;
        endcase
endmodule

module counter2bit(Clock,clear,Q);
input Clock,clear;
output [1:0] Q;
TFF s0 (1'b1,Clock,clear,Q[0]); //(Q[0],clear,Clock,1'b1');
TFF s1 (1'b1,Q[0],clear,Q[1]); //(Q[1],clear,Clock,Q[0]);
endmodule

module q1(Clock,clear,Q);
input Clock,clear;
output [0:3]Q;
wire [1:0] Y;
counter2bit s0 (Clock,clear,Y);
dec2to4 stage0 (Y,1'b1,Q);
endmodule
