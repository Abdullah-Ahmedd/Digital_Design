`timescale 1ns/1ps
`include "ASYNC_FIFO.v"

module ASYNC_FIFO_tb;

  // Parameters
  parameter Data_width = 8;
  parameter Depth = 8;
  parameter Address = 3; // depth = 2^Address
  parameter NUM_STAGES = 2;

  // Testbench signals
  reg Wclk, Rclk;
  reg Wrst, Rrst;
  reg Winc, Rinc;
  reg [Data_width-1:0] Wrdata;
  wire [Data_width-1:0] Rdata;
  wire Wfull, Rempty;

  // scoreboard memory
  reg [Data_width-1:0] expected [0:Depth*4-1];
  integer write_idx, read_idx;
  integer i;

  // DUT instantiation
  ASYNC_FIFO #(
    .Data_width(Data_width),
    .Depth(Depth),
    .Address(Address),
    .NUM_STAGES(NUM_STAGES)
  ) DUT (
    .Winc(Winc),
    .Wrst(Wrst),
    .Wclk(Wclk),
    .Rinc(Rinc),
    .Rrst(Rrst),
    .Rclk(Rclk),
    .Wrdata(Wrdata),
    .Wfull(Wfull),
    .Rempty(Rempty),
    .Rdata(Rdata)
  );

  // Clock generation
  always #5  Wclk = ~Wclk;  // 100 MHz
  always #7  Rclk = ~Rclk;  // ~71 MHz (async to Wclk)

  // Write task
  task write_data(input [Data_width-1:0] data);
    begin
      @(negedge Wclk);
      if (!Wfull) begin
        Wrdata = data;
        Winc = 1;
        expected[write_idx] = data;
        $display("[%0t] WRITE: %h (index %0d)", $time, data, write_idx);
        write_idx++;
        @(negedge Wclk);
        Winc = 0;
      end else begin
        $display("[%0t] WRITE BLOCKED: FIFO is full", $time);
      end
    end
  endtask

  // Read task
  task read_data();
    begin
      @(negedge Rclk);
      if (!Rempty) begin
        Rinc = 1;
        @(negedge Rclk);
        Rinc = 0;
        // Wait a cycle for data to be valid
        @(negedge Rclk);
        if (Rdata !== expected[read_idx]) begin
          $display("[%0t] ERROR: expected %h, got %h (index %0d)", 
                   $time, expected[read_idx], Rdata, read_idx);
        end else begin
          $display("[%0t] READ OK: %h (index %0d)", $time, Rdata, read_idx);
        end
        read_idx++;
      end else begin
        $display("[%0t] READ BLOCKED: FIFO is empty", $time);
      end
    end
  endtask

  // Reset task
  task reset_fifo();
    begin
      $display("[%0t] Applying reset...", $time);
      Wrst = 0;
      Rrst = 0;
      repeat (5) @(negedge Wclk);
      repeat (3) @(negedge Rclk);
      Wrst = 1;
      Rrst = 1;
      repeat (3) @(negedge Wclk);
      repeat (2) @(negedge Rclk);
      $display("[%0t] Reset released.", $time);
    end
  endtask

  // ======================
  // Test procedure
  // ======================
  initial begin
    // Initialize everything
    Wclk   = 0;
    Rclk   = 0;
    Wrst   = 1;
    Rrst   = 1;
    Winc   = 0;
    Rinc   = 0;
    Wrdata = 0;
    write_idx = 0;
    read_idx  = 0;

    // Reset the FIFO
    reset_fifo();

    $display("\n=== TEST 1: Fill FIFO completely ===");
    // Write data until FIFO is full (should be 8 entries)
    for (i = 1; i <= 10; i++) begin
      write_data(8'h10 + i);
      if (Wfull) begin
        $display("[%0t] FIFO became full after %0d writes", $time, write_idx);
 
      end
    end

    // Try one more write when full
    $display("\n=== TEST 2: Try writing when full ===");
    write_data(8'hFF);

    $display("\n=== TEST 3: Read all data ===");
    // Read all data
    while (!Rempty && read_idx < write_idx) begin
      read_data();
    end

    // Wait for empty flag to propagate
    repeat (5) @(negedge Rclk);
    if (Rempty) begin
      $display("[%0t] FIFO is now empty", $time);
    end

    $display("\n=== TEST 4: Try reading when empty ===");
    read_data();

    $display("\n=== TEST 5: Write and read simultaneously ===");
    // Reset for clean test
    reset_fifo();
    write_idx = 0;
    read_idx = 0;

    // Write a few items first
    for (i = 1; i <= 4; i++) begin
      write_data(8'h20 + i);
    end

    // Now write and read simultaneously
    fork
      begin
        for (i = 5; i <= 8; i++) begin
          write_data(8'h20 + i);
        end
      end
      begin
        repeat (2) @(negedge Rclk); // Let some data accumulate
        repeat (6) begin
          read_data();
        end
      end
    join

    // Final status
    $display("\n=== FINAL STATUS ===");
    $display("Total writes: %0d", write_idx);
    $display("Total reads: %0d", read_idx);
    $display("Wfull: %b, Rempty: %b", Wfull, Rempty);

    // Finish simulation
    #200;
    $finish;
  end

  // ======================
  // Monitor signals
  // ======================
  initial begin
    $monitor("T=%0t | Wfull=%b Rempty=%b | Wrdata=%h Winc=%b | Rdata=%h Rinc=%b | WriteIdx=%0d ReadIdx=%0d",
             $time, Wfull, Rempty, Wrdata, Winc, Rdata, Rinc, write_idx, read_idx);
  end

  // ======================
  // VCD dump for waveform
  // ======================
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ASYNC_FIFO_tb);
  end

  // Debug: Print internal states
  initial begin
    #1; // Small delay to let initial values settle
    $display("=== FIFO Configuration ===");
    $display("Data_width: %0d", Data_width);
    $display("Depth: %0d", Depth); 
    $display("Address bits: %0d", Address);
    $display("Sync stages: %0d", NUM_STAGES);
    $display("Expected FIFO capacity: %0d entries", Depth);
  end

endmodule