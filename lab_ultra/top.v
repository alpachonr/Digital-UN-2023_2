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
	parameter LIMIT = 10'd1000;
	parameter MAX = 17'd131071;
	parameter LIMIT2 = 17'd117648;
	parameter MARC10 = 17'd29412;
	parameter MARC20 = 17'd52824;
	parameter MARC30 = 17'd88235;
	reg [9:0] count_0 = 0;
	reg [SIZE-1:0] count_1 = 0;
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
	always @(posedge switch)
	begin
		ti_on <= 1;
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		e = 0;
	end
	assign trigger = ti_on;
	always @(posedge clk_in)
	begin
		if(ti_on)
			begin
				if (count_0 == LIMIT)
					begin
						ul_on <= 1;	
						ti_on <= 0;
					end
				else
						count_0 <= count_0+1;		
			end
	end	
	always @(negedge ti_on)
	begin
		count_0 <= 0;
	end
	always @(posedge signal)
	begin
		ul_off <= 1;
	end
	always @(posedge clk_in)
	begin
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
					count_1 <= count_1 + 1;
			end
	end	
	always @(posedge clk_in)
	begin
		if(ul_off)
			begin
				if (count_1 >= LIMIT2)
					begin
						a<=1 ;
						count_1 <= 0;
						ul_off <= 0;
					end	
				else
					begin
						if(count_1 <= MARC30)
							begin
								if(count_1 <= MARC20)
									begin
										if(count_1 <= MARC10)
											begin
												e<= 1;
												count_1 <= 0;
												ul_off <= 0;
											end
										else
											begin
												d<= 1;
												count_1 <= 0;
												ul_off <= 0;
											end
									end
								else
									begin
										c<= 1;
										count_1 <= 0;
										ul_off <= 0;
									end
							end
						else
							begin
								b<= 1;
								count_1 <= 0;
								ul_off <= 0;
							end
					end		
			end
	end
endmodule
