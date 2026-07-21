module flopr_tb();
	parameter N = 32;
	logic        clk, reset;
	logic [N-1:0] d, q;
	int index;
	/* logic array of 64-bit hexadecimal values
	logic [N-1:0] rand_nums [0:9] = '{64'hf96fc86617fda3bf, 64'haba95f49e7514f54, 64'h0e4165b3fc0cfb35,
                                  64'hdd7becde4d00d27c, 64'h1a1c7c717473eccc, 64'he9635ef5ba0848e5,
                                  64'he41a90dd83fd8864, 64'h679155f2c8dad076, 64'hb0e0ca6e088bf590,
                                  64'h8927c27c68930f3e};
	*/
	// logic array of 32-bit hexadecimal values
	logic [N-1:0] rand_nums [0:9] = '{32'hcdd1d5dd, 32'h69fb0092, 32'h68117ba5,
                                   32'hfe890dbb, 32'h10c664fc, 32'hc371b7ae,
                                   32'h4c269e15, 32'h60d92a7a, 32'h8ab1f83a,
                                   32'h1a6f15c8}; 
	//

	// instantiate device under test
	flopr #(N) dut(clk, reset, d, q);
  
	// initialize reset value as true
	initial
		begin
			index = -1;
			reset = 1; // q starting value is 0
		end
  
	// generate clock
	always
		begin
			clk = 1; #5ns; clk = 0; #5ns;
		end
		
   always @(negedge clk)
		begin
			// after first nedegde of clk, we start comparing
			if (index !== -1) 
				begin
					// check that first five are zero
					if (reset == 1 && q !== 0) 
							$display("Error in reset = 1");
				
					// check that last five are correct
					if (reset == 0 && q !== rand_nums[index])
							$display("Error in reset = 0");
				end
				
			index++; #1ns;
			d = rand_nums[index];
		   
			case(index)
				5: reset = 0; 	// change reset value when sixth iteration is reached
				10: $stop;		// end simulation when tenth iteration is reached
			endcase
				
		end
		
endmodule