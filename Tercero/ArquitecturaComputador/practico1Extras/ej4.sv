module ej4
	(input logic Clk, ShiftIn, load, ShiftEn,
	 input logic [3:0] ParallelIn,
	 output logic ShiftOut,
	 output logic [3:0] RegContent);
	 
	logic [3:0] shift_reg;
	
	always_ff @ (posedge Clk)
		begin
			if(load === 1)
				shift_reg <= ParallelIn;
			else if (ShiftEn === 1)
				shift_reg <= {shift_reg[2:0], ShiftIn};
		end

	always_comb	
		begin
			ShiftOut = shift_reg[3];
			RegContent = shift_reg;
		end

endmodule