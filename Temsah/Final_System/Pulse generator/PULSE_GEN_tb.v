`timescale 1ns/1ps
`include "PULSE_GEN.v"
module tb_PULSE_GEN;

    reg LVL_SIG;
    reg CLK;
    reg RST;
    wire PULSE_SIG;

    // Instantiate DUT
    PULSE_GEN uut (
        .LVL_SIG(LVL_SIG),
        .CLK(CLK),
        .RST(RST),
        .PULSE_SIG(PULSE_SIG)
    );

    // Clock generation: 10ns period
    initial CLK = 0;
    always #5 CLK = ~CLK;

    // Stimulus
    initial begin
        $dumpfile("PULSE_GEN.vcd");
        $dumpvars;
        // Initialize
        RST = 0;
        LVL_SIG = 0;
        #15;       // hold reset for a bit
        RST = 1;

        // Case 1: LVL_SIG goes high for 8 cycles
        #20 LVL_SIG = 1;
        #80 LVL_SIG = 0;

        // Case 2: LVL_SIG goes high for 11 cycles
        #30 LVL_SIG = 1;
        #110 LVL_SIG = 0;

        // Case 3: Quick 2-cycle high pulse
        #40 LVL_SIG = 1;
        #20 LVL_SIG = 0;

        // Case 4: Multiple rising edges
        #30 LVL_SIG = 1;
        #20 LVL_SIG = 0;
        #20 LVL_SIG = 1;
        #20 LVL_SIG = 0;

        // Finish simulation
        #100 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | CLK=%b | RST=%b | LVL_SIG=%b | PULSE_SIG=%b",
                 $time, CLK, RST, LVL_SIG, PULSE_SIG);
    end

endmodule
