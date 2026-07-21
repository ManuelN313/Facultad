module fetch_tb();
	logic PCSrc_F, clk, reset;
	logic [63:0] PCBranch_F, imem_addr_F;
	
	int iterator;
	
	// instantiate device under test
	fetch dut(PCSrc_F, clk, reset, PCBranch_F, imem_addr_F);
	
	initial
		begin
			reset = 1;
			PCSrc_F = 0;
			iterator = -1;
			PCBranch_F = 64'h3A7F9E24D67CAB81;
		end
	
	// generate clock
	always
		begin
			clk = 1; #5ns; clk = 0; #5ns;
		end
	
	always @ (negedge clk)
		begin
			if (iterator !== -1)
				$display("PC = %d in iteration %d", imem_addr_F,  iterator);
			
			iterator++; #1ns;
			
			case(iterator)
				5: reset = 0;
				10: PCSrc_F = 1;
				12: $stop;
			endcase
				
		end
	
endmodule
