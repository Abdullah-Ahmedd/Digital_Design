`timescale 1ns/1ps
`include "serializer.v"
module serializer_tb;

parameter CLK_PERIOD = 10;

// Inputs
reg [7:0] P_DATA_tb;
reg ser_en_tb;
reg CLK_tb;
reg RST_tb;

// Outputs
wire ser_data_tb;
wire ser_done_tb;

// Instantiate serializer
serializer DUT (
    .P_DATA(P_DATA_tb),
    .ser_en(ser_en_tb),
    .CLK(CLK_tb),
    .RST(RST_tb),
    .ser_data(ser_data_tb),
    .ser_done(ser_done_tb)
);

// Clock generation
always begin
    CLK_tb = 1;
    #(CLK_PERIOD/2);
    CLK_tb = 0;
    #(CLK_PERIOD/2);
end

// Test procedure
initial begin
    $display("Starting serializer testbench...");
    init();

    // Apply test vector
    @(negedge CLK_tb);
    P_DATA_tb = 8'b1010_1101;     // example pattern
    ser_en_tb = 1'b1;

    @(negedge CLK_tb);            // Let ser_en be high for one cycle
    ser_en_tb = 1'b0;

    // Read bits serially (LSB first)
    repeat(8) begin
        @(negedge CLK_tb);
        $display("Bit out: %b", ser_data_tb);
    end

    // Wait and check for ser_done
    @(negedge CLK_tb);
    if (ser_done_tb)
        $display("✅ ser_done asserted successfully.");
    else
        $display("❌ ERROR: ser_done not asserted.");

    // Final check
    @(negedge CLK_tb);
    $display("Test finished.");
    $finish;
end

task init;
begin
    CLK_tb = 0;
    RST_tb = 0;
    P_DATA_tb = 8'b0;
    ser_en_tb = 0;

    #(2 * CLK_PERIOD);
    RST_tb = 1;
    #(2 * CLK_PERIOD);
end
endtask

endmodule
