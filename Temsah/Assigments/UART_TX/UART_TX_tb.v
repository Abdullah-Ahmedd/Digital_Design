`include "UART_TX.v"
`timescale 1ns/1ps
module UART_TX_tb();
//Declaring the clock period
parameter clock_period=5;
//Declaring the testbench signals 
reg [ 7 : 0 ] P_DATA_tb;
reg Data_valid_tb;
reg PAR_EN_tb;
reg PAR_TYP_tb;
reg CLK_tb;
reg RST_tb;
wire TX_OUT_tb;
wire busy_tb;

//Declaring the loop vairables
integer i;
//Clock generation
always
    begin
        CLK_tb=0;
        #( clock_period/2.0 );
        CLK_tb=1;
        #( clock_period/2.0 );
    end

initial
    begin
        $dumpfile("UART_TX.vcd");
        $dumpvars;
        initialization();

        $display("Test case 1: inputting a number with the parity enable off");
        @( negedge CLK_tb )
        do_operation(8'h00, 1'b0 ,1'b0 );
        #( clock_period );
        check_TX(8'h00 );
        #( clock_period );

        reset();

        $display("Test case 2: inputting a number with the parity enable on (even parity)");
        @( negedge CLK_tb )
        do_operation(8'b01001000, 1'b1 ,1'b0 );
        #( clock_period );
        check_TX(8'b1001000 );

        reset();

        $display("Test case 3: inputting a number with the parity enable on (odd parity)");
        @( negedge CLK_tb )
        do_operation(8'b01001000, 1'b1 ,1'b1 );
        #( clock_period );
        check_TX(8'b1001000 );

        $finish;
    end

//Tasks
task initialization();
    begin
    RST_tb=0;
    P_DATA_tb=8'b0;
    Data_valid_tb=0;
    PAR_EN_tb=0;
    PAR_TYP_tb=0;
    reset();
    end
endtask

task reset();
    begin
        RST_tb=0;
        #( clock_period );
        RST_tb=1;  
        #( clock_period );
    end
endtask

task do_operation (input [ 7 : 0 ] data  , input parity_enable , input parity_type );
    begin
        @( posedge CLK_tb )
        P_DATA_tb = data;
        Data_valid_tb = 1'b1;
        PAR_EN_tb =parity_enable;
        PAR_TYP_tb=parity_type;
        @( posedge CLK_tb )
        Data_valid_tb=1'b0;
    end
endtask

task check_TX(input [7:0] data);
    integer i;
    reg test_failed;
    reg expected_parity;
    begin
        test_failed = 0;

        // Wait 1 clock cycle before checking data (if needed)
        @(posedge CLK_tb);

        // 🧪 Check 8 data bits (LSB first)
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge CLK_tb);
            if (TX_OUT_tb !== data[i]) begin
                $display("❌ Bit %0d incorrect: expected = %b, got = %b", i, data[i], TX_OUT_tb);
                test_failed = 1;
            end
        end

        // 🧮 Check parity if enabled
        if (PAR_EN_tb) begin
            expected_parity = ^data; // Even parity by default
            if (PAR_TYP_tb) // Odd parity
                expected_parity = ~expected_parity;

            @(posedge CLK_tb); // Wait for parity bit
            if (TX_OUT_tb !== expected_parity) begin
                $display("❌ Parity bit incorrect: expected = %b, got = %b", expected_parity, TX_OUT_tb);
                test_failed = 1;
            end
        end

        // ⏹ Check stop bit (must be 1)
        @(posedge CLK_tb);
        if (TX_OUT_tb !== 1'b1) begin
            $display("❌ Stop bit incorrect: expected = 1, got = %b", TX_OUT_tb);
            test_failed = 1;
        end

        // ✅ Final result
        if (!test_failed)
            $display("✅ Test case passed successfully");
    end
endtask

//Module instantiation
UART_TX DUT
(
.P_DATA( P_DATA_tb ),
.Data_valid( Data_valid_tb ),
.PAR_EN( PAR_EN_tb ),
.PAR_TYP( PAR_TYP_tb ),
.CLK( CLK_tb ),
.RST( RST_tb ),
.TX_OUT( TX_OUT_tb ),
.busy( busy_tb )
);

endmodule