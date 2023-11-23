
module sum (
	input in_b,in_a,in_cy,
	output out_cy,out_sum
	);
	assign out_sum = ((in_b ^ in_a) ^ in_cy);
	assign out_cy = ((in_a & in_b) | ((in_b | in_a) & in_cy));
endmodule
