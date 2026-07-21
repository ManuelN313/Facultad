module alu_tb();
	logic [63:0] a, b, result;
	logic [3:0] ALUControl;
	logic zero;
	
	logic [63:0] aInputs [0:2] = '{64'h200, 64'hFFFFFFFFFFFFFFEC, 64'hFEC7};
	logic [63:0] bInputs [0:2] = '{64'h36, 64'hFFFFFFFFFFFFFBFC, 64'hFFFFFFFFFFFFFC1C};
	logic [63:0] expectedOut [0:17] = '{64'h0, 64'hFFFFFFFFFFFFFBEC, 64'hFC04, 64'h236, 64'hFFFFFFFFFFFFFFFC, 64'hFFFFFFFFFFFFFEDF,
													64'h236, 64'hFFFFFFFFFFFFFBE8, 64'hFAE3, 64'h1CA, 64'h3F0, 64'h102AB,
													64'h36, 64'hFFFFFFFFFFFFFBFC, 64'hFFFFFFFFFFFFFC1C, 64'h1, 64'h1, 64'h1}; 
	
	logic [3:0] aluInputs [0:5] = '{4'b0000, 4'b0001, 4'b0010, 4'b0110, 
											  4'b0111, 4'b1111};
											  
	alu dut(a, b, ALUControl, result, zero);
	
	initial
		begin
			for (int i = 0; i < 6; i++) // Iterate aluInputs
				begin
				ALUControl = aluInputs[i];
				for (int j = 0; j < 3; j++) // Iterate aInputs and b Inputs 
					begin
						a = aInputs[j];
						b = bInputs[j];
						#5ns;
						if (result !== expectedOut[i*3+j])
							$display("Not expected result in iteration %d", i*3+j);
						if (result == 0 & zero !== 1)
							$display("Zero gate problem in iteration %d", i*3+j);
					end
				end
			$stop;
		end
 
 endmodule