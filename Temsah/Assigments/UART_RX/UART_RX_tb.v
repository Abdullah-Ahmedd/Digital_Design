`include "UART_RX.v"

`timescale 1ns/1ps

module UART_RX_tb;

    // Testbench signals
    reg CLK;
    reg RST;
    reg RX_IN;
    reg [5:0] prescale;
    reg PAR_EN;
    reg PAR_TYP;
    wire [7:0] P_DATA;
    wire data_valid;

    // Local parameters
    localparam CLK_PERIOD = 1085; // ~921.6 kHz for Prescale=8 (1.085 us)

    // Instantiate DUT
    UART_RX dut (
        .CLK(CLK),
        .RST(RST),
        .RX_IN(RX_IN),
        .prescale(prescale),
        .PAR_EN(PAR_EN),
        .PAR_TYP(PAR_TYP),
        .P_DATA(P_DATA),
        .data_valid(data_valid)
    );

    // Clock generation
    always #(CLK_PERIOD/2) CLK = ~CLK;

    // Task: Send one UART frame
    task send_frame;
        input [7:0] data;
        input       parity_en;
        input       parity_typ; // 0 even, 1 odd
        integer     i;
        reg         parity_bit;
    begin
        // Idle high before start
        RX_IN = 1;
        #(CLK_PERIOD*prescale);

        // Start bit
        RX_IN = 0;
        #(CLK_PERIOD*prescale);

        // Data bits LSB first
        parity_bit = parity_typ; // For odd parity start with 1, for even start with 0
        for (i = 0; i < 8; i = i + 1) begin
            RX_IN = data[i];
            if (parity_en)
                parity_bit = parity_bit ^ data[i];
            #(CLK_PERIOD*prescale);
        end

        // Parity bit if enabled
        if (parity_en) begin
            RX_IN = parity_bit;
            #(CLK_PERIOD*prescale);
        end

        // Stop bit (always 1)
        RX_IN = 1;
        #(CLK_PERIOD*prescale);
    end
    endtask

    // Task: Run a test and check result
    task run_test;
        input [7:0] data;
        input       parity_en;
        input       parity_typ;
    begin
        send_frame(data, parity_en, parity_typ);
        @(posedge data_valid);
        if (P_DATA == data) begin
            $display("PASS: Received 0x%0h correctly (PAR_EN=%0b, PAR_TYP=%0b)",
                      data, parity_en, parity_typ);
        end else begin
            $display("FAIL: Expected 0x%0h, got 0x%0h (PAR_EN=%0b, PAR_TYP=%0b)",
                      data, P_DATA, parity_en, parity_typ);
        end
    end
    endtask

    // Initial block
    initial begin
        // Init signals
        CLK = 0;
        RX_IN = 1;
        RST = 1;
        prescale = 8; // Oversampling by 8
        PAR_EN = 0;
        PAR_TYP = 0;

        // Reset
        #(CLK_PERIOD*2);
        RST = 0;
        #(CLK_PERIOD*2);
        RST = 1;
        #(CLK_PERIOD*4);

        // Test 1: No parity
        PAR_EN = 0;
        run_test(8'hA5, 0, 0);

        // Test 2: Even parity
        PAR_EN = 1; PAR_TYP = 0;
        run_test(8'h3C, 1, 0);

        // Test 3: Odd parity
        PAR_EN = 1; PAR_TYP = 1;
        run_test(8'h7E, 1, 1);

        $display("All tests done.");
        $finish;
    end

endmodule
