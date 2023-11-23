module sum7seg_hex (
	input x0,x1,x2,x3,y0,y1,y2,y3,carry_in,
	output led_a,led_b,led_c,led_d,led_e,led_f,led_g,led_h);

	wire first;
	wire second;
	wire third;
	wire fourth;
	wire fifth;
	full_sum full_sum0(x0,x1,x2,x3,y0,y1,y2,y3,carry_in,first,second,third,fourth,fifth);
	bcd7seg_hex deco(fourth,third,second,first,fifth,led_a,led_b,led_c,led_d,led_e,led_f,led_g,led_h);
endmodule	


