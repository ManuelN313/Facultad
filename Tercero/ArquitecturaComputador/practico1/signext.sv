module signext
	(input logic [31:0] a,
	 output logic [63:0] y);
	 
	 logic [10:0] significantbits;
	 logic [8:0] dinmediate;
	 logic [18:0] cbinmediate;
	 
	
	 always_comb
		begin
			significantbits = a[31:21];
			dinmediate = a[20:12];
			cbinmediate = a[23:5];
			
			casez (significantbits)
				11'b111_1100_0010: y = {{55{dinmediate[8]}}, dinmediate}; 		// LDUR
				11'b111_1100_0000: y = {{55{dinmediate[8]}}, dinmediate}; 		// STUR
				11'b101_1010_0???: y = {{45{cbinmediate[18]}}, cbinmediate};   // CBZ
				default: y = 64'b0;                                				// Any instruction
			endcase
		end
			
endmodule