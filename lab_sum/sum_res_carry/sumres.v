
module sumres(
  input a,b,c_in,op,
  output s,c_out
);
  assign s = ((a ^ b) ^ c_in);
  assign c_out = (((a ^ op) & b) | (((a ^ op) | b) & c_in));
endmodule
