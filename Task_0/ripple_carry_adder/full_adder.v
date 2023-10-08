module full_adder(input a,b, c_in, output sum, carry);

assign sum= a^b^c_in;
assign carry= a&b | b&c_in | a&c_in;

endmodule 