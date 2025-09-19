`timescale 1ns/1ps
`include "FSM.v"
module FSM_tb();

reg Data_valid_tb;
reg PAR_EN_tb;
reg ser_done_tb;
reg CLK_tb;
reg RST_tb;

wire [1:0] mux_sel_tb;
wire ser_en_tb;
wire busy_tb;

// Clock generation
parameter CLK_PERIOD = 10000;
always begin
    CLK_tb = 1'b0;
    #(CLK_PERIOD / 2);
    CLK_tb = 1'b1;
    #(CLK_PERIOD / 2);
end

// DUT Instantiation
FSM dut (
    .Data_valid(Data_valid_tb),
    .PAR_EN(PAR_EN_tb),
    .ser_done(ser_done_tb),
    .CLK(CLK_tb),
    .RST(RST_tb),
    .mux_sel(mux_sel_tb),
    .ser_en(ser_en_tb),
    .busy(busy_tb)
);

// Monitor
initial begin
    $display("🔍 Starting enhanced FSM testbench...\n");

    // Reset
    RST_tb = 0;
    Data_valid_tb = 0;
    PAR_EN_tb = 0;
    ser_done_tb = 0;
    @(posedge CLK_tb);
    RST_tb = 1;

    // TEST CASE 1: PAR_EN = 1
    $display("🧪 Test 1: PAR_EN = 1");
    PAR_EN_tb = 1;

    @(negedge CLK_tb);
    Data_valid_tb = 1;         // =====> Assert valid
    @(negedge CLK_tb);         // =====> Hold it for 1 full cycle
    Data_valid_tb = 0;         // =====> Deassert after a cycle

    @(posedge CLK_tb); // Start_bit
    #1;
    $display("⏱ %0t ns | State: Start_bit | mux_sel=%0b, ser_en=%b, busy=%b", $time, mux_sel_tb, ser_en_tb, busy_tb);
    if (mux_sel_tb !== 2'b00) $display("❌ mux_sel mismatch in Start_bit: Expected 00, got %0b", mux_sel_tb); // =====>
    if (!busy_tb) $display("❌ busy mismatch in Start_bit: Expected 1, got %b", busy_tb); // =====>

    @(posedge CLK_tb); // Send_data
    #1;
    $display("⏱ %0t ns | State: Send_data | mux_sel=%0b, ser_en=%b, busy=%b", $time, mux_sel_tb, ser_en_tb, busy_tb);
    if (mux_sel_tb !== 2'b10) $display("❌ mux_sel mismatch in Send_data: Expected 10, got %0b", mux_sel_tb); // =====>
    if (!ser_en_tb) $display("❌ ser_en mismatch in Send_data: Expected 1, got %b", ser_en_tb); // =====>
    if (!busy_tb) $display("❌ busy mismatch in Send_data: Expected 1, got %b", busy_tb); // =====>

    // Simulate data not done yet
    @(posedge CLK_tb); // Send_data again
    #1;
    $display("⏱ %0t ns | State: Send_data again | mux_sel=%0b, ser_en=%b, busy=%b", $time, mux_sel_tb, ser_en_tb, busy_tb);

    // Now simulate data is done
    ser_done_tb = 1;
    @(posedge CLK_tb); // Parity
    #1;
    ser_done_tb = 0;
    $display("⏱ %0t ns | State: Parity | mux_sel=%0b, ser_en=%b, busy=%b", $time, mux_sel_tb, ser_en_tb, busy_tb);
    if (mux_sel_tb !== 2'b11) $display("❌ mux_sel mismatch in Parity: Expected 11, got %0b", mux_sel_tb); // =====>
    if (!busy_tb) $display("❌ busy mismatch in Parity: Expected 1, got %b", busy_tb); // =====>

    @(posedge CLK_tb); // Stop_bit
    #1;
    $display("⏱ %0t ns | State: Stop_bit | mux_sel=%0b, ser_en=%b, busy=%b", $time, mux_sel_tb, ser_en_tb, busy_tb);
    if (!busy_tb) $display("❌ busy mismatch in Stop_bit: Expected 1, got %b", busy_tb); // =====>

    @(posedge CLK_tb); // Back to IDLE
    #1;
    $display("⏱ %0t ns | State: Back to IDLE | mux_sel=%0b, ser_en=%b, busy=%b\n", $time, mux_sel_tb, ser_en_tb, busy_tb);

    // TEST CASE 2: PAR_EN = 0
    $display("🧪 Test 2: PAR_EN = 0");
    PAR_EN_tb = 0;

    @(negedge CLK_tb);
    Data_valid_tb = 1;         // =====>
    @(negedge CLK_tb);         // =====>
    Data_valid_tb = 0;         // =====>

    @(posedge CLK_tb); // Start_bit
    #1;
    $display("⏱ %0t ns | State: Start_bit | mux_sel=%0b, ser_en=%b, busy=%b", $time, mux_sel_tb, ser_en_tb, busy_tb);

    @(posedge CLK_tb); // Send_data
    #1;
    $display("⏱ %0t ns | State: Send_data | mux_sel=%0b, ser_en=%b, busy=%b", $time, mux_sel_tb, ser_en_tb, busy_tb);

    ser_done_tb = 1;
    @(posedge CLK_tb); // Stop_bit (no parity)
    #1;
    ser_done_tb = 0;
    $display("⏱ %0t ns | State: Stop_bit (no parity) | mux_sel=%0b, ser_en=%b, busy=%b", $time, mux_sel_tb, ser_en_tb, busy_tb);

    @(posedge CLK_tb); // Back to IDLE
    #1;
    $display("⏱ %0t ns | State: Back to IDLE | mux_sel=%0b, ser_en=%b, busy=%b\n", $time, mux_sel_tb, ser_en_tb, busy_tb);

    $display("✅ FSM testbench completed.");
    $finish;
end

endmodule
