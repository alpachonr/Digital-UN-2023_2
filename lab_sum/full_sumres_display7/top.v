module top (in_a,in_b,op,clk_in,a,b,c,d,e,f,g,sign0,dis1,dis0);
	input [3:0] in_a;
	input [3:0] in_b;
	input op;
	input clk_in;
	output a,b,c,d,e,f,g,sign0,dis1,dis0;
	wire uno;
	wire [3:0] dos; 
	wire [3:0] tres;
	wire [3:0] cuatro;
	wire [3:0] cinco;
	wire seis;
	
	clk100hz divi(clk_in,seis);
	demux12 demux(1'b1,seis,dis0,dis1);
	full_sumres sum(in_a,in_b,op,uno,dos,sign0);
	bin_2_bcd deco1(uno,dos,tres,cuatro);
	mux21_4bit mux(tres,cuatro,seis,cinco); 
	deco_7seg deco2(cinco,a,b,c,d,e,f,g);
	
endmodule	
module bin_2_bcd (carryout,out,d,u);
  input carryout;
  input [3:0] out;
  output [3:0]d;
  output [3:0]u;
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  assign d[1] = ((carryout & out[2]) | (carryout & out[3]));
  assign s0 = ~ carryout;
  assign s1 = ~ out[3];
  assign s2 = ~ out[2];
  assign s3 = ~ out[1];
  assign d[2]=0;
  assign d[3]=0;
  assign d[0] = ((s0 & out[3] & out[1]) | (s0 & out[3] & out[2]) | (carryout & s1 & s2) | (out[3] & out[1] & out[2]));
  assign u[3] = ((s0 & out[3] & s3 & s2) | (carryout & s1 & out[1] & s2) | (carryout & out[3] & s3 & out[2]));
  assign u[2] = ((s0 & s1 & out[2]) | (s0 & out[1] & out[2]) | (carryout & s3 & s2) | (carryout & out[3] & s2));
  assign u[1] = ((carryout & out[0] & out[1] & out[2]) | (s0 & out[3] & s3 & out[2]) | (carryout & s1 & s3 & s2) | (carryout & out[3] & out[1] & s2) | (s0 & s1 & out[1]) | (s1 & out[1] & out[2]));
  assign u[0] = ((s0 & out[0]) | (s1 & out[0]) | (out[0] & s3) | (out[0] & s2));
endmodule
module deco_7seg ( v, a,b,c,d,e,f,g);
  input [3:0]v;
  output a;
  output b;
  output c;
  output d;
  output e;
  output f;
  output g;
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  assign s2 = ~ v[3];
  assign s1 = ~ v[2];
  assign s0 = ~ v[1];
  assign s3 = ~ v[0];
  assign a = ((v[0] & s0 & s1 & s2) | (s3 & s0 & v[2]));
  assign b = ((v[0] & s0 & v[2]) | (s3 & v[1] & v[2]));
  assign c = (s3 & v[1] & s1);
  assign d = ((v[0] & s0 & s1 & s2) | (s3 & s0 & v[2]) | (v[0] & v[1] & v[2]));
  assign e = (v[0] | (s0 & v[2]));
  assign f = ((v[0] & s1 & s2) | (v[0] & v[1]) | (v[1] & s1));
  assign g = ((v[0] & v[1] & v[2]) | (s0 & s1 & s2));
endmodule

module clk100hz (clk_in,clk_out);
  input clk_in;
  output reg clk_out = 0;
/* count = (clk_in / clk_out) */
/* Ejemplo 1 */
/* count = 25E6 = 25000000 = (25E6 Mhz)/(1 Hz) */
/* SIZE = 2^25 = 33.5E6 lo contiene */
/* Ejemplo 2 */
/* count = (50E6 Mhz)/(1 Hz) = 50E6 = 50000000 */
/* SIZE = 2^26 = 67.5E6 lo contiene */
/* Configuración a 10 Hz */
/* count = (12E6 Mhz)/(10 Hz) = 12E5 = 1200000 */
/* SIZE = 2^21 = 1.049E6 lo contiene */
parameter SIZE = 7; 
parameter LIMIT = 7'd100;
reg [SIZE-1:0] count = 0;
always@(posedge clk_in)
begin
  if(count == LIMIT)
  begin
    count <= 0;
    clk_out <= ~clk_out;
  end
  else
  begin
    count <= count + 1;
  end
end
endmodule

module mux21_4bit (in_si,in_no,sel,sal);
	input [3:0] in_si;
	input [3:0] in_no;
	input sel;
	output [3:0] sal;
		assign sal = sel? in_no:in_si;
endmodule
module demux12 (in, sel ,out_si,out_no);
	input in;
	input sel;
	output out_si;
	output out_no;
	reg [1:0]temp;
	always@(*)	
		begin
			if (sel==1)
				begin
					temp[0]=1;
					temp[1]=0;
				end		
			else
				begin
					temp[1]=1;
					temp[0]=0;
				end		
		end		
	assign out_si=temp[0];
	assign out_no=temp[1];
endmodule	

module full_sumres (in_a,in_b,op,out_cy0,out_s2,sign0);
	input [3:0]in_a;
	input [3:0] in_b;
	input  op;
	output out_cy0;
	output [3:0] out_s2;
	output sign0;
	reg [3:0]temporal;
	reg [3:0]t_a;
	reg [3:0]t_b;
	wire t_cy0;
	reg sign;
	
	always @ (in_a,in_b,op)
		begin
			if (in_a<in_b)
				begin
					if (op==1) 
							sign= 1'b1;
					else 
							sign = 1'b0;
					t_a=in_b;			
					t_b=in_a;
				end	
			else
				begin
					sign= 1'b0;
					t_a=in_a;
					t_b=in_b;
				end
		end			
	
	
	wire cable0;
	wire cable1;
	wire cable2;
	wire [3:0]in_bm; 
	assign sign0=~sign;
	scalarxor ope(t_b,op,in_bm);
	sumres sumres0(t_a[0],in_bm[0],op,out_s2[0],cable0);
	sumres sumres1(t_a[1],in_bm[1],cable0,out_s2[1],cable1);
	sumres sumres2(t_a[2],in_bm[2],cable1,out_s2[2],cable2);
	sumres sumres3(t_a[3],in_bm[3],cable2,out_s2[3],t_cy0);
	assign out_cy0=(~op)&t_cy0;		
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
