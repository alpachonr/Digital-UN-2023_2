module full_sumres (in_a,in_b,op,out_cy0,out_s2,sign0);
	input [3:0]in_a;
	input [3:0] in_b;
	input  op;
	output out_cy0;
	output [3:0] out_s2;
	output sign0;
	reg operar;
	reg [3:0]temporal;
	reg [3:0]t_a;
	reg [3:0]t_b;
	wire t_cy0;
	reg sign;
	
	
	always @ (in_a,in_b,op)
		begin
			if (op ==1)
				begin
					if (in_a < in_b) 
						begin
							temporal= in_a;
							t_a =t_b;
							t_b= temporal;
							sign= 1'b0;
							operar=op;
						end
					else if (in_a==in_b)
						begin
							sign= 1'b1;
							t_a= {~sign,~sign,~sign,~sign};
							t_b= {~sign,~sign,~sign,~sign};
							operar=1'b0;
						end
					else
						begin
							operar=op;
							sign=1'b1;
						end
				end
			else if(op!=1)
				begin
					sign=1'b1;
					t_a=in_a;
					t_b=in_b;
					operar=op;
				end	
		end			
	
	
	wire cable0;
	wire cable1;
	wire cable2;
	wire [3:0]in_bm; 
	assign sign0=sign;
	scalarxor ope(t_b,operar,in_bm);
	sumres sumres0(t_a[0],in_bm[0],operar,out_s2[0],cable0);
	sumres sumres1(t_a[1],in_bm[1],cable0,out_s2[1],cable1);
	sumres sumres2(t_a[2],in_bm[2],cable1,out_s2[2],cable2);
	sumres sumres3(t_a[3],in_bm[3],cable2,out_s2[3],t_cy0);

	
assign out_cy0=(~operar)&t_cy0 ;		
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
module sumres (a,b,in_cy,out_s,out_c);
	input a;
	input b;
	input in_cy;
	output out_s;
	output out_c;
	
	assign out_s = ((a ^ b) ^ in_cy);
	assign out_c = ((b & a) | ((a | b) & in_cy));

endmodule
