`include "UART_TX.v"
`timescale 1ns/1ps
module UART_TX_tb();
//Declaring the clock period
parameter clock_period=5;
//Declaring the testbench signals 
reg [ 7 : 0 ] P_DATA_tb;
reg Data_valid_tb;
reg PAR_EN_tb;
reg PAR_TYP_tb;
reg CLK_tb;
reg RST_tb;
wire TX_OUT_tb;
wire busy_tb;

//Declaring the loop vairables
integer i;
//Clock generation
always
    begin
        CLK_tb=0;
        #( clock_period/2 );
        CLK_tb=1;
        #( clock_period/2 );
    end

initial
    begin
        reset();
        initialization();
        $display("Test case 1: inputting a number with the parity enable off");
        @( negedge CLK_tb )
        do_operation(8'h00, 1'b1 , 1'b0 ,1'b0 );
        #(clock_period*15)
        check_TX(8'h00,8'h00 , 1'b0 ,1'b0 );

        $finish;
    end

//Tasks
task initialization();
    begin
    RST_tb=0;
    P_DATA_tb=8'b0;
    Data_valid_tb=0;
    PAR_EN_tb=0;
    PAR_TYP_tb=0;
    end
endtask

task reset();
    begin
        RST_tb=1;
        #( clock_period );
        RST_tb=0;
        #( clock_period );
        RST_tb=0;  
    end
endtask

task do_operation (input [ 7 : 0 ] data , input data_valid , input parity_enable , input parity_type );
    begin
        @( negedge CLK_tb )
        P_DATA_tb = data;
        Data_valid_tb = data_valid;
        PAR_EN_tb =parity_enable;
        PAR_TYP_tb=parity_type;
        @(negedge CLK_tb)
        Data_valid_tb=0;
    end
endtask

task check_TX( input [ 7 : 0 ] data ,input [ 7 : 0 ] expected_output , input parity_enable , input parity_type );
reg is_parity_ok;
    begin
        //@( negedge TX_OUT_tb )
        #( clock_period );
        for(  i = 0  ; i <= 7  ; i = i + 1  ) //Checking is the number is transmitted correctly
            begin
                #( clock_period );
                if( TX_OUT_tb != expected_output [ i ] )
                begin
                    $display("The is value of the %0d'th bit is incorrect, number=%b ,expected=%b" ,i, expected_output[ i ], TX_OUT_tb);
                    $display("the busy is %b",busy_tb);
                end
            end
        if( parity_enable )
            begin  
                parity_checker( data , TX_OUT_tb ,parity_type, is_parity_ok ); 
                if( !is_parity_ok ) //Checking if the parity bit is generated correctly 
                    $display("The value of the parity bit is incorect "); 
            end
        #(clock_period);
        if( !TX_OUT_tb ) //Checking if the stop bit is generated successfully 
            $display("The value of the stop bit is incorrect");

        $display("Your test case has passed successfully");
    end
endtask

task parity_checker( input [ 7 : 0 ] data  , input parity_bit , input parity_type , output valid );
reg expected_parity;
begin
    expected_parity = ^ data;
    if( parity_type )
        if( !expected_parity == parity_bit )
            valid=1;
        else
            valid=0;
    else
        if( expected_parity == parity_bit )
            valid=1;
        else 
        valid=0;
end
endtask

//Module instantiation
UART_TX UART1
(
.P_DATA( P_DATA_tb ),
.Data_valid( Data_valid_tb ),
.PAR_EN( PAR_EN_tb ),
.PAR_TYP( PAR_TYP_tb ),
.CLK( CLK_tb ),
.RST( RST_tb ),
.TX_OUT( TX_OUT_tb ),
.busy( busy_tb )
);

endmodule