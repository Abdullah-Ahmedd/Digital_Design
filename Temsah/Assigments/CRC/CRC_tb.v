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
reg [ LFSR_width - 1 : 0 ] Test_seeds [ 0 : Number_of_test_cases - 1 ];
reg [ LFSR_width - 1 : 0 ] Expected_output [ 0 : Number_of_test_cases - 1 ];

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


        for( oper = 0 ; oper < Number_of_test_cases ; oper = oper + 1 )
        begin
            Operation( Test_seeds[oper] );
            #(Clock_period);
            check_CRC(Expected_output[oper] ,oper);
        end

        #(Clock_period*10);
        $finish;

    end

//Tasks
    task Initialization();
        begin
            RST_tb=1'b0;
            DATA_tb=1'b0;
            ACTIVE_tb=1'b0;
            Reset();
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
            for( i = 7 ; i >= 0 ; i = i - 1 )
            begin
                DATA_tb = IN_Seed[ 7 - i ];
                #(Clock_period);
            end
            ACTIVE_tb=0;
        end
    endtask

task check_CRC( input [ LFSR_width - 1 : 0 ] expected_output, input integer Test_case_number );
 reg [ LFSR_width-1 : 0 ] OP_result;
    begin 
        //@(posedge Valid_tb) this was the error in the code as now you wait for a whole clock cycle before outputting anything and during this cycle the shifter is shifting and xoring the numbers so they output is different from the expected (same output and result will be with the negedge as you will also wait for a whole clock cycle)       
           for(i=0;i<LFSR_width;i=i+1)
            begin
                @(negedge CLK_tb) //must be negedge as you know untill otherwise is mentioned all the systems are edge rising clock and it is a professional practice to input at the negative edge and look at the output also at the negative edge to make sure everything ahd enough setting time and the output is stable 
                OP_result[i] = CRC_tb; 
            end
            if(OP_result == expected_output)
                    $display("Test case %0d has succeeded",Test_case_number);
            else 
                begin
                    $display("Test case %0d has failed",Test_case_number);
                    $display("The obtained result is %0H while the expected output is %0H ",OP_result, expected_output );
                end
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