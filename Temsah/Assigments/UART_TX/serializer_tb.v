`timescale 1ns/1ps
`include "serializer.v"
module serializer_tb;

// Testbench signals
reg [7:0] P_DATA_tb;
reg ser_en_tb;
reg CLK_tb;
reg RST_tb;
wire ser_data_tb;
wire ser_done_tb;

parameter clock_period = 10;

// Instantiate DUT
serializer uut (
    .P_DATA(P_DATA_tb),
    .ser_en(ser_en_tb),
    .CLK(CLK_tb),
    .RST(RST_tb),
    .ser_data(ser_data_tb),
    .ser_done(ser_done_tb)
);

// Clock generation
always begin
    CLK_tb = 1'b0;
    #(clock_period/2);
    CLK_tb = 1'b1;
    #(clock_period/2);
end

// Test logic
initial begin
    $dumpfile("serializer_tb.vcd");
    $dumpvars;

    // Initial state
    P_DATA_tb = 8'b0;
    ser_en_tb = 1'b0;
    RST_tb = 1'b0;

    // Apply reset
    #(2*clock_period);
    RST_tb = 1'b1;
    #(clock_period);

    // Load data
    P_DATA_tb = 8'b10110011; // Expected serial: 1 1 0 0 1 0 1 1
    ser_en_tb = 1'b1;
    #(clock_period);
    ser_en_tb = 1'b0;

    // Monitor serialization output
    repeat (8) begin
        @(posedge CLK_tb);
        $display("Time %0t | ser_data = %b | bit #%0d", $time, ser_data_tb, $time/clock_period - 5);
    end

    // Wait for ser_done
    @(posedge CLK_tb);
    if (ser_done_tb)
        $display("✅ ser_done asserted correctly after 8 bits");
    else
        $display("❌ ser_done not asserted as expected");

    $finish;
end

endmodule
