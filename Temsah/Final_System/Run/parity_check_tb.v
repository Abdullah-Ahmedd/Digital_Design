`include "parity_checker.v"
`timescale 1ns/1ps

module tb_parity_checker;

    reg        CLK;
    reg        RST;
    reg        PAR_TYP;  // 0 = even, 1 = odd
    reg        parity_checker_enable;
    reg  [3:0] bit_cnt;
    reg        sampled_data;
    wire       parity_err;

    // Instantiate DUT
    parity_checker uut (
        .CLK(CLK),
        .RST(RST),
        .PAR_TYP(PAR_TYP),
        .parity_checker_enable(parity_checker_enable),
        .bit_cnt(bit_cnt),
        .sampled_data(sampled_data),
        .parity_err(parity_err)
    );

    // Clock generation
    initial CLK = 0;
    always #5 CLK = ~CLK; // 100 MHz

    // Task to send one bit
    task send_bit(input [3:0] bit_number, input bit_val);
    begin
        @(posedge CLK);
        bit_cnt  = bit_number;
        sampled_data = bit_val;
        parity_checker_enable = 1;
        @(posedge CLK);
        $display("T=%0t ns | bit_cnt=%0d | sampled_data=%b | parity_err=%b",
                  $time, bit_number, bit_val, parity_err);
    end
    endtask

    initial begin
        // Init
        RST = 0;
        parity_checker_enable = 0;
        bit_cnt = 0;
        sampled_data = 1;
        PAR_TYP = 0; // Even parity
        #20;
        RST = 1;

        // Example frame:
        // Start(0), Data(10110011 LSB→MSB), Parity, Stop(1)
        // Data bits: b[0]=1, b[1]=1, b[2]=0, b[3]=0, b[4]=1, b[5]=1, b[6]=0, b[7]=1
        // Even parity → parity bit chosen to make total ones count even

        $display("=== Sending frame ===");

        // Start bit (not stored in checker)
        send_bit(4'd0, 0);

        // 8 data bits
        send_bit(4'd1, 1);
        send_bit(4'd2, 1);
        send_bit(4'd3, 0);
        send_bit(4'd4, 0);
        send_bit(4'd5, 1);
        send_bit(4'd6, 1);
        send_bit(4'd7, 0);
        send_bit(4'd8, 1);

        // Parity bit (bit_cnt=9)
        // Here we manually choose it to be correct for even parity
        send_bit(4'd9, 1);

        // Stop bit (not used in checker)
        send_bit(4'd10, 1);

        $display("=== Test finished ===");
        $finish;
    end

endmodule
