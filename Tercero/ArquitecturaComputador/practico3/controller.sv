// CONTROLLER

module controller(input logic reset, ExcAck, ExtIRQ,
						input logic [10:0] instr,
						output logic [3:0] AluControl, EStatus,
						output logic [1:0] AluSrc,
						output logic reg2loc, regWrite, Branch, inconBr, memtoReg, 
										 memRead, memWrite, Exc, ERet, ExtIAck);
											
	logic [1:0] AluOp_s;
	logic NotAnInstr;
											
	maindec 	decPpal 	(.Op(instr), 
							.reset(reset),
							.Reg2Loc(reg2loc), 
							.ALUSrc(AluSrc), 
							.MemtoReg(memtoReg), 
							.RegWrite(regWrite), 
							.MemRead(memRead), 
							.MemWrite(memWrite), 
							.Branch(Branch),
							.InconBr(inconBr),
							.NotAnInstr(NotAnInstr),
							.ALUOp(AluOp_s),
							.ERet(ERet));	
					
								
	aludec 	decAlu 	(.funct(instr), 
							.aluop(AluOp_s), 
							.alucontrol(AluControl));
							
	assign Exc = NotAnInstr | ExtIRQ;
	assign ExtIAck = (ExcAck === 1 && ExtIRQ === 1)? 1'b1: 1'b0;
							
	always_comb
		begin
			if (reset === 1)
				EStatus = 4'b0000;
			else if (NotAnInstr === 1)
				EStatus = 4'b0010;
			else if (ExtIRQ === 1)
				EStatus = 4'b0001;
			else
				EStatus = 4'b0000;
		end 
	
endmodule
