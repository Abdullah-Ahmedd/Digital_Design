`include "deserializer.v"
`timescale 1ns/1ps

module tb_deserializer;

    reg        CLK;
    reg        RST;
    reg        sampled_bit;
    reg        deserializer_enable;
    reg  [3:0] bit_cnt;
    wire [7:0] P_DATA;

    // Instantiate DUT
    deserializer uut (
        .CLK(CLK),
        .RST(RST),
        .sampled_bit(sampled_bit),
        .deserializer_enable(deserializer_enable),
        .bit_cnt(bit_cnt),
        .P_DATA(P_DATA)
    );

    // Clock generation (50 MHz => 20 ns period)
    initial CLK = 0;
    always #10 CLK = ~CLK;

    // Original byte to send (parallel)
    reg [7:0] send_byte;

    // Function to reverse bit order for display
    function [7:0] reverse_bits(input [7:0] data_in);
        integer i;
        begin
            for (i = 0; i < 8; i = i + 1)
                reverse_bits[i] = data_in[7 - i];
        end
    endfunction

    // Task to send one bit
    task send_bit(input bit_val, input [3:0] bit_number);
    begin
        sampled_bit         = bit_val;
        bit_cnt             = bit_number;
        deserializer_enable = 1;
        @(posedge CLK);
        deserializer_enable = 0;
        @(posedge CLK);
        $display("Time=%0t | bit_cnt=%0d | Sent Bit=%b | Current P_DATA=%b",
                  $time, bit_number, bit_val, P_DATA);
    end
    endtask

    // Test sequence
    initial begin
        sampled_bit         = 0;
        deserializer_enable = 0;
        bit_cnt             = 0;

        // Reset
        RST = 0;
        repeat (2) @(posedge CLK);
        RST = 1;

        // Choose byte starting and ending with 1
        // Example: 8'b10010111
        send_byte = 8'b10010111;

        $display("=== Starting Deserializer Test ===");
        $display("Byte to send (parallel)   = %b", send_byte);
        $display("Bits will be sent LSB→MSB = %b %b %b %b %b %b %b %b",
                 send_byte[0], send_byte[1], send_byte[2], send_byte[3],
                 send_byte[4], send_byte[5], send_byte[6], send_byte[7]);

        // Send each bit
        send_bit(send_byte[0], 4'd1); // LSB
        send_bit(send_byte[1], 4'd2);
        send_bit(send_byte[2], 4'd3);
        send_bit(send_byte[3], 4'd4);
        send_bit(send_byte[4], 4'd5);
        send_bit(send_byte[5], 4'd6);
        send_bit(send_byte[6], 4'd7);
        send_bit(send_byte[7], 4'd8); // MSB

        // Final output
        $display("Final Parallel Data (MSB→LSB) = %b", P_DATA);
        $display("Output as sent  (LSB→MSB)     = %b", reverse_bits(P_DATA));
        $display("Expected Output (LSB→MSB)     = %b", send_byte);

        $display("=== Test Finished ===");
        $finish;
    end

endmodule
