
module multiple_module_optv2(input a , input b , input c , input d , output y);
wire n1,n2,n3;

assign n1 = a & (1'b1); 
assign n2 = n1 ^ (1'b0);
assign n3 = b^d;

assign y = c | (b & n1); 


endmodule
