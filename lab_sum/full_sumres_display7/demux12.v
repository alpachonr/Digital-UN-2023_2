module demux12 (in, sel ,out_si,out_no);
	input in;
	input sel;
	output out_si;
	output out_no;
	reg [1:0]temp;
	always @(*)
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
