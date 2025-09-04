`timescale 1ns/1ps
`include "FIFO_wprt_wfull.v"

module tb_FIFO_wptr_wfull;

parameter ADDR = 3;  // FIFO address width

// Inputs
reg Wrst;
reg Wclk;
reg Winc;
reg [ADDR:0] Wq2_rptr;

// Outputs
wire [ADDR-1:0] Wadder;
wire [ADDR:0] Wptr;
wire Wfull;

// Instantiate the DUT
FIFO_wptr_wfull #( .Address(ADDR) ) DUT (
    .Wrst(Wrst),
    .Winc(Winc),
    .Wclk(Wclk),
    .Wq2_rptr(Wq2_rptr),
    .Wadder(Wadder),
    .Wptr(Wptr),
    .Wfull(Wfull)
);

// Clock generation
initial begin
    Wclk = 0;
    forever #5 Wclk = ~Wclk; // 100 MHz clock
end

// Test sequence
initial begin
    // Initialize inputs
    Wrst = 0;
    Winc = 0;
    Wq2_rptr = 0;

    // Apply reset
    #10;
    Wrst = 1;

    // Wait one clock
    @(posedge Wclk);

    // Start writing until full
    $display("Time\tWinc\tWptr\tWadder\tWfull\tWq2_rptr");
    repeat(16) begin
        Winc = 1;

        // Simulate read pointer moving slowly (change every 4 writes)
        if ($time % 20 == 0)
            Wq2_rptr = Wq2_rptr + 1;

        @(posedge Wclk);
        $display("%0t\t%b\t%0h\t%0h\t%b\t%0h", $time, Winc, Wptr, Wadder, Wfull, Wq2_rptr);
    end

    // Stop writing
    Winc = 0;
    @(posedge Wclk);

    // Test Wfull reset when read pointer moves
    Wq2_rptr = Wq2_rptr + 1;
    @(posedge Wclk);
    $display("After read pointer moves:");
    $display("%0t\tWfull=%b\tWptr=%0h\tWq2_rptr=%0h", $time, Wfull, Wptr, Wq2_rptr);

    $finish;
end

endmodule
