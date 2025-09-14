`timescale 1ns/1ps
`include "ALU.v"
module ALU_tb;

  // Parameters
  localparam Input_data_width  = 8;
  localparam Output_data_width = 8;

  // Testbench signals
  reg signed [Input_data_width-1:0] A, B;
  reg [3:0] ALU_FUN;
  reg CLK, RST;

  wire signed [Output_data_width-1:0] ALU_OUT;
  wire OUT_VALID;

  // Instantiate DUT
  ALU #(
    .Input_data_width(Input_data_width),
    .Output_data_width(Output_data_width)
  ) DUT (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN),
    .CLK(CLK),
    .RST(RST),
    .ALU_OUT(ALU_OUT),
    .OUT_VALID(OUT_VALID)
  );

  // Clock generation
  initial CLK = 0;
  always #5 CLK = ~CLK; // 100 MHz clock

  // Expected values
  reg signed [Output_data_width-1:0] exp_out;
  reg exp_valid;

  // Task to apply a test with debugging
  task run_test;
    input signed [Input_data_width-1:0] tA;
    input signed [Input_data_width-1:0] tB;
    input [3:0] tFUN;
    input signed [Output_data_width-1:0] expected_out;
    input expected_valid;
    begin
      A = tA;
      B = tB;
      ALU_FUN = tFUN;
      @(posedge CLK); 
      @(posedge CLK); // Wait extra cycle to ensure propagation
      #1; // Small delay for signal settling
      
      exp_out   = expected_out;
      exp_valid = expected_valid;

      // Debug information
      $display("DEBUG: ALU_FUN=%b, [3:2]=%b, [1:0]=%b", ALU_FUN, ALU_FUN[3:2], ALU_FUN[1:0]);
      $display("DEBUG: Enable signals - Arith:%b, Logic:%b, CMP:%b, Shift:%b", 
               DUT.Arith_Enable_internal, DUT.Logic_Enable_internal, 
               DUT.CMP_Enable_internal, DUT.Shift_Enable_internal);
      $display("DEBUG: Unit outputs - Arith:%0d, Logic:%0d, CMP:%0d, Shift:%0d",
               DUT.Arith_out_internal, DUT.Logic_out_internal,
               DUT.CMP_out_internal, DUT.Shift_out_internal);
      $display("DEBUG: Unit flags - Arith:%b, Logic:%b, CMP:%b, Shift:%b",
               DUT.Arith_Flag_internal, DUT.Logic_Flag_internal,
               DUT.CMP_Flag_internal, DUT.Shift_Flag_internal);

      if (ALU_OUT !== exp_out || OUT_VALID !== exp_valid) begin
        $display("ERROR: time=%0t, OP=%b, A=%0d, B=%0d, DUT_OUT=%0d, EXP_OUT=%0d, DUT_VALID=%b, EXP_VALID=%b",
                 $time, ALU_FUN, A, B, ALU_OUT, exp_out, OUT_VALID, exp_valid);
      end else begin
        $display("PASS : time=%0t, OP=%b, A=%0d, B=%0d, OUT=%0d",
                 $time, ALU_FUN, A, B, ALU_OUT);
      end
      $display(""); // Empty line for readability
    end
  endtask

  // Test sequence
  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars;
    $display("==== Starting ALU Testbench ====");

    // Reset
    RST = 0; A = 0; B = 0; ALU_FUN = 4'b0000;
    repeat(3) @(posedge CLK);
    RST = 1;
    repeat(2) @(posedge CLK); // Allow time for reset to propagate

    // Arithmetic (ALU_FUN[3:2] = 00)
    $display("=== ARITHMETIC TESTS ===");
    run_test(10, 5, 4'b0000, 15, 1); // ADD
    run_test(15, 7, 4'b0001, 8, 1);  // SUB

    // Logic (ALU_FUN[3:2] = 01)
    $display("=== LOGIC TESTS ===");
    run_test(8'hF0, 8'h0F, 4'b0100, 8'h00, 1); // AND
    run_test(8'hF0, 8'h0F, 4'b0101, 8'hFF, 1); // OR

    // Compare (ALU_FUN[3:2] = 10)
    $display("=== COMPARE TESTS ===");
    run_test(25, 25, 4'b1001, 1, 1);  // EQ → 1 
    run_test(30, 10, 4'b1010, 2, 1);  // GT → 2 
    run_test(10, 30, 4'b1011, 3, 1);  // LT → 3 

    // Shift (ALU_FUN[3:2] = 11)
    $display("=== SHIFT TESTS ===");
// ALU_FUN = 1100 → A>>1
run_test(8'h0F, 1, 4'b1100, 8'h07, 1); // 0x0F >> 1 = 0x07
// ALU_FUN = 1101 → A<<1
run_test(8'h0F, 1, 4'b1101, 8'h1E, 1); // 0x0F << 1 = 0x1E
// ALU_FUN = 1110 → B>>1
run_test(8'h0F, 4, 4'b1110, 2, 1);     // 4 >> 1 = 2
// ALU_FUN = 1111 → B<<1
run_test(8'h0F, 4, 4'b1111, 8, 1);     // 4 << 1 = 8

    $display("==== Testbench Finished ====");
    $finish;
  end

endmodule