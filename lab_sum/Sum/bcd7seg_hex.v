/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module bcd7seg_hex (
	input s3, s2, s1, s0, c0,
	output a, b, c, d, e, f, g, h
	);
	wire s4;
	wire s5;
	wire s6;
	wire s7;
	assign h = ~c0;
	assign s6 = ~ s3;
	assign s5 = ~ s2;
	assign s4 = ~ s1;
	assign s7 = ~ s0;
	assign a = ((s0 & s4 & s5 & s6) | (s7 & s4 & s2) | (s0 & s1 & s5 & s3) | (s4 & s2 & s3));
	assign b = ((s0 & s4 & s2 & s6) | (s7 & s1 & s2) | (s0 & s1 & s3) | (s7 & s2 & s3));
	assign c = ((s7 & s1 & s5 & s6) | (s7 & s2 & s3) | (s1 & s2 & s3));
	assign d = ((s0 & s4 & s5 & s6) | (s7 & s4 & s2 & s6) | (s0 & s1 & s2) | (s7 & s1 & s5 & s3));
	assign e = ((s0 & s6) | (s0 & s4 & s5) | (s4 & s2 & s6));
	assign f = ((s0 & s5 & s6) | (s0 & s1 & s6) | (s1 & s5 & s6) | (s4 & s2 & s3));
	assign g = ((s0 & s1 & s2 & s6) | (s4 & s5 & s6));
endmodule
