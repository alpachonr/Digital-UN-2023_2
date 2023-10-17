module full_sumres (
	input in_b0, in_b1, in_b2, in_b3, in_a0, in_a1, in_a2, in_a3, in_cy, ope,
	output out_s0, out_s1, out_s2, out_s3, out_cy0
	);
	wire f_out_cy0_f_in_cy1;
	wire f_out_cy1_f_in_cy2;
	wire f_out_cy2_f_in_cy3;

	sumres sumres0(in_b0,in_a0,in_cy,op,f_out_cy0_f_in_cy1,out_s0);
	sumres sumres1(in_b1,in_a1,f_out_cy0_f_in_cy1,op,f_out_cy1_f_in_cy2,out_s1);
	sumres sumres2(in_b2,in_a2,f_out_cy1_f_in_cy2,op,f_out_cy2_f_in_cy3,out_s2);
	sumres sumres3(in_b3,in_a3,f_out_cy2_f_in_cy3,op,out_cy0,out_s3);

endmodule
