module signext_tb();
	logic [31:0] a;
	logic [63:0] y;
	
	/* Instructions         Enconding       Expected Output
	
	1) add x0, x1, x2   		8b020020        0000000000000000
   2) sub x3, x4, x5 		cb050083			 0000000000000000
   3) and x6, x7, x8			8a0800e6        0000000000000000
   4) orr x9, x10, x11		aa0b0149        0000000000000000
   5) ldr x0, [x1, #100]   f8464020			 0000000000000064
   6) ldr x0, [x1, #-100]  f859c020			 ffffffffffffff9c
   7) str x2, [x3, #-32]   f81e0062			 ffffffffffffffe0
   8) str x2, [x3, #32]    f8001062        0000000000000001
	9) cbz XZR, 20				b400001f        0000000000000000
   10) cbz XZR, 0          b4fffeff        fffffffffffffff7

	*/
	
	logic [31:0] instructions [0:9] = '{32'h8b020020, 32'hcb050083, 32'h8a0800e6,
													32'haa0b0149, 32'hf8464020, 32'hf859c020,
													32'hf81e0062, 32'hf8001062, 32'hb400001f,
													32'hb4fffeff};
													
	logic [63:0] yexpected [0:9] = '{64'h0000000000000000, 64'h0000000000000000, 64'h0000000000000000,
												64'h0000000000000000, 64'h0000000000000064, 64'hffffffffffffff9c,
												64'hffffffffffffffe0, 64'h0000000000000001, 64'h0000000000000000,
												64'hfffffffffffffff7};
	// instantiate device under test
	signext dut(a, y);
	
	initial
		begin
			for (int i = 0; i < 10; i++) 
				begin
					a = instructions[i];
					#5ns;
					if (y !== yexpected[i]) 
						$display("Error at instruction %d", i);
				end
			$stop;
		end

endmodule
		