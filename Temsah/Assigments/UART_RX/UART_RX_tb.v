`include "UART_RX.v"
`timescale 1us/1ns

module UART_RX_tb();

    // Testbench signals
    reg CLK_tb;
    reg RST_tb;
    reg RX_IN_tb;
    reg [5:0] prescale_tb;
    reg PAR_EN_tb;
    reg PAR_TYP_tb;
    wire [7:0] P_DATA_tb;
    wire data_valid_tb;

    // Loop variables
    integer i;

    // Clock parameters
    real TX_frequency = 115.2 * 1e3;
    real RX_frequency;
    real Clock_period;

    // Clock generation
    always begin
        CLK_tb = 0;
        #(Clock_period / 2.0);
        CLK_tb = 1;
        #(Clock_period / 2.0);
    end

    // Testbench initial block
    initial begin
        $dumpfile("UART_RX.vcd");
        $dumpvars;

        initialize();

        $display("Test case 1: Prescale=8, parity enable=0");
        set_prescale(6'd8);
        frame(8'hab, 1'b0, 1'b0);
        check_output(8'hab);

        $display("Test case 2: Prescale=8, parity enable=1, even parity");
        set_prescale(6'd8);
        frame(8'hab, 1'b1, 1'b0);
        check_output(8'hab);

        $display("Test case 3: Prescale=8, parity enable=1, odd parity");
        set_prescale(6'd8);
        frame(8'hab, 1'b1, 1'b1);
        check_output(8'hab);

        $finish;
    end

    // Tasks
    task reset();
    begin
        RST_tb = 0;
        repeat(prescale_tb) @(posedge CLK_tb);
        RST_tb = 1;
        repeat(prescale_tb) @(posedge CLK_tb);
    end
    endtask

    task initialize();
    begin
        RX_IN_tb = 1;
        RST_tb = 1;
        prescale_tb = 1;
        PAR_EN_tb = 0;
        PAR_TYP_tb = 0;
        reset();
    end
    endtask

    task set_prescale(input [5:0] ps);
    begin
        prescale_tb = ps;
        RX_frequency = TX_frequency * ps;
        Clock_period = (1.0 / RX_frequency) * 1e6;
    end
    endtask

    // Send a full UART frame (start, data, optional parity, stop)
    task frame(input [7:0] data, input parity_enable, input parity_type);
    reg parity_bit;
    begin
        PAR_EN_tb = parity_enable;
        PAR_TYP_tb = parity_type;

        // Idle state
        RX_IN_tb = 1;
        repeat(prescale_tb) @(posedge CLK_tb);

        // Start bit
        RX_IN_tb = 0;
        repeat(prescale_tb) @(posedge CLK_tb);

        // Data bits
        for(i = 0; i <= 7; i = i + 1) begin
            RX_IN_tb = data[i];
            repeat(prescale_tb) @(posedge CLK_tb);
        end

        // Parity bit
        if(parity_enable) begin
            parity_bit = (parity_type) ? ~(^data) : ^data;
            RX_IN_tb = parity_bit;
            repeat(prescale_tb) @(posedge CLK_tb);
        end

        // Stop bit
        RX_IN_tb = 1;
        repeat(prescale_tb) @(posedge CLK_tb);
    end
    endtask

    // Check output after data_valid goes high
    task check_output(input [7:0] data);
    begin
        // Wait until data_valid is high
        wait(data_valid_tb == 1);
        if(P_DATA_tb == data)
            $display("Data received correctly: %0h", P_DATA_tb);
        else
            $display("ERROR: Received %0h, expected %0h", P_DATA_tb, data);
        // Wait one more clock cycle to avoid race
        repeat(2) @(posedge CLK_tb);
    end
    endtask

    // UART_RX module instantiation
    UART_RX UART1 (
        .CLK(CLK_tb),
        .RST(RST_tb),
        .RX_IN(RX_IN_tb),
        .prescale(prescale_tb),
        .PAR_EN(PAR_EN_tb),
        .PAR_TYP(PAR_TYP_tb),
        .P_DATA(P_DATA_tb),
        .data_valid(data_valid_tb)
    );

endmodule
