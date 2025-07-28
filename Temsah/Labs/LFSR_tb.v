`include "LFSR.v"
`timescale 1ns/1ps //the freuqnecy was not mentioned so i did is the same as the model answer 
module LFSR_tb();
//Declaring the parameters 
    parameter Clock_period=10; //assumed that the period is 10ns
    parameter Number_of_test_cases=5;
    parameter LFSR_width=8; //in the specs the number of registers is 8 but it is a professional approach to make the width generic specially in the testbench to be ready for futute improvements
//Declaring the testbench signals    
    reg clock_tb;
    reg reset_tb;
    reg [ LFSR_width-1 : 0 ] Seed_tb;
    reg enable_tb;
    reg enable_out_tb;

    wire OUT_tb;
    wire Valid_tb;
//Declaring the loop variables 
    integer i,oper;
//Declaring the memories used to sotred the inputs and expected output 
    reg [ LFSR_width-1 : 0 ]  Test_seeds [ Number_of_test_cases-1 : 0 ] ;
    reg [ LFSR_width-1 : 0 ]  Expected_outputs [ Number_of_test_cases-1 : 0 ] ;

//Clock generation 
always 
    begin
        clock_tb=1; 
        #( Clock_period/2 );
        clock_tb=0; 
        #( Clock_period/2 );
    end

initial 
    begin
        //Making the vcd file
        $dumpfile("LFSR.vcd");
        $dumpvars;
        
        //Reading the inputs and expected outputs
        $readmemb("Seeds_b.txt",Test_seeds);
        $readmemb("Expec_Out_b.txt",Expected_outputs);


        for(oper=0;oper<Number_of_test_cases;oper=oper+1)
        begin
            operation(Test_seeds[oper] );
            check_out(Expected_outputs[oper] ,oper);

        end

        #100
        $finish;
    end
//Declaring the needed tasks
    //Initialization task
        task initialization();
        begin
        clock_tb=1'b0;
        reset_tb=1'b0;
        enable_tb=1'b0;
        enable_out_tb=1'b0;
        Seed_tb='b10010011; //just any number (a dummy number) (must contain both zeros and ones though) to keep the shift operation happening and the numbers toggeling till the user enters the actual numbers
        end
        endtask

    //Reset task (we did it as in the above initialization task reset it active so we need to deactivate it )
        task Reset();
        begin
        reset_tb=1'b1;
        #(Clock_period/2)
         reset_tb=1'b0;
        #(Clock_period/2)
        reset_tb=1'b1;
        end
        endtask
    
    //Operation task which is the task that does the main thing our block does (we input and does the operation meaning at this task we dont care about what the output looks like (we care about the output in the next task check out task))
        task operation( input [ LFSR_width-1 : 0 ] IN_Seed);
        begin
            Seed_tb=IN_Seed;
            Reset();//we did reset here as in the specs (input seed in the LFSR at reset acitvation)
            #(Clock_period)
            enable_tb=1'b1;     //we opened the enable out 
            #(10*Clock_period) // we will wait 10 clock periods as given in the specs
            enable_tb=1'b0; //after the operation is done we need to close the enable
        end
        endtask
    //Check out task (after the above function is done we need to monitor the output and see if its value is correct)
    task check_out( input [ LFSR_width-1 : 0 ] expected_output,  input integer number );
    reg [ LFSR_width-1 : 0 ] OP_result; //it keeps storing all the outputs coming off out to check if the chip is operating coreeclty (it is reg as it is used inside a procedural block (above it there is @posedge))
    begin
        enable_tb=1'b0;
        #(Clock_period)
        enable_out_tb=1'b1;
        @(posedge Valid_tb)
           for(i=0;i<LFSR_width;i=i+1)
            begin
                #(Clock_period)
                OP_result[i] = OUT_tb; //we used = not not <= as this is a testbench which is no rules ground and as we have said in the test bench we just input a value wait for some time and then check if the input is logical so we dont use <= 
            end
            if(OP_result == expected_output)
            $display("Test case %0d has succeeded",number);
            else 
            $display("Test case %0d has failed",number);
        
        enable_out_tb=1'b0;
    end
    endtask

//making the module instantation 
LFSR DUT
(
.clock( clock_tb ),
.reset( reset_tb ),
.Seed( Seed_tb ),
.enable( enable_tb ),
.enable_out( enable_out_tb ),
.OUT( OUT_tb ),
.Valid( Valid_tb )
);

endmodule 
