`include "UART_TX.v"
`timescale 1ns/1ps
module UART_TX_tb();
//Declaring the data width parameter
parameter Data_width = 8;
//Declaring the clock period
parameter clock_period=10;
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
        #( clock_period/2.0 );
        CLK_tb=1;
        #( clock_period/2.0 );
    end

initial
    begin
        $dumpfile("UART_TX.vcd");
        $dumpvars;
        initialization();

            $display("Test case 1: inputting all zeros");
                    @( negedge CLK_tb )
                    do_operation(8'h00, 1'b0 ,1'b0 );
                    #( clock_period );
                    check_TX(8'h00 );
                    #( clock_period );

            reset();

            $display("Test case 2: inputting all ones");
                    @( negedge CLK_tb )
                    do_operation(8'hff, 1'b0 ,1'b0 );
                    #( clock_period );
                    check_TX(8'hff );
                    #( clock_period );                    

            reset();

            $display("Test case 3: Checking if the serializer outputs the LSB first ");
                    @( negedge CLK_tb )
                    do_operation(8'h01, 1'b0 ,1'b0 );
                    #( clock_period );
                    check_TX(8'h01 );
                    #( clock_period );

            reset();                    
                
                   
            $display("Test case 4: inputting a number with the parity enable off");
                    @( negedge CLK_tb )
                    do_operation(8'hab, 1'b0 ,1'b0 );
                    #( clock_period );
                    check_TX(8'hab );
                    #( clock_period );

            reset();

            $display("Test case 5: inputting a number with the parity enable on (even parity)");
                    @( negedge CLK_tb )
                    do_operation(8'b01001000, 1'b1 ,1'b0 );
                    #( clock_period );
                    check_TX(8'b1001000 );

            reset();

            $display("Test case 6: inputting a number with the parity enable on (odd parity)");
                    @( negedge CLK_tb )
                    do_operation(8'b01001000, 1'b1 ,1'b1 );
                    #( clock_period );
                    check_TX(8'b1001000 );

            reset();

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
    reset();
    end
endtask

task reset();
    begin
        RST_tb=0;
        #( clock_period );
        RST_tb=1;  
        #( clock_period );
    end
endtask

task do_operation (input [ Data_width - 1 : 0 ] data  , input parity_enable , input parity_type );
    begin
        @( posedge CLK_tb )
        P_DATA_tb = data;
        Data_valid_tb = 1'b1;
        PAR_EN_tb =parity_enable;
        PAR_TYP_tb=parity_type;
        @( posedge CLK_tb )
        Data_valid_tb=1'b0;
    end
endtask

task check_TX( input [ Data_width - 1 : 0 ] data );
reg is_parity_ok;
    begin
        


        #( clock_period );
        for(  i = 0  ; i <= Data_width - 1  ; i = i + 1  ) //Checking is the number is transmitted correctly
            begin
                #( clock_period );
                if( TX_OUT_tb != data [ i ] )
                begin
                    $display("The value of the %0d'th bit is incorrect, number=%b ,expected=%b" ,i, TX_OUT_tb, data[ i ]);
                    $display("the busy is %b",busy_tb);
                end
        
            end
        if( PAR_EN_tb )
            begin  
                #( clock_period );
                parity_checker( is_parity_ok ); 
                if( !is_parity_ok ) //Checking if the parity bit is generated correctly 
                    $display("The value of the parity bit is incorect "); 
            end
        #(clock_period);
        if( !TX_OUT_tb ) //Checking if the stop bit is generated successfully 
            $display("The value of the stop bit is incorrect");

        $display("Your test case has passed successfully");
    end
endtask

task parity_checker( output valid );
reg expected_parity;
begin
    expected_parity = ^ P_DATA_tb;
    if( PAR_TYP_tb ) //odd parity
        if(  TX_OUT_tb == ~ expected_parity )
            valid=1;
        else
            valid=0;
    else //even parity 
        if( TX_OUT_tb == expected_parity )
            valid=1;
        else 
        valid=0;
end
endtask

//Module instantiation
UART_TX 
#( .Data_width ( Data_width ) )
DUT
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