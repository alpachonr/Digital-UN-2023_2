
module full_sum (
	input in_b0, in_b1, in_b2, in_b3, in_a0, in_a1, in_a2, in_a3, in_cy,
	output out_s0, out_s1, out_s2, out_s3, out_cy0
);
wire f_out_cy0_f_in_cy1;
wire f_out_cy1_f_in_cy2;
wire f_out_cy2_f_in_cy3;

sum sum0(in_b0,in_a0,in_cy,f_out_cy0_f_in_cy1,out_s0);
sum sum1(in_b1,in_a1,f_out_cy0_f_in_cy1,f_out_cy1_f_in_cy2,out_s1);
sum sum2(in_b2,in_a2,f_out_cy1_f_in_cy2,f_out_cy2_f_in_cy3,out_s2);
sum sum3(in_b3,in_a3,f_out_cy2_f_in_cy3,out_cy0,out_s3);

endmodule

module sum (
  input in_b,in_a,in_cy,
  output out_cy,out_sum
);
  assign out_sum = ((in_b ^ in_a) ^ in_cy);
  assign out_cy = ((in_a & in_b) | ((in_b | in_a) & in_cy));
endmodule
