module maindec_tb();
	logic [10:0] Op;
	logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
	logic [1:0] ALUOp;
	
	logic [10:0] opInputs [0:7] = '{11'b111_1100_0010, 11'b111_1100_0000, 11'b101_1010_0000,
											  11'b100_0101_1000, 11'b110_0101_1000, 11'b100_0101_0000,
											  11'b101_0101_0000, 11'b000_0000_0001};
											  
	logic [8:0] outExpected [0:7] = '{9'b0_1_1_1_1_0_0_00, 9'b1_1_0_0_0_1_0_00, 9'b1_0_0_0_0_0_1_01,
												 9'b0_0_0_1_0_0_0_10, 9'b0_0_0_1_0_0_0_10, 9'b0_0_0_1_0_0_0_10,
												 9'b0_0_0_1_0_0_0_10, 9'b0_0_0_0_0_0_0_00};
	logic [8:0] signalMerge;
											
	// instantiate device under test
	maindec dut(Op, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
	
	initial
		begin
			for (int i = 0; i < 8; i++) 
				begin
					#1ns;
					Op = opInputs[i];
					#1ns;
					signalMerge = {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp};
					#1ns;
					if (signalMerge !== outExpected[i]) 
						$display("Error in iteration %d", i);
				end
			$stop;
		end
		
endmodule