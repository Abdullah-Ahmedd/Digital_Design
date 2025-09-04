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

  // Scoreboard memory
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
  always #4  Rclk = ~Rclk;  // ~40 MHz

  // ======================
  // Write task
  // ======================
  task write_data(input [Data_width-1:0] data);
    begin
      @(posedge Wclk);
      if (!Wfull) begin
        Wrdata = data;
        Winc = 1;
        expected[write_idx] = data;
        $display("[%0t] WRITE: %h (index %0d)", $time, data, write_idx);
        write_idx++;
        @(posedge Wclk);
        Winc = 0;
      end else begin
        $display("[%0t] WRITE BLOCKED: FIFO is full", $time);
      end
    end
  endtask

  // ======================
  // Read task
  // ======================
  task read_data();
    begin
      @(posedge Rclk);
      if (!Rempty) begin
        Rinc = 1;
        @(posedge Rclk);
        Rinc = 0;
        @(posedge Rclk); // Wait for data to propagate
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

  // ======================
  // Reset task
  // ======================
  task reset_fifo();
    begin
      $display("[%0t] Applying reset...", $time);
      Wrst = 0;
      Rrst = 0;
      repeat (5) @(posedge Wclk);
      repeat (3) @(posedge Rclk);
      Wrst = 1;
      Rrst = 1;
      repeat (3) @(posedge Wclk);
      repeat (2) @(posedge Rclk);
      $display("[%0t] Reset released.", $time);
      write_idx = 0;
      read_idx = 0;
    end
  endtask

  // ======================
  // Test procedure
  // ======================
  initial begin
    // Initialize signals
    Wclk   = 0; Rclk   = 0;
    Wrst   = 1; Rrst   = 1;
    Winc   = 0; Rinc   = 0;
    Wrdata = 0;

    // Reset FIFO
    reset_fifo();

    $display("\n=== TEST 1: Fill FIFO completely ===");
    for (i = 1; i <= Depth+2; i = i + 1) begin
      write_data(8'h10 + i);
      if (Wfull) $display("[%0t] FIFO full after %0d writes", $time, write_idx);
    end

    $display("\n=== TEST 2: Try writing when full ===");
    write_data(8'hFF);

    $display("\n=== TEST 3: Read all data ===");
    while (!Rempty && read_idx < write_idx) read_data();

    repeat (5) @(posedge Rclk);
    if (Rempty) $display("[%0t] FIFO is now empty", $time);

    $display("\n=== TEST 4: Try reading when empty ===");
    read_data();

    $display("\n=== TEST 5: Write and read simultaneously ===");
   // reset_fifo();
    for (i = 1; i <= 4; i = i + 1) write_data(8'h20 + i);

    fork
      begin
        for (i = 5; i <= 8; i = i + 1) write_data(8'h20 + i);
      end
      begin
        repeat (2) @(posedge Rclk);
        repeat (6) read_data();
      end
    join

    $display("\n=== FINAL STATUS ===");
    $display("Total writes: %0d", write_idx);
    $display("Total reads: %0d", read_idx);
    $display("Wfull: %b, Rempty: %b", Wfull, Rempty);

    #200 $finish;
  end

  // ======================
  // Monitor signals
  // ======================
  initial begin
    $monitor("T=%0t | Wfull=%b Rempty=%b | Wrdata=%h Winc=%b | Rdata=%h Rinc=%b | WriteIdx=%0d ReadIdx=%0d",
             $time, Wfull, Rempty, Wrdata, Winc, Rdata, Rinc, write_idx, read_idx);
  end

  // ======================
  // VCD waveform dump
  // ======================
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ASYNC_FIFO_tb);
  end

endmodule
