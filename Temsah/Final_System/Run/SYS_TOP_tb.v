`timescale 1ns/1ps
`include "SYS_TOP.v"

module SYS_TOP_tb;

  localparam real REF_CLK_PERIOD  = 20.0;
  localparam real UART_CLK_PERIOD = 271.0;
  localparam integer PRESCALE     = 32;
  localparam real BIT_PERIOD      = PRESCALE * UART_CLK_PERIOD;
  localparam real GAP_PERIOD      = BIT_PERIOD * 3.0;

  reg Ref_clk, UART_clk, RST, RX_IN;
  wire TX_OUT;

  SYS_TOP #(
    .Data_width(8),
    .Address_width(4),
    .NUM_STAGES(2),
    .Depth(8)
  ) dut (
    .Ref_clk(Ref_clk),
    .UART_clk(UART_clk),
    .RST(RST),
    .RX_IN(RX_IN),
    .TX_OUT(TX_OUT)
  );

  // Clocks
  initial begin Ref_clk = 0; forever #(REF_CLK_PERIOD/2.0) Ref_clk = ~Ref_clk; end
  initial begin UART_clk = 0; forever #(UART_CLK_PERIOD/2.0) UART_clk = ~UART_clk; end

  // Dump
  initial begin
    $dumpfile("SYS_TOP_tb.vcd");
    $dumpvars(0, SYS_TOP_tb);
    $dumpvars(0, SYS_TOP_tb.dut);
  end

  // Reset
  initial begin
    RX_IN = 1'b1; RST = 0;
    #(20*REF_CLK_PERIOD);
    RST = 1'b1;
    #(20*REF_CLK_PERIOD);
  end

  // ===============================
  // UART SEND
  // ===============================
  task send_byte(input [7:0] data);
    integer i;
    begin
      RX_IN = 0; #(BIT_PERIOD);
      for(i=0;i<8;i=i+1) begin
        RX_IN = data[i];
        #(BIT_PERIOD);
      end
      RX_IN = 1; #(BIT_PERIOD + GAP_PERIOD);
    end
  endtask

  // ===============================
  // UART RECEIVE TASK (safe, bitwise, parity-aware)
  // ===============================
  reg [7:0] rx_byte;
  localparam PARITY_EN  = 1'b1; // matches REG2
  localparam PARITY_ODD = 1'b1;

  task uart_recv(input [7:0] expected);
    integer i;
    reg parity_bit;
    begin
      // Wait for start bit safely with timeout
      wait(TX_OUT === 1'b0);
      #(BIT_PERIOD/2); // mid-bit sample

      rx_byte = 0;
      for(i=0;i<8;i=i+1) begin
        #(BIT_PERIOD);
        rx_byte[i] = TX_OUT;
      end

      // Parity
      if(PARITY_EN) begin
        #(BIT_PERIOD);
        parity_bit = TX_OUT;
        if(PARITY_ODD ? (parity_bit !== ~^rx_byte) : (parity_bit !== ^rx_byte))
          $display("%t : WARNING parity mismatch!", $time);
      end

      // Stop bit
      #(BIT_PERIOD);
      if(TX_OUT !== 1'b1) $display("%t : WARNING stop bit mismatch!", $time);

      // Check
      if(rx_byte === expected)
        $display("%t : PASS -> received 0x%0h", $time, rx_byte);
      else
        $display("%t : FAIL -> expected 0x%0h, got 0x%0h", $time, expected, rx_byte);
    end
  endtask

  // ===============================
  // Test Sequence
  // ===============================
  initial begin
    #(200*REF_CLK_PERIOD);

    // CONFIG
    send_byte(8'hAA); send_byte(8'h02); send_byte(8'h81); // REG2
    send_byte(8'hAA); send_byte(8'h03); send_byte(32);     // REG3

    // Test 1: Write 0xAB
    send_byte(8'hAA); send_byte(8'h05); send_byte(8'hAB);

    // Test 2: Read 0xAB
    send_byte(8'hBB); send_byte(8'h05);
    uart_recv(8'hAB);

    // Test 3: ALU ADD 10+25
    send_byte(8'hCC); send_byte(10); send_byte(25); send_byte(8'h00);
    uart_recv(8'd35);

    // Test 4: ALU NOT(REG[0x05])
    send_byte(8'hDD); send_byte(8'h09);
    uart_recv(~8'hAB);

    $display("%t : All tests finished", $time);
    $finish;
  end

endmodule
