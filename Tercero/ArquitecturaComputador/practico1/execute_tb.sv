module execute_tb;
  logic AluSrc;
  logic [3:0] AluControl;
  logic [63:0] PC_E, signImm_E, readData1_E, readData2_E;
  logic [63:0] PCBranch_E, aluResult_E, writeData_E;
  logic zero_E;

  // Instantiate the DUT (Device Under Test)
  execute dut (AluSrc, AluControl, PC_E, signImm_E, readData1_E, readData2_E, 
					PCBranch_E, aluResult_E, writeData_E, zero_E);

  // Initialize inputs
  initial begin
    // Test case 1: Addition
    AluSrc = 1'b0;
    AluControl = 4'b0010; // ALU control for addition
    PC_E = 64'h1234567890ABCDEF;
    signImm_E = 64'hFEDCBA9876543210;
    readData1_E = 64'hAABBCCDDEEFF0011;
    readData2_E = 64'h1020304050607080;

    // Delay to allow for computation
    #10ns;

    // Display results
    $display("Test Case 1 - Addition:");
    $display("PCBranch_E = %h", PCBranch_E);
    $display("aluResult_E = %h", aluResult_E);
    $display("writeData_E = %h", writeData_E);
    $display("zero_E = %b", zero_E);

    // Test case 2: OR operation
    AluControl = 4'b0001; // ALU control for OR
    readData1_E = 64'hFEDCBA9876543210;
    readData2_E = 64'h1020304050607080;

    // Delay to allow for computation
    #10ns;

    // Display results
    $display("Test Case 2 - OR Operation:");
    $display("PCBranch_E = %h", PCBranch_E);
    $display("aluResult_E = %h", aluResult_E);
    $display("writeData_E = %h", writeData_E);
    $display("zero_E = %b", zero_E);

    // Test case 3: Zero input
    AluControl = 4'b0000; // ALU control for AND
    readData1_E = 64'h0000000000000000;
    readData2_E = 64'h0000000000000000;

    // Delay to allow for computation
    #10ns;

    // Display results
    $display("Test Case 3 - Zero Input:");
    $display("PCBranch_E = %h", PCBranch_E);
    $display("aluResult_E = %h", aluResult_E);
    $display("writeData_E = %h", writeData_E);
    $display("zero_E = %b", zero_E);

    // Test case 4: ALU control not specified
    AluControl = 4'bXXXX; // Invalid ALU control
    readData1_E = 64'h1122334455667788;
    readData2_E = 64'h99AABBCCDDEEFF00;

    // Delay to allow for computation
    #10ns;

    // Display results
    $display("Test Case 4 - Invalid ALU Control:");
    $display("PCBranch_E = %h", PCBranch_E);
    $display("aluResult_E = %h", aluResult_E);
    $display("writeData_E = %h", writeData_E);
    $display("zero_E = %b", zero_E);
	 
	 // Test case 5: Subtraction
    AluSrc = 1'b0;
    AluControl = 4'b0110; // ALU control for subtraction
    PC_E = 64'hABCDEF1234567890;
    signImm_E = 64'h0123456789ABCDEF;
    readData1_E = 64'hFEDCBA9876543210;
    readData2_E = 64'h1020304050607080;

    // Delay to allow for computation
    #10ns;

    // Display results
    $display("Test Case 5 - Subtraction:");
    $display("PCBranch_E = %h", PCBranch_E);
    $display("aluResult_E = %h", aluResult_E);
    $display("writeData_E = %h", writeData_E);
    $display("zero_E = %b", zero_E);

    // Test case 6: Zero output
    AluControl = 4'b0000; // ALU control for AND
    readData1_E = 64'hAABBCCDDEEFF0011;
    readData2_E = 64'hFEDCBA9876543210;

    // Delay to allow for computation
    #10ns;

    // Display results
    $display("Test Case 6 - Zero Output:");
    $display("PCBranch_E = %h", PCBranch_E);
    $display("aluResult_E = %h", aluResult_E);
    $display("writeData_E = %h", writeData_E);
    $display("zero_E = %b", zero_E);

    // Test case 7: ALU control for passthrough
    AluControl = 4'b0111; // ALU control for passthrough
    readData1_E = 64'hAABBCCDDEEFF0011;
    readData2_E = 64'hFEDCBA9876543210;

    // Delay to allow for computation
    #10ns;

    // Display results
    $display("Test Case 7 - Passthrough:");
    $display("PCBranch_E = %h", PCBranch_E);
    $display("aluResult_E = %h", aluResult_E);
    $display("writeData_E = %h", writeData_E);
    $display("zero_E = %b", zero_E);

    // Test case 8: ALU control for default
    AluControl = 4'b1111; // Invalid ALU control
    readData1_E = 64'hAABBCCDDEEFF0011;
    readData2_E = 64'hFEDCBA9876543210;

    // Delay to allow for computation
    #10ns;

    // Display results
    $display("Test Case 8 - Invalid ALU Control (Default):");
    $display("PCBranch_E = %h", PCBranch_E);
    $display("aluResult_E = %h", aluResult_E);
    $display("writeData_E = %h", writeData_E);
    $display("zero_E = %b", zero_E);

    // Finish simulation
    $stop;
  end

endmodule