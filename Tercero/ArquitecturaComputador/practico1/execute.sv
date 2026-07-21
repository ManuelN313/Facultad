module execute
	(input logic AluSrc,
	 input logic [3:0] AluControl,
	 input logic [63:0] PC_E, signImm_E, readData1_E, readData2_E,
	 output logic [63:0] PCBranch_E, aluResult_E, writeData_E,
	 output logic zero_E);
	 
	logic [63:0] slOut, muxOut;
	 
	sl2 Shift(signImm_E, slOut);
	adder Add(PC_E, slOut, PCBranch_E);
	mux2 Mux(readData2_E, signImm_E, AluSrc, muxOut);
	alu Alu(readData1_E, muxOut, AluControl, aluResult_E, zero_E);
	assign writeData_E = readData2_E;
	
endmodule