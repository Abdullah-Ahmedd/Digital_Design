`include "CRC.v"
`timescale 1ns/1ps
module CRC_tbb();
//Declaring the parameters
    parameter Clock_period=100;
    parameter Number_of_test_cases='d10;
    parameter LFSR_width=8;
//Declaring the testbench signals
    reg  DATA_tb;
    reg ACTIVE_tb;
    reg CLK_tb;
    reg RST_tb;

    wire CRC_tb;
    wire Valid_tb;    

//Declaring the loop variables
    integer i;
    integer oper;
//Declaring the memories used to store the input and expected output 
reg [ LFSR_width - 1 : 0 ] Test_seeds [ Number_of_test_cases - 1 : 0 ];
reg [ LFSR_width - 1 : 0 ] Expected_output [ Number_of_test_cases - 1 : 0 ];

//Clock generaion
always 
begin
    CLK_tb=0;
    #( Clock_period/2 );
    CLK_tb=1;
    #( Clock_period/2 );
end
initial 
    begin
        //Making the vcd file
        $dumpfile("CRC.vcd");
        $dumpvars;
        //Initializing the block
        Initialization();
        //Reading the inputs and expected outputs
        $readmemh("DATA_h.txt",Test_seeds);
        $readmemh("Expec_Out_h.txt",Expected_output);


        for(oper=0;oper<Number_of_test_cases;oper=oper+1)
        begin
            Operation(Test_seeds[oper] );
            check_CRC(Expected_output[oper] ,oper);

        end

        #100
        $finish;

    end

//Tasks
    task Initialization();
        begin
            CLK_tb=1'b0;
            RST_tb=1'b0;
            DATA_tb=1'b0;
            ACTIVE_tb=1'b0;
        end
    endtask

    task Reset();
        begin
            RST_tb=1'b1;
            #(Clock_period/2);
            RST_tb=1'b0;
            #(Clock_period/2);
            RST_tb=1'b1;

        end
    endtask

    task Operation( input [ LFSR_width - 1 : 0 ] IN_Seed );
        begin
            Reset();
            ACTIVE_tb=1;
            for(i=0;i<=7;i=i+1)
            begin
                DATA_tb=IN_Seed[i];
                #(Clock_period);
            end
            ACTIVE_tb=0;
        end
    endtask

task check_CRC( input [ LFSR_width - 1 : 0 ] expected_output, input integer Test_case_number );
 reg [ LFSR_width-1 : 0 ] OP_result;
    begin
        #(Clock_period)
        @(posedge Valid_tb)
           for(i=0;i<LFSR_width;i=i+1)
            begin
                @(negedge CLK_tb)
                OP_result[i] = CRC_tb; //we used = not not <= as this is a testbench which is no rules ground and as we have said in the test bench we just input a value wait for some time and then check if the input is logical so we dont use <= 
            end
            if(OP_result == expected_output)
            $display("Test case %0d has succeeded",Test_case_number);
            else 
            $display("Test case %0d has failed",Test_case_number);
        
        ACTIVE_tb=0;

    end
endtask

//Module instantiation
CRC DUT
( 
.DATA(DATA_tb),
.ACTIVE(ACTIVE_tb),
.CLK(CLK_tb),
.RST(RST_tb),
.CRC(CRC_tb),
.Valid(Valid_tb)     
);

endmodule