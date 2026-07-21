// Etapa: MEMORY

module memory 
	(input logic Branch_M, zero_M, InconBr_M,
	 output logic PCSrc_M);

	assign PCSrc_M = (Branch_M & zero_M & ~InconBr_M) | (Branch_M & InconBr_M); // Now Memory can do Branch Register

endmodule
