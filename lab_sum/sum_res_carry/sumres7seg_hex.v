module sumres7seg_hex (
	input x0,x1,x2,x3,y0,y1,y2,y3,carry_in,op,
	output led_a,led_b,led_c,led_d,led_e,led_f,led_g,led_h);

	wire first;
	wire second;
	wire third;
	wire fourth;
	wire fifth;
	full_sumres full_sumres0(x0,x1,x2,x3,y0,y1,y2,y3,carry_in,op,first,second,third,fourth,fifth);
	bcd7seg_hex deco(fourth,third,second,first,fifth,led_a,led_b,led_c,led_d,led_e,led_f,led_g,led_h);
endmodule	


