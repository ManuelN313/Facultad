module fetch
	(input logic PCSrc_F, clk, reset,
	 input logic[63:0] PCBranch_F,
	 output logic[63:0] imem_addr_F);
	
	logic [63:0] pc_in, add_out;
	logic [63:0] add_in = 3'd4;
	
	adder Add(imem_addr_F, add_in, add_out);
	mux2 Mux(add_out, PCBranch_F,PCSrc_F,pc_in);
	flopr PC(clk, reset, pc_in, imem_addr_F);
	
endmodule