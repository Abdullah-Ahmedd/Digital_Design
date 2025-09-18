`timescale 1ns/1ps
`include "SYS_TOP.v"
module SYS_TOP_tb;

  // Clock and reset
  reg Ref_clk, UART_clk, RST;
  reg RX_IN;
  wire TX_OUT;

  // Instantiate DUT
  SYS_TOP #(.Data_width(8), .Address_width(4)) DUT (
    .Ref_clk(Ref_clk),
    .UART_clk(UART_clk),
    .RST(RST),
    .RX_IN(RX_IN),
    .TX_OUT(TX_OUT)
  );

  //-----------------
  // Clock generation
  //-----------------
  initial begin
    Ref_clk = 0;
    forever #10 Ref_clk = ~Ref_clk;        // 50 MHz → 20 ns period
  end

  initial begin
    UART_clk = 0;
    forever #135.7 UART_clk = ~UART_clk;   // 3.6864 MHz → ~271.4 ns period
  end

  //---------------------------------------
  // UART bit timing (prescale = 16 assumed)
  //---------------------------------------
  real bit_time;
  initial bit_time = 16 * 271.4; // ns

  //-------------------
  // VCD dump
  //-------------------
  initial begin
    $dumpfile("sys_top_tb.vcd");
    $dumpvars(0, SYS_TOP_tb);
  end

  //----------------------------------------
  // Simple UART transmitter (to DUT RX_IN)
  //----------------------------------------
  task send_uart_byte(input [7:0] data);
    integer i;
    begin
      // Start bit
      RX_IN = 0;
      #(bit_time);
      // Data bits LSB first
      for (i=0; i<8; i=i+1) begin
        RX_IN = data[i];
        #(bit_time);
      end
      // Stop bit
      RX_IN = 1;
      #(bit_time);
    end
  endtask

  //-----------------------------------------
  // UART receiver (monitor DUT TX_OUT)
  //-----------------------------------------
  function [7:0] recv_uart_byte;
    integer i;
    reg [7:0] temp;
    begin
      // Wait for start bit
      @(negedge TX_OUT);
      #(bit_time + bit_time/2); // sample in middle of first data bit
      for (i=0; i<8; i=i+1) begin
        temp[i] = TX_OUT;
        #(bit_time);
      end
      recv_uart_byte = temp;
      // ignore stop bit
      #(bit_time);
    end
  endfunction

  //-----------------------------------------
  // Test procedure
  //-----------------------------------------
  reg [7:0] rx_data;
  initial begin
    RX_IN = 1;
    RST   = 0;
    repeat(5) @(posedge Ref_clk);
    RST   = 1;

    // ---- Test 1: Write 0xAB to address 0x05 ----
    send_uart_byte(8'hAA);
    send_uart_byte(8'h05);
    send_uart_byte(8'hAB);

    // ---- Test 2: Read back from address 0x05 ----
    send_uart_byte(8'hBB);
    send_uart_byte(8'h05);
    rx_data = recv_uart_byte();
    if (rx_data !== 8'hAB)
      $display("ERROR: Expected 0xAB, got 0x%0h", rx_data);
    else
      $display("PASS: Readback 0xAB OK");

    // ---- Test 3: ALU Addition 0x10 + 0x25 ----
    send_uart_byte(8'hCC);
    send_uart_byte(8'h10);
    send_uart_byte(8'h25);
    send_uart_byte(8'h00);  // ALU_FUN = 0x0 (ADD)
    rx_data = recv_uart_byte();
    if (rx_data !== (8'h10 + 8'h25))
      $display("ERROR: ADD result wrong, got 0x%0h", rx_data);
    else
      $display("PASS: Addition OK (0x%0h)", rx_data);

    // ---- Test 4: No-operand NOT of address 0x05 ----
    // Should output bitwise NOT of 0xAB = 0x54
    send_uart_byte(8'hDD);
    send_uart_byte(8'h09);  // ALU_FUN = 0x9 (NOT)
    rx_data = recv_uart_byte();
    if (rx_data !== ~8'hAB)
      $display("ERROR: NOT result wrong, got 0x%0h", rx_data);
    else
      $display("PASS: NOT OK (0x%0h)", rx_data);

    $display("All tests completed");
    #100000;
    $finish;
  end

endmodule
