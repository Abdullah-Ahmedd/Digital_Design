`include "DATA_SYNC.v"
`timescale 1ns/1ps
module DATA_SYNC_tb();
//Declaring the clock parameter
    parameter Clock_period=10; //assuming the clock period is 10ns
//Declaring the number of stages and bus width parameters
    parameter NUM_STAGES = 5;
    parameter BUS_WIDTH = 8;
//Declaring the testbench signals
    reg [ BUS_WIDTH - 1 : 0 ] unsync_bus_tb;
    reg bus_enable_tb;
    reg CLK_tb;
    reg RST_tb;

    wire [ BUS_WIDTH - 1 : 0 ] sync_bus_tb;
    wire enable_pulse_tb;

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
        $dumpfile("DATA_SYNC.vcd");
        $dumpvars;


        initialize();

        
        reset();
        do_operation( 8'hab,1 );
        #( Clock_period * 10 );
        reset();
        do_operation( 8'hcd,1 );
        #( Clock_period * 10 );


        
        $finish;
    end

//tasks

task initialize ();
    begin
        unsync_bus_tb=0;
        bus_enable_tb=0;
    end
endtask

task reset();
    begin
        RST_tb=0;
        #( Clock_period );
        RST_tb=1;
    end
endtask

task do_operation(input [ BUS_WIDTH - 1 : 0 ] data , input enable );
    begin
        @( posedge CLK_tb );
        unsync_bus_tb = data;
        bus_enable_tb = enable;
    end
endtask


//Module instantiation
DATA_SYNC
#( .NUM_STAGES( NUM_STAGES ), .BUS_WIDTH( BUS_WIDTH ) )
DSYNC 
(
//Declaring inputs
.unsync_bus( unsync_bus_tb ),
.bus_enable( bus_enable_tb ),
.CLK( CLK_tb ),
.RST( RST_tb ),
.sync_bus( sync_bus_tb ),
.enable_pulse( enable_pulse_tb )
);

endmodule