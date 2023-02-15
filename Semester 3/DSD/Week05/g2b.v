module g2b(g,b);
parameter n=3;
integer k=0;
input [n-1:0] g;
output reg[n-1:0] b;
always @(g)
begin
	b[n-1]=g[n-1];
	for (k=n-2; k>=0; k--)
	begin
		b[k]=b[k+1]^g[k];
	end
end 
endmodule
