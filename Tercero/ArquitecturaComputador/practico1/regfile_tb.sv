module regfile_tb();
	logic clk, we3;
	logic [4:0] ra1, ra2, wa3;
	logic [63:0] wd3, rd1, rd2;
	
	logic [63:0] expectedOut [0:31] = '{
		64'h0000000000000000, 64'h0000000000000001, 64'h0000000000000002, 64'h0000000000000003,
		64'h0000000000000004, 64'h0000000000000005, 64'h0000000000000006, 64'h0000000000000007,
		64'h0000000000000008, 64'h0000000000000009, 64'h000000000000000A, 64'h000000000000000B,
		64'h000000000000000C, 64'h000000000000000D, 64'h000000000000000E, 64'h000000000000000F,
		64'h0000000000000010, 64'h0000000000000011, 64'h0000000000000012, 64'h0000000000000013,
		64'h0000000000000014, 64'h0000000000000015, 64'h0000000000000016, 64'h0000000000000017,
		64'h0000000000000018, 64'h0000000000000019, 64'h000000000000001A, 64'h000000000000001B,
		64'h000000000000001C, 64'h000000000000001D, 64'h000000000000001E, 64'h0000000000000000
	};
	
	int index;
	
	// instantiate device under test
	regfile dut(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
	
	// generate clock
	always
		begin
			clk = 1; #5ns; clk = 0; #5ns; 
		end
		
	initial
		begin
			index = -1;
			we3 = 0;
			wa3 = 0;
			wd3 = 0;
		end
		
	always @ (negedge clk)
		begin
			// after first nedegde of clk, we start comparing
			if (index < 32 && index !== -1)
				begin
					if (rd1 !== expectedOut[index])
						$display("Error with rd1 in iteration %d", index);
						
					if (rd2 !== expectedOut[index])
						$display("Error with rd2 in iteration %d", index);
				end
				
			index++; #1ns;
			
			case(index)
				32: begin
						$display("Enable Write on Register");
						ra1 = 1; #1ns; // read register X1
						$display("Value of X1 before assignment is %d", rd1);
						wa3 = 1; #1ns; // allow register write
						we3 = 1; #1ns; // write register X1
						wd3 = 64'h000000000000001A; // new value
					 end
				33: begin
						ra1 = 31; #1ns; // read register X31
						$display("Value of X31 before assignment is %d", rd1);
						we3 = 31; #1ns; // write register X31
						wd3 = 64'h00000000000000DE; // new value
					 end
				34: begin
						$display("Disable Write on Register");
						ra1 = 15; #1ns  // read regiter X15
						$display("Value of X15 before assignment is %d", rd1);
						wa3 = 0; #1ns;	 // disable register write
						we3 = 15; #1ns; // write register X
						wd3 = 64'h0000000000000FF; // new value
					 end
				35: $stop;
				default: begin // index < 32
								ra1 = index; 
								#1ns;
								ra2 = index;
							end
			endcase
		end
		
	always @ (posedge clk)
		begin
			#1ns; // wait for register change
			case(index)
				32: $display("Value of X1 after assignment is %d", rd1);
				33: $display("Value of X31 after assignment is %d", rd1);
				34: $display("Value of X15 after assignment is %d", rd1);
			endcase
		end

endmodule