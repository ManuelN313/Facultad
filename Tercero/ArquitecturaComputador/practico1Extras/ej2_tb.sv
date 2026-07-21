module ej2_tb();
	logic a, b, c, clk, Z;
	
	ej2 dut (a, b, c, clk, Z);
	
	always
		begin
			#4; clk = ~clk;
		end
		
	initial
		begin
			a=0; b=0; c=0; #10;
			a=1; #5;
			b=1; #5;
			c=1; #10;
			b=0; c=0; #15 $stop;
		end
		
	initial
		clk = 1;
		
endmodule