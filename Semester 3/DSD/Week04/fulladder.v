module fulladder(x1,y1,ci1,co1,s1);
input x1,y1,ci1;
output co1,s1;
assign s1 = x1^y1^ci1;
assign co1 = (x1&y1)|(y1&ci1)|(ci1&x1);
endmodule
