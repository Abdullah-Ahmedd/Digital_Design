`timescale 1ns/1ps
`include "SYS_TOP.v"

module SYS_TOP_tb;

  // Parameters
  parameter REF_CLK_PERIOD  = 20;      // 50 MHz
  parameter UART_CLK_PERIOD = 271;     // ~3.6864 MHz
  parameter PRESCALE        = 32;      
  parameter BIT_PERIOD      = PRESCALE * UART_CLK_PERIOD;    // Actual DUT bit period
  
  // Signals
  reg  Ref_clk;
  reg  UART_clk;
  reg  RST;
  reg  RX_IN;
  wire TX_OUT;

  // Test status counters
  integer tests_passed = 0;
  integer tests_failed = 0;
  integer total_tests  = 0;

  // DUT
  SYS_TOP #(
    .Data_width   (8),
    .Address_width(4),
    .NUM_STAGES   (2),
    .Depth        (8)
  ) dut (
    .Ref_clk (Ref_clk),
    .UART_clk(UART_clk),
    .RST     (RST),
    .RX_IN   (RX_IN),
    .TX_OUT  (TX_OUT)
  );

  // Clock generation
  initial begin
    Ref_clk = 0;
    forever #(REF_CLK_PERIOD/2) Ref_clk = ~Ref_clk;
  end

  initial begin
    UART_clk = 0;
    forever #(UART_CLK_PERIOD/2) UART_clk = ~UART_clk;
  end

  // VCD dump
  initial begin
    $dumpfile("sys_top_final.vcd");
    $dumpvars(0, SYS_TOP_tb);
    $dumpvars(0, dut);
  end

  // Reset
  initial begin
    RX_IN = 1'b1;
    RST   = 1'b0;
    #(100*REF_CLK_PERIOD);
    RST   = 1'b1;
    #(200*REF_CLK_PERIOD);
  end

  // UART send task
  task send_byte;
    input [7:0] data;
    integer i;
    begin
      // Start bit
      RX_IN = 1'b0;  #(BIT_PERIOD);
      // Data bits (LSB first)
      for (i = 0; i < 8; i = i + 1) begin
        RX_IN = data[i];  #(BIT_PERIOD);
      end
      // Stop bit
      RX_IN = 1'b1;  #(BIT_PERIOD);
      // Inter-frame gap
      #(BIT_PERIOD * 2);
    end
  endtask

  // UART receive task (clean event-driven)
  task receive_byte;
    output [7:0] data;
    integer i;
    begin
      //data = 0;
      // Wait for start bit (falling edge)
      @(negedge TX_OUT);
      // Move to middle of first data bit
      #(BIT_PERIOD + BIT_PERIOD/2);
      // Sample 8 data bits (LSB first)
      for (i = 0; i < 8; i = i + 1) begin
        data[i] = TX_OUT;
        #(BIT_PERIOD);
      end
      // Stop bit check
      //if (TX_OUT !== 1'b1)
       // $display("⚠️ UART Stop bit error at time %t", $time);
    end
  endtask

  // Test helper task
  task run_test;
    input [7:0] expected;
    input [159:0] test_name; // 20 chars max
    reg [7:0] received;
    begin
      total_tests = total_tests + 1;
      receive_byte(received);
      
      if (received == expected) begin
        $display("✓ PASS: %s - Expected: 0x%02h, Got: 0x%02h", test_name, expected, received);
        tests_passed = tests_passed + 1;
      end else begin
        $display("✗ FAIL: %s - Expected: 0x%02h, Got: 0x%02h", test_name, expected, received);
        tests_failed = tests_failed + 1;
      end
    end
  endtask

  // Main test sequence
  initial begin
    wait(RST == 1'b1);
    #(500*REF_CLK_PERIOD);
    
    $display("========================================");
    $display("SYS_TOP COMPREHENSIVE TEST SUITE");
    $display("========================================");
    
    // Test 1: Basic Register Write/Read
    $display("\n[TEST 1] Register Write/Read Test");
    send_byte(8'hAA); send_byte(8'h05); send_byte(8'h55); #(BIT_PERIOD * 20);
    send_byte(8'hBB); send_byte(8'h05);
    run_test(8'h55, "Reg Write/Read 0x55");
    
    // Test 2: Different pattern
    $display("\n[TEST 2] Different Pattern Test"); 
    send_byte(8'hAA); send_byte(8'h06); send_byte(8'hAA); #(BIT_PERIOD * 20);
    send_byte(8'hBB); send_byte(8'h06);
    run_test(8'hAA, "Reg Write/Read 0xAA");
    
    // Test 3: ALU Addition
    $display("\n[TEST 3] ALU Addition Test");
    send_byte(8'hCC); send_byte(8'd10); send_byte(8'd25); send_byte(8'h00);
    run_test(8'd35, "ALU ADD 10+25");
    
    // Test 4: ALU Subtraction  
    $display("\n[TEST 4] ALU Subtraction Test");
    send_byte(8'hCC); send_byte(8'd50); send_byte(8'd20); send_byte(8'h01);
    run_test(8'd30, "ALU SUB 50-20");
    
    // Test 5: ALU Multiplication
    $display("\n[TEST 5] ALU Multiplication Test");
    send_byte(8'hCC); send_byte(8'd6); send_byte(8'd7); send_byte(8'h02);
    run_test(8'd42, "ALU MUL 6*7");
    
    // Test 6: ALU Division
    $display("\n[TEST 6] ALU Division Test");
    send_byte(8'hCC); send_byte(8'd20); send_byte(8'd4); send_byte(8'h03);
    run_test(8'd5, "ALU DIV 20/4");
    
    // Test 7: ALU AND with stored registers
    $display("\n[TEST 7] ALU AND Test (REG0 & REG1)");
    send_byte(8'hDD); send_byte(8'd04);
    run_test(8'd4, "ALU AND REG0&REG1"); // 20 & 4 = 4
    
    // Test 8: ALU OR with stored registers  
    $display("\n[TEST 8] ALU OR Test (REG0 & REG1)");
    send_byte(8'hDD); send_byte(8'h05);
    run_test(8'h14, "ALU OR REG0|REG1"); // 20 | 4 = 14

    // Test 9: ALU NAND with stored registers  
    $display("\n[TEST 9] ALU NAND Test (REG0 & REG1)");
    send_byte(8'hDD); send_byte(8'd06);
    run_test(8'hFB, "ALU NAND REG0 NAND REG1"); // ~(20&4) = FB
    
    // Test 10: ALU NOR with stored registers  
    $display("\n[TEST 10] ALU NOR Test (REG0 & REG1)");
    send_byte(8'hDD); send_byte(8'd07);
    run_test(8'hEB, "ALU NOR REG0 NOR REG1"); // ~(20|4) = EB
    
    // Final results
    $display("\n========================================");
    $display("TEST RESULTS SUMMARY");
    $display("========================================");
    $display("Total Tests: %0d", total_tests);
    $display("Passed:      %0d", tests_passed);
    $display("Failed:      %0d", tests_failed);
    
    if (tests_failed == 0)
      $display("🎉 ALL TESTS PASSED! 🎉");
    else
      $display("❌ %0d TEST(S) FAILED", tests_failed);
    
    $display("========================================");
    
    #(BIT_PERIOD * 50);
    $finish;
  end

  // Simulation timeout
  initial begin
    #(50000000 * BIT_PERIOD);
    $display("SIMULATION TIMEOUT!");
    $finish;
  end

endmodule
