module q5(w,y);
input [15:0] w;
output reg [3:0] y;
integer i;
always @(w)
begin 
        for (i=0; i<16; i+=1)
        begin	
        	if (w[i]==1) y=i;
        end
end
endmodule
