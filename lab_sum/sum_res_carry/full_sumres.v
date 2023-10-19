module full_sumres (
	input [3:0]in_a,
	input [3:0] in_b,
	input  op,
	output out_cy0,
	output [3:0] out_s2
	);
	wire cable0;
	wire cable1;
	wire cable2;
	wire [3:0]in_bm; 
	scalarxor ope(in_b,op,in_bm);

	sumres sumres0(in_a[0],in_bm[0],op,out_s2[0],cable0);
	sumres sumres1(in_a[1],in_bm[1],cable0,out_s2[1],cable1);
	sumres sumres2(in_a[2],in_bm[2],cable1,out_s2[2],cable2);
	sumres sumres3(in_a[3],in_bm[3],cable2,out_s2[3],out_cy0);



endmodule
module scalarxor (
input [3:0]arr, 
input sc,
output [3:0]sxor
);
wire [3:0] sc_m;

assign	sc_m={sc,sc,sc,sc};
assign  sxor =sc_m^arr;
endmodule	 
module sumres (
	input a,b,in_cy,
	output out_s,out_c
	);
	assign out_s = ((a ^ b) ^ in_cy);
	assign out_c = ((b & a) | ((a | b) & in_cy));
endmodule

