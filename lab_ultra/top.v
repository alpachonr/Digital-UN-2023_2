module top(switch,signal,clk_in,trigger,l_a,l_b,l_c,l_d,l_e);
	input switch;
	input signal;
	input clk_in;
	output trigger;
	output l_a;
	output l_b;
	output l_c;
	output l_d;
	output l_e;
	parameter SIZE = 17; 
	parameter LIMIT = 17'd1000;
	parameter MAX = 17'd131071;
	parameter ONE = 17'd1;
	parameter ZERO = 17'd0;
	parameter LIMIT2 = 17'd117648;
	parameter MARC10 = 17'd29412;
	parameter MARC20 = 17'd52824;
	parameter MARC30 = 17'd88235;
	reg [SIZE-1:0] count_0 = ZERO;
	reg [SIZE-1:0] count_1 = ZERO;
	reg ti_on = 0;
	reg ul_on = 0;
	reg ul_off= 0;
	reg a = 0;
	reg b = 0;
	reg c = 0;
	reg d = 0;
	reg e = 0;
	assign l_a= ~a;
	assign l_b= ~b;
	assign l_c= ~c;
	assign l_d= ~d;
	assign l_e= ~e;
	assign trigger = ti_on;
	always @(posedge clk_in,posedge switch,posedge signal)
		begin
			if(switch)
				begin
					ti_on <= 1;
				end
			if(ti_on)
				begin
					if (count_0 == LIMIT)
						begin
							ul_on <= 1;	
							ti_on <= 0;
						end
					else
							count_0 <= count_0+ONE;		
				end
			if(ul_on)
				begin
					if (ul_off)
						begin
							ul_on <= 0;
						end
					else if(count_1 == MAX)
						begin
							ul_on <= 0;
						end
					else
						count_1 <= count_1 + ONE;
				end
			if(signal)
				begin
					ul_off <= 1;
				end
			if(ul_off)
				begin
					if (count_1==ZERO)
						begin
							a <= a;
							b <= b;
							c <= c;
							d <= d;
							e <= e;
						end
					else if (count_1 >= LIMIT2)
						begin
							a <= 1;
							b <= 0;
							c <= 0;
							d <= 0;
							e <= 0;
							count_1 <= ZERO;
							ul_off <= 0;
							count_0 <= ZERO;
						end	
					else
						begin
							if(count_1 <= MARC30)
								begin
									if(count_1 <= MARC20)
										begin
											if(count_1 <= MARC10)
												begin
													a <= 0;
													b <= 0;
													c <= 0;
													d <= 0;
													e <= 1;
													count_1 <= ZERO;
													ul_off <= 0;
													count_0 <= ZERO;
												end
											else
												begin
													a <= 0;
													b <= 0;
													c <= 0;
													d <= 1;
													e <= 0;
													count_1 <= ZERO;
													ul_off <= 0;
													count_0 <= ZERO;
												end
										end
									else
										begin
											a <= 0;
											b <= 0;
											c <= 1;
											d <= 0;
											e <= 0;
											count_1 <= ZERO;
											ul_off <= 0;
											count_0 <= ZERO;
										end
								end
							else
								begin
									a <= 0;
									b <= 1;
									c <= 0;
									d <= 0;
									e <= 0;
									count_1 <= ZERO;
									ul_off <= 0;
									count_0 <= ZERO;
								end
						end		
				end
		
		end
endmodule
