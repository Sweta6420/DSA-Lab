module q1(w,e,y);
input [2:0] w;
input e;
output [0:7] y;
dec2to4 s0 (w[1:0],e&(~w[2]),y[0:3]);
dec2to4 s1 (w[1:0],e&w[2],y[4:7]);
endmodule

module dec2to4(w,e,y);
input [1:0] w;
input e;
output reg [0:3] y; 
always @(w or e)
begin	
	if (e==0) y= 4'b0000;
	else
		if (w==0) y= 8;
		else if (w==1) y= 4;
		else if (w==2) y= 2;
		else y= 1;
end
endmodule
