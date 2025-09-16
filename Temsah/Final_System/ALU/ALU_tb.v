`timescale 1ns/1ps
`include "ALU.v"

module ALU_tb;

  // Parameters
  localparam Input_data_width  = 8;
  localparam Output_data_width = 16;

  // Testbench signals
  reg  [Input_data_width-1:0] A, B;
  reg [3:0] ALU_FUN;
  reg CLK, RST;
  reg ALU_EN;   // decoder enable

  wire [Output_data_width-1:0] ALU_OUT;
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
    .ALU_EN(ALU_EN),
    .ALU_OUT(ALU_OUT),
    .OUT_VALID(OUT_VALID)
  );

  // Clock generation
  initial begin
    CLK = 0;
  end
  always #5 CLK = ~CLK; // 100 MHz clock (10 ns period)

  // Expected values (unsigned storage for bitwise comparison)
  reg [Output_data_width-1:0] exp_out_bits;
  reg exp_valid;

  // Counters
  integer pass_count = 0;
  integer fail_count = 0;
  integer total_tests = 0;

  // Task to apply a test with robust timing (pulses ALU_EN one cycle,
  // samples right after the posedge where the unit produces the result)
  task run_test;
    input [Input_data_width-1:0] tA;
    input  [Input_data_width-1:0] tB;
    input [3:0] tFUN;
    input  [Output_data_width-1:0] expected_out_signed; // can be negative for arithmetic
    input expected_valid_in;
    reg [Output_data_width-1:0] expected_bits_local;
    begin
      // Align inputs: change at negedge so they are stable before posedge
      @(negedge CLK);
      A = tA;
      B = tB;
      ALU_FUN = tFUN;

      // Compute expected bit pattern (two's complement for negatives)
      expected_bits_local = expected_out_signed; // assignment to unsigned reg yields two's-complement bits
      exp_out_bits = expected_bits_local;
      exp_valid = expected_valid_in;

      // Pulse ALU_EN for exactly one clock cycle
      ALU_EN = 1;
      @(posedge CLK); // internal units will sample ALU_EN on this posedge
      #1;             // small delta to allow sequential registers to update
      // Sample now: OUT_VALID should be asserted here if unit pulses on that posedge
      // Capture DUT outputs for checking
      // Deassert ALU_EN after sampling to avoid prolonged enable
      ALU_EN = 0;

      // Debug prints (internal signals visible via hierarchical reference)
      $display("DEBUG @%0t: FUN=%b [grp=%b,cmd=%b], A=%0d, B=%0d", $time, ALU_FUN, ALU_FUN[3:2], ALU_FUN[1:0], A, B);
      $display("DEBUG : Unit outputs - Arith:%0d, Logic:%0d, CMP:%0d, Shift:%0d",
               DUT.Arith_out_internal, DUT.Logic_out_internal,
               DUT.CMP_out_internal, DUT.Shift_out_internal);
      $display("DEBUG : Unit flags - Arith:%b, Logic:%b, CMP:%b, Shift:%b",
               DUT.Arith_Flag_internal, DUT.Logic_Flag_internal,
               DUT.CMP_Flag_internal, DUT.Shift_Flag_internal);
      $display("DEBUG : ALU_OUT=%0d (0x%0h), OUT_VALID=%b ; EXPECT OUT=0x%0h (%0d), EXP_VALID=%b",
               ALU_OUT, ALU_OUT, OUT_VALID, exp_out_bits, $signed(exp_out_bits), exp_valid);

      // Check result immediately (we sampled after the posedge update)
      total_tests = total_tests + 1;
      if ((ALU_OUT !== exp_out_bits) || (OUT_VALID !== exp_valid)) begin
        $display("ERROR: time=%0t, OP=%b, A=%0d, B=%0d, DUT_OUT=0x%0h (%0d), EXP_OUT=0x%0h (%0d), DUT_VALID=%b, EXP_VALID=%b",
                 $time, ALU_FUN, A, B, ALU_OUT, $signed(ALU_OUT), exp_out_bits, $signed(exp_out_bits),
                 OUT_VALID, exp_valid);
        fail_count = fail_count + 1;
      end else begin
        $display("PASS : time=%0t, OP=%b, A=%0d, B=%0d, OUT=0x%0h (%0d)",
                 $time, ALU_FUN, A, B, ALU_OUT, $signed(ALU_OUT));
        pass_count = pass_count + 1;
      end

      $display(""); // blank line for readability

      // Give a clock cycle for internal units to reset flags if they do so on next edge
      @(posedge CLK);
    end
  endtask

  // Test sequence
  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0, DUT);

    $display("==== Starting ALU Testbench ====");

    // Initialize
    A = 0; B = 0; ALU_FUN = 4'b0000; ALU_EN = 0;
    RST = 0;
    repeat (3) @(posedge CLK);
    RST = 1;
    @(posedge CLK);

    // Directed tests

    $display("=== ARITHMETIC TESTS ===");
    run_test(10, 5, 4'b0000, 15, 1);   // ADD  -> expect +15
    run_test(15, 7, 4'b0001, 8, 1);    // SUB  -> expect +8
   // run_test(7, 15, 4'b0001, -8, 1);   // SUB  -> expect -8 (two's complement bits compared)

    $display("=== LOGIC TESTS ===");
    run_test(8'hF0, 8'h0F, 4'b0100, 8'h00, 1); // AND -> 0x00
    run_test(8'hF0, 8'h0F, 4'b0101, 8'hFF, 1); // OR  -> 0xFF (255 unsigned; will display -1 if you view signed)

    $display("=== COMPARE TESTS ===");
    run_test(25, 25, 4'b1001, 8'd1, 1);  // EQ -> 1
    run_test(30, 10, 4'b1010, 8'd2, 1);  // GT -> 2
    run_test(10, 30, 4'b1011, 8'd3, 1);  // LT -> 3

    $display("=== SHIFT TESTS ===");
    run_test(8'h0F, 1, 4'b1100, 8'h07, 1); // A>>1 -> 0x07
    run_test(8'h0F, 1, 4'b1101, 8'h1E, 1); // A<<1 -> 0x1E
    run_test(8'h0F, 4, 4'b1110, 8'd2, 1);  // B>>1 -> 2
    run_test(8'h0F, 4, 4'b1111, 8'd8, 1);  // B<<1 -> 8

    // Summary
    $display("==== Testbench Finished ====");
    $display("Total: %0d, Passed: %0d, Failed: %0d", total_tests, pass_count, fail_count);

    $finish;
  end

endmodule
