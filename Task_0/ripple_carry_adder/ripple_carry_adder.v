//2-bit input 
module ripple_carry_adder(input [1:0] a,b, input c_in, output [1:0] sum, output carry_out);

wire c1;

full_adder FA1 (a[0], b[0], c_in, sum[0], c1);
full_adder FA2 (a[1], b[1], c1, sum[1], carry_out);

endmodule 