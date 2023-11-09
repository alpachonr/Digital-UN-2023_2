module mux21_4bit (in_si,in_no,sel,sal);
	input [3:0] in_si;
	input [3:0] in_no;
	input sel;
	output [3:0] sal;

	assign sal = sel? in_no:in_si;
endmodule


