`timescale 1ns/1ps
`include "SYS_CNTRL.v"
module SYS_CTRL_TB();

    // Parameters
    parameter Data_width = 8;
    parameter Address_width = 4;
    parameter CLK_PERIOD = 20; // 50MHz
    
    // Test signals
    reg [Data_width-1:0] ALU_OUT_tb;
    reg OUT_VALID_tb;
    reg [Data_width-1:0] RX_p_data_tb;
    reg RX_d_valid_tb;
    reg [Data_width-1:0] Rd_data_tb;
    reg RdData_valid_tb;
    reg FIFO_full_tb;
    reg CLK_tb;
    reg RST_tb;
    
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
    
    // Test control variables
    integer test_count = 0;
    integer pass_count = 0;
    integer fail_count = 0;
    
    // DUT instantiation
    SYS_CNTRL #(
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
    
    // Clock generation
    initial begin
        CLK_tb = 0;
        forever #(CLK_PERIOD/2) CLK_tb = ~CLK_tb;
    end
    
    // Test stimulus
    initial begin
        $display("=== SYS_CTRL Self-Checking Testbench Started ===");
        $display("Time: %0t", $time);
        
        // Initialize signals
        initialize_signals();
        
        // Reset sequence
        reset_sequence();
        
        // Test 1: Register File Write Command (0xAA)
        test_rf_write_command();
        
        // Test 2: Register File Read Command (0xBB)  
        test_rf_read_command();
        
        // Test 3: ALU Operation with Operands Command (0xCC)
        test_alu_with_operands_command();
        
        // Test 4: ALU Operation without Operands Command (0xDD)
        test_alu_without_operands_command();
        
        // Test 5: Invalid Command
        test_invalid_command();
        
        // Test 6: Clock divider enable
        test_clk_div_enable();
        
        // Test 7: FIFO full condition
        test_fifo_full_condition();
        
        // Final results
        print_test_results();
        
        $finish;
    end
    
    // Task: Initialize all signals
    task initialize_signals();
        begin
            ALU_OUT_tb = 0;
            OUT_VALID_tb = 0;
            RX_p_data_tb = 0;
            RX_d_valid_tb = 0;
            Rd_data_tb = 0;
            RdData_valid_tb = 0;
            FIFO_full_tb = 0;
            RST_tb = 1;
        end
    endtask
    
    // Task: Reset sequence
    task reset_sequence();
        begin
            $display("\n--- Reset Test ---");
            RST_tb = 0;
            #(CLK_PERIOD * 2);
            RST_tb = 1;
            #(CLK_PERIOD);
            
            // Check if clk_div_en is always 1
            check_signal("clk_div_en after reset", clk_div_en_tb, 1'b1);
        end
    endtask
    
    // Task: Test Register File Write Command (0xAA)
    task test_rf_write_command();
        begin
            $display("\n--- Test 1: Register File Write Command (0xAA) ---");
            
            // Send command 0xAA
            send_rx_data(8'hAA, "RF Write Command");
            wait_clock_cycles(1); // Wait for command to be stored
            check_fsm_state("After RF Write Command", 4'b0010); // Register_file_address
            
            // Send address 0x5
            send_rx_data(8'h05, "RF Address");
            wait_clock_cycles(1); // Wait for address to be stored
            check_fsm_state("After RF Address", 4'b0011); // Register_file_data
            
            // Send data 0x33
            send_rx_data(8'h33, "RF Data");
            wait_clock_cycles(1); // Wait for data to be stored
            check_fsm_state("After RF Data", 4'b0101); // Write_operation
            
            // Check write enable and address/data in Write_operation state
            check_signal("WrEN during write", WrEN_tb, 1'b1);
            check_signal("Address during write", Address_tb, 4'h5);
            check_signal("WrData during write", WrData_tb, 8'h33);
            
            // Next cycle should go to Send_data_TX
            wait_clock_cycles(1);
            check_fsm_state("After Write Operation", 4'b1010); // Send_data_TX
            
            // Check TX signals
            check_signal("TX_d_valid during send", TX_d_valid_tb, 1'b1);
            
            // Should return to Idle
            wait_clock_cycles(1);
            check_fsm_state("Return to Idle", 4'b0000); // Idle
        end
    endtask
    
    // Task: Test Register File Read Command (0xBB)
    task test_rf_read_command();
        begin
            $display("\n--- Test 2: Register File Read Command (0xBB) ---");
            
            // Send command 0xBB
            send_rx_data(8'hBB, "RF Read Command");
            wait_clock_cycles(1);
            check_fsm_state("After RF Read Command", 4'b0010); // Register_file_address
            
            // Send address 0x7
            send_rx_data(8'h07, "RF Read Address");
            wait_clock_cycles(1);
            check_fsm_state("After RF Read Address", 4'b0100); // Read_operation
            
            // Check read enable
            check_signal("RdEN during read", RdEN_tb, 1'b1);
            check_signal("Address during read", Address_tb, 4'h7);
            
            // Simulate read data valid with data 0x55
            Rd_data_tb = 8'h55;
            RdData_valid_tb = 1'b1;
            wait_clock_cycles(1);
            RdData_valid_tb = 1'b0;
            
            check_fsm_state("After Read Data Valid", 4'b1010); // Send_data_TX
            
            // Check TX data
            check_signal("TX_p_data after read", TX_p_data_tb, 8'h55);
            check_signal("TX_d_valid after read", TX_d_valid_tb, 1'b1);
            
            // Return to Idle
            wait_clock_cycles(1);
            check_fsm_state("Return to Idle after read", 4'b0000);
        end
    endtask
    
    // Task: Test ALU Operation with Operands Command (0xCC)
    task test_alu_with_operands_command();
        begin
            $display("\n--- Test 3: ALU Operation with Operands Command (0xCC) ---");
            
            // Send command 0xCC
            send_rx_data(8'hCC, "ALU with Operands Command");
            wait_clock_cycles(1);
            check_fsm_state("After ALU Command", 4'b0110); // ALU_operand_A
            
            // Send operand A = 0x12
            send_rx_data(8'h12, "ALU Operand A");
            
            // Check that operand A is written to address 0
            check_signal("WrEN for Operand A", WrEN_tb, 1'b1);
            check_signal("Address for Operand A", Address_tb, 4'h0);
            check_signal("WrData for Operand A", WrData_tb, 8'h12);
            
            wait_clock_cycles(1);
            check_fsm_state("After ALU Operand A", 4'b0111); // ALU_operand_B
            
            // Send operand B = 0x34
            send_rx_data(8'h34, "ALU Operand B");
            
            // Check that operand B is written to address 1
            check_signal("WrEN for Operand B", WrEN_tb, 1'b1);
            check_signal("Address for Operand B", Address_tb, 4'h1);
            check_signal("WrData for Operand B", WrData_tb, 8'h34);
            
            wait_clock_cycles(1);
            check_fsm_state("After ALU Operand B", 4'b1000); // ALU_OP_code
            
            // Send ALU function = 0x0 (Addition)
            send_rx_data(8'h00, "ALU Function");
            wait_clock_cycles(1);
            check_fsm_state("After ALU Function", 4'b1001); // ALU_operation
            
            // Check ALU enable and clock enable
            check_signal("ALU_EN during operation", ALU_EN_tb, 1'b1);
            check_signal("CLK_EN during operation", CLK_EN_tb, 1'b1);
            check_signal("ALU_FUN during operation", ALU_FUN_tb, 4'h0);
            
            // Simulate ALU result
            ALU_OUT_tb = 8'h46; // 0x12 + 0x34 = 0x46
            OUT_VALID_tb = 1'b1;
            wait_clock_cycles(1);
            OUT_VALID_tb = 1'b0;
            
            check_fsm_state("After ALU Result", 4'b1010); // Send_data_TX
            
            // Check TX data
            check_signal("TX_p_data after ALU", TX_p_data_tb, 8'h46);
            check_signal("TX_d_valid after ALU", TX_d_valid_tb, 1'b1);
            
            // Return to Idle
            wait_clock_cycles(1);
            check_fsm_state("Return to Idle after ALU", 4'b0000);
        end
    endtask
    
    // Task: Test ALU Operation without Operands Command (0xDD)
    task test_alu_without_operands_command();
        begin
            $display("\n--- Test 4: ALU Operation without Operands Command (0xDD) ---");
            
            // Send command 0xDD
            send_rx_data(8'hDD, "ALU without Operands Command");
            wait_clock_cycles(1);
            check_fsm_state("After ALU No-Op Command", 4'b1000); // ALU_OP_code
            
            // Send ALU function = 0x5 (OR operation)
            send_rx_data(8'h05, "ALU Function OR");
            wait_clock_cycles(1);
            check_fsm_state("After ALU Function", 4'b1001); // ALU_operation
            
            // Check ALU enable and function
            check_signal("ALU_EN for no-op", ALU_EN_tb, 1'b1);
            check_signal("CLK_EN for no-op", CLK_EN_tb, 1'b1);
            check_signal("ALU_FUN for no-op", ALU_FUN_tb, 4'h5);
            
            // Simulate ALU result
            ALU_OUT_tb = 8'h76; // Simulated OR result
            OUT_VALID_tb = 1'b1;
            wait_clock_cycles(1);
            OUT_VALID_tb = 1'b0;
            
            check_fsm_state("After ALU No-Op Result", 4'b1010); // Send_data_TX
            
            // Check TX data
            check_signal("TX_p_data after ALU no-op", TX_p_data_tb, 8'h76);
            
            // Return to Idle
            wait_clock_cycles(1);
            check_fsm_state("Return to Idle after ALU no-op", 4'b0000);
        end
    endtask
    
    // Task: Test Invalid Command
    task test_invalid_command();
        begin
            $display("\n--- Test 5: Invalid Command ---");
            
            // Send invalid command 0x99
            send_rx_data(8'h99, "Invalid Command");
            wait_clock_cycles(1);
            
            // Should return to Idle
            check_fsm_state("After Invalid Command", 4'b0000);
        end
    endtask
    
    // Task: Test Clock Divider Enable
    task test_clk_div_enable();
        begin
            $display("\n--- Test 6: Clock Divider Enable ---");
            
            // clk_div_en should always be 1
            repeat(10) begin
                wait_clock_cycles(1);
                check_signal("clk_div_en always high", clk_div_en_tb, 1'b1);
            end
        end
    endtask
    
    // Task: Test FIFO Full Condition
    task test_fifo_full_condition();
        begin
            $display("\n--- Test 7: FIFO Full Condition ---");
            
            // Setup a read operation
            send_rx_data(8'hBB, "RF Read for FIFO test");
            wait_clock_cycles(1);
            send_rx_data(8'h08, "RF Address for FIFO test");
            wait_clock_cycles(1);
            
            Rd_data_tb = 8'hAB;
            RdData_valid_tb = 1'b1;
            wait_clock_cycles(1);
            RdData_valid_tb = 1'b0;
            
            // Set FIFO full
            FIFO_full_tb = 1'b1;
            
            // TX should not be valid when FIFO is full
            check_signal("TX_d_valid when FIFO full", TX_d_valid_tb, 1'b0);
            
            // Clear FIFO full
            FIFO_full_tb = 1'b0;
            
            // Now TX should be valid
            check_signal("TX_d_valid when FIFO not full", TX_d_valid_tb, 1'b1);
            
            wait_clock_cycles(1);
        end
    endtask
    
    // Task: Send RX data with proper timing
    task send_rx_data(input [7:0] data, input [200:0] description);
        begin
            $display("  Sending %s: 0x%02h", description, data);
            @(negedge CLK_tb); // Setup data on negative edge
            RX_p_data_tb = data;
            RX_d_valid_tb = 1'b1;
            @(posedge CLK_tb); // Data captured on positive edge
            @(negedge CLK_tb); 
            RX_d_valid_tb = 1'b0;
        end
    endtask
    
    // Task: Wait for specified number of clock cycles
    task wait_clock_cycles(input integer cycles);
        begin
            repeat(cycles) @(posedge CLK_tb);
        end
    endtask
    
    // Task: Check signal value
    task check_signal(input [200:0] signal_name, input [31:0] actual, input [31:0] expected);
        begin
            test_count = test_count + 1;
            if (actual === expected) begin
                $display("  ✓ PASS: %s = 0x%0h (Expected: 0x%0h)", signal_name, actual, expected);
                pass_count = pass_count + 1;
            end else begin
                $display("  ✗ FAIL: %s = 0x%0h (Expected: 0x%0h)", signal_name, actual, expected);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    // Task: Check FSM state (accessing internal signal)
    task check_fsm_state(input [200:0] description, input [3:0] expected_state);
        begin
            test_count = test_count + 1;
            if (DUT.Current_state === expected_state) begin
                $display("  ✓ PASS: %s - FSM State = %b (Expected: %b)", description, DUT.Current_state, expected_state);
                pass_count = pass_count + 1;
            end else begin
                $display("  ✗ FAIL: %s - FSM State = %b (Expected: %b)", description, DUT.Current_state, expected_state);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    // Task: Print test results
    task print_test_results();
        begin
            $display("\n=== Test Results ===");
            $display("Total Tests: %0d", test_count);
            $display("Passed: %0d", pass_count);
            $display("Failed: %0d", fail_count);
            
            if (fail_count == 0) begin
                $display("🎉 ALL TESTS PASSED! 🎉");
            end else begin
                $display("❌ Some tests failed. Please check the design.");
            end
            
            $display("Test Coverage:");
            $display("  - Register File Write Command (0xAA): ✓");
            $display("  - Register File Read Command (0xBB): ✓");
            $display("  - ALU with Operands Command (0xCC): ✓");
            $display("  - ALU without Operands Command (0xDD): ✓");
            $display("  - Invalid Command Handling: ✓");
            $display("  - Clock Divider Enable: ✓");
            $display("  - FIFO Full Condition: ✓");
            $display("  - FSM State Transitions: ✓");
            $display("  - Control Signal Generation: ✓");
        end
    endtask

endmodule