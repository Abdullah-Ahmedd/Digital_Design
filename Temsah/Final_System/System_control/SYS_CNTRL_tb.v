`timescale 1ns/1ps
`include "SYS_CTRL.v"

module SYS_CTRL_TB();

    // Parameters
    parameter Data_width    = 8;
    parameter Address_width = 4;
    parameter CLK_PERIOD    = 20;
    parameter TIMEOUT_CYCLES = 20;

    // Test signals
    reg  [Data_width-1:0] ALU_OUT_tb;
    reg  OUT_VALID_tb;
    reg  [Data_width-1:0] RX_p_data_tb;
    reg  RX_d_valid_tb;
    reg  [Data_width-1:0] Rd_data_tb;
    reg  RdData_valid_tb;
    reg  FIFO_full_tb;
    reg  CLK_tb;
    reg  RST_tb;

    // Outputs
    wire ALU_EN_tb;
    wire [3:0] ALU_FUN_tb;
    wire CLK_EN_tb;
    wire [Address_width-1:0] Address_tb;
    wire WrEN_tb;
    wire RdEN_tb;
    wire [Data_width-1:0] WrData_tb;
    wire [Data_width-1:0] TX_p_data_tb;
    wire TX_d_valid_tb;
    wire clk_div_en_tb;

    integer test_count = 0;
    integer pass_count = 0;
    integer fail_count = 0;

    // DUT
    SYS_CTRL #(
        .Data_width(Data_width),
        .Address_width(Address_width)
    ) DUT (
        .ALU_OUT(ALU_OUT_tb),
        .OUT_VALID(OUT_VALID_tb),
        .RX_p_data(RX_p_data_tb),
        .RX_d_valid(RX_d_valid_tb),
        .Rd_data(Rd_data_tb),
        .RdData_valid(RdData_valid_tb),
        .FIFO_full(FIFO_full_tb),
        .CLK(CLK_tb),
        .RST(RST_tb),
        .ALU_EN(ALU_EN_tb),
        .ALU_FUN(ALU_FUN_tb),
        .CLK_EN(CLK_EN_tb),
        .Address(Address_tb),
        .WrEN(WrEN_tb),
        .RdEN(RdEN_tb),
        .WrData(WrData_tb),
        .TX_p_data(TX_p_data_tb),
        .TX_d_valid(TX_d_valid_tb),
        .clk_div_en(clk_div_en_tb)
    );

    // Clock
    initial begin
        CLK_tb = 0;
        forever #(CLK_PERIOD/2) CLK_tb = ~CLK_tb;
    end

    // Main sequence
    initial begin
        $dumpfile("ABC.vcd");
        $dumpvars(0, DUT);
        $display("=== SYS_CTRL Testbench ===");

        initialize_signals();
        reset_sequence();

        test_write();
        test_read();
        test_add();
        test_not();

        print_results();
        $finish;
    end

    // ------------------------------------
    // Helpers
    // ------------------------------------
    task initialize_signals;
    begin
        ALU_OUT_tb      = 0;
        OUT_VALID_tb    = 0;
        RX_p_data_tb    = 0;
        RX_d_valid_tb   = 0;
        Rd_data_tb      = 0;
        RdData_valid_tb = 0;
        FIFO_full_tb    = 0;
        RST_tb          = 1;
    end
    endtask

    task reset_sequence;
    begin
        RST_tb = 0;
        #(CLK_PERIOD*2);
        RST_tb = 1;
        #(CLK_PERIOD);
    end
    endtask

    task send_rx_data(input [7:0] data, input [200:0] desc);
    begin
        $display("  Sending %s: 0x%0h", desc, data);
        @(negedge CLK_tb);
        RX_p_data_tb  = data;
        RX_d_valid_tb = 1'b1;
        @(posedge CLK_tb);
        @(negedge CLK_tb);
        RX_d_valid_tb = 1'b0;
    end
    endtask

    task check_signal(input [200:0] name, input [31:0] actual, input [31:0] expected);
    begin
        test_count = test_count + 1;
        if (actual === expected) begin
            $display("  ✓ PASS: %s = 0x%0h", name, actual);
            pass_count = pass_count + 1;
        end else begin
            $display("  ✗ FAIL: %s = 0x%0h (Expected: 0x%0h)", name, actual, expected);
            fail_count = fail_count + 1;
        end
    end
    endtask

    // ------------------------------------
    // Waiters (timeout protected)
    // ------------------------------------
    task wait_for_wren(output integer ok);
        integer i;
    begin
        ok = 0;
        for (i=0; i<TIMEOUT_CYCLES; i=i+1) begin
            @(posedge CLK_tb);
            if (WrEN_tb) begin ok=1; disable wait_for_wren; end
        end
    end
    endtask

    task wait_for_rden(output integer ok);
        integer i;
    begin
        ok = 0;
        for (i=0; i<TIMEOUT_CYCLES; i=i+1) begin
            @(posedge CLK_tb);
            if (RdEN_tb) begin ok=1; disable wait_for_rden; end
        end
    end
    endtask

    task wait_for_alu_en(output integer ok);
        integer i;
    begin
        ok = 0;
        for (i=0; i<TIMEOUT_CYCLES; i=i+1) begin
            @(posedge CLK_tb);
            if (ALU_EN_tb) begin ok=1; disable wait_for_alu_en; end
        end
    end
    endtask

    task wait_for_tx_valid(output integer ok);
        integer i;
    begin
        ok = 0;
        for (i=0; i<TIMEOUT_CYCLES; i=i+1) begin
            @(posedge CLK_tb);
            if (TX_d_valid_tb) begin ok=1; disable wait_for_tx_valid; end
        end
    end
    endtask

    // ------------------------------------
    // Tests
    // ------------------------------------
    task test_write;
        integer ok;
    begin
        $display("\n--- Test 1: Write ---");
        send_rx_data(8'hAA,"Write Command");
        send_rx_data(8'h05,"Address");
        send_rx_data(8'hAB,"Data");

        wait_for_wren(ok);
        if (!ok) $display("  ✗ TIMEOUT WrEN");
        else begin
            check_signal("WrEN",WrEN_tb,1);
            check_signal("Address",Address_tb,4'h5);
            check_signal("WrData",WrData_tb,8'hAB);
        end
    end
    endtask

    task test_read;
        integer ok;
    begin
        $display("\n--- Test 2: Read ---");
        send_rx_data(8'hBB,"Read Command");
        send_rx_data(8'h05,"Address");

        wait_for_rden(ok);
        if (!ok) $display("  ✗ TIMEOUT RdEN");
        else begin
            Rd_data_tb=8'hAB;
            RdData_valid_tb=1; @(posedge CLK_tb); RdData_valid_tb=0;

            wait_for_tx_valid(ok);
            if (!ok) $display("  ✗ TIMEOUT TX");
            else begin
                check_signal("TX_p_data",TX_p_data_tb,8'hAB);
                check_signal("TX_d_valid",TX_d_valid_tb,1);
            end
        end
    end
    endtask

    task test_add;
        integer ok;
    begin
        $display("\n--- Test 3: ALU Add ---");
        send_rx_data(8'hCC,"ALU Command");
        send_rx_data(8'h10,"Operand A");
        send_rx_data(8'h25,"Operand B");
        send_rx_data(8'h00,"FUNC=Add");

        wait_for_alu_en(ok);
        if (!ok) $display("  ✗ TIMEOUT ALU_EN");
        else begin
            @(posedge CLK_tb);
            ALU_OUT_tb=8'h35; OUT_VALID_tb=1;
            @(posedge CLK_tb); OUT_VALID_tb=0;

            wait_for_tx_valid(ok);
            if (!ok) $display("  ✗ TIMEOUT TX");
            else begin
                check_signal("TX_p_data",TX_p_data_tb,8'h35);
                check_signal("TX_d_valid",TX_d_valid_tb,1);
            end
        end
    end
    endtask

    task test_not;
        integer ok;
    begin
        $display("\n--- Test 4: ALU NOT ---");
        send_rx_data(8'hDD,"ALU No-Operand");
        send_rx_data(8'h01,"FUNC=NOT");

        wait_for_alu_en(ok);
        if (!ok) $display("  ✗ TIMEOUT ALU_EN");
        else begin
            @(posedge CLK_tb);
            ALU_OUT_tb=(~8'hAB)&8'hFF; OUT_VALID_tb=1;
            @(posedge CLK_tb); OUT_VALID_tb=0;

            wait_for_tx_valid(ok);
            if (!ok) $display("  ✗ TIMEOUT TX");
            else begin
                check_signal("TX_p_data",TX_p_data_tb,8'h54);
                check_signal("TX_d_valid",TX_d_valid_tb,1);
            end
        end
    end
    endtask

    // ------------------------------------
    // Results
    // ------------------------------------
    task print_results;
    begin
        $display("\n=== Test Results ===");
        $display("Total: %0d  Passed: %0d  Failed: %0d",test_count,pass_count,fail_count);
    end
    endtask

endmodule
