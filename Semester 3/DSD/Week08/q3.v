module q3(w,y);
input [3:0]w;
output [0:15]y;
wire [0:3]k;
dec2to4 s0 (w[3:2],1'b1,k);
dec2to4 s1 (w[1:0],~k[0],y[0:3]);
dec2to4 s2 (w[1:0],~k[1],y[4:7]);
dec2to4 s3 (w[1:0],~k[2],y[8:11]);
dec2to4 s4 (w[1:0],~k[3],y[12:15]);
endmodule

module dec2to4 (w,e,y);
input [1:0]w;	
input e;
output reg [0:3]y;
always@(w,e)
begin
	if (e==1)
	begin
		case (w)
		0: y=4'b0111;
		1: y=4'b1011;
		2: y=4'b1101;
		3: y=4'b1110;
		endcase
	end
	else y=4'b1111;
end
endmodule


