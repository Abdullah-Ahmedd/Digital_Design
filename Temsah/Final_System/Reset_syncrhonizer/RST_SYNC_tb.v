`include "RST_SYNC.v"
`timescale 1ns/1ps 
module RST_SYNC_tb();
//Declaring the clock parameter
    parameter Clock_period=10; //assuming the clock period is 10ns
//Declaring the number of stages parameter
    parameter Number_of_stages =4;   
//Declaring the testbecnh signals
    reg RST_tb;
    reg CLK_tb;
    wire SYNC_RST_tb;

//Clock generation
always 
    begin
        CLK_tb=0;
        #( Clock_period/2.0 );
        CLK_tb=1;
        #( Clock_period/2.0 );
    end
initial 
    begin
        $dumpfile("RST_SYNC.vcd");
        $dumpvars;

        RST_tb=0;
        #( Clock_period * 1 );
        RST_tb=1;
        #( Clock_period * 10 );

        $finish;
    end

//Module instantiaion
RST_SYNC 
#( .NUM_STAGES( Number_of_stages ) )
RSYNC
(
.RST( RST_tb ),
.CLK( CLK_tb ),
.SYNC_RST( SYNC_RST_tb )
);
endmodule    