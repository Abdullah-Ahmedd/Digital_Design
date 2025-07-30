`timescale 1ns/1ps
`include "Door.v"
module Door_tb();

//Declaring the parameters
parameter Clock_period='d20;

//Declaring testbench signals
    reg UP_Max_tb;
    reg Activate_tb;  
    reg DN_Max_tb;
    reg CLK_tb;
    reg RST_tb;

    wire UP_M_tb;
    wire DN_M_tb;

 
reg direction; //equals one when the last thing done was opening the door, zero otherwise  
 
//Declaring the loop parameters
integer i;
integer j;

//Clock generation
always 
    begin
        CLK_tb=0; 
        #( Clock_period );
        CLK_tb=1;
        #( Clock_period );
    end

initial
    begin
        $dumpfile("Door.vcd");
        $dumpvars;

        initialize();
        reset();

        //Checking is the door oppens correclty
        open_the_door();
        #(Clock_period);
        check_output( direction );

        //Checking is the door closes correclty
        #(Clock_period);
        close_the_door();
        check_output( direction );

        $finish;
    end
//Tasks
    task initialize();
        begin
            UP_Max_tb=0;
            Activate_tb=0;
            DN_Max_tb=0;
        end
    endtask

    task reset();
        begin
            RST_tb=1;
            #( Clock_period );
            RST_tb=0;
            #( Clock_period );
            RST_tb=1;
        end
    endtask

task open_the_door ();
    begin
        Activate_tb=1;
        DN_Max_tb=0;
        @(posedge CLK_tb);
        Activate_tb=0;
        #( Clock_period * 10 )
        UP_Max_tb=1;

        direction=1;       
    end
endtask

task close_the_door ();
    begin
        Activate_tb=1;
        UP_Max_tb=0;
        @(posedge CLK_tb);
        Activate_tb=0;
        #( Clock_period * 10 )
        DN_Max_tb=1;
                
        direction=0;      
    end
endtask

    task check_output( input expected );
        begin
            if( expected )
                begin
                    if( UP_Max_tb && !DN_Max_tb )
                        $display("The door has fully opened successfully");
                    else
                        $display("The door was expected to be opened but there is a problem");    
                        
                end
            if( !expected )
                begin
                    if( !UP_Max_tb && DN_Max_tb )
                        $display("The door has fully closed successfully");
                    else
                        $display("The door was expected to be closed but there is a problem");                        
                end            
        end
    endtask


//Module instantiation
Door DUT
(
.UP_Max( UP_Max_tb ),
.Activate( Activate_tb ),  
.DN_Max( DN_Max_tb ),
.CLK( CLK_tb ),
.RST( RST_tb ), 
.UP_M( UP_M_tb ),
.DN_M( DN_M_tb )
);

endmodule 
