module maindec
	(input logic [10:0] Op,
	 input logic reset,
	 output logic Reg2Loc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, InconBr, NotAnInstr, ERet,
	 output logic [1:0] ALUOp, ALUSrc);
	 
	logic [11:0] signalValue [0:8] = '{12'b0_00_0_1_0_0_0_10_0_0,
												  12'bX_01_1_1_1_0_0_00_0_0,   
												  12'b1_01_X_0_0_1_0_00_0_0, 
												  12'b1_00_X_0_0_0_1_01_0_0,
												  12'b0_00_X_0_0_0_1_01_1_0,
												  12'b1_1X_0_1_0_0_0_01_0_0,
												  12'b1_00_X_0_0_0_1_01_0_1,
												  12'bX_XX_0_0_0_0_0_XX_0_0,
												  12'b0_00_0_0_0_0_0_00_0_0};
	int index;
	logic isInstr;

	always_comb 
		begin
			isInstr = 1; // Assume Valid Opcode
			index = 8;   // Assume that reset is On
			if (reset === 0) // If reset is Off
				begin
					casez(Op)
						11'b100_0101_1000: index = 0; // ADD
						11'b110_0101_1000: index = 0; // SUB 
						11'b100_0101_0000: index = 0; // AND 
						11'b101_0101_0000: index = 0; // ORR
						11'b111_1100_0010: index = 1; // LDUR
						11'b111_1100_0000: index = 2; // STUR 	 
						11'b101_1010_0???: index = 3; // CBZ
						11'b110_1011_0100: index = 4; // ERET
						11'b110_1010_1001: index = 5; // MRS
						11'b110_1011_0000: index = 6; // BR
						default: begin                
										index = 7;
										isInstr = 0; // Invalid Opcode
									end
					endcase
				end
			{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet, InconBr} = signalValue[index];
			NotAnInstr = ~isInstr;
		end

endmodule