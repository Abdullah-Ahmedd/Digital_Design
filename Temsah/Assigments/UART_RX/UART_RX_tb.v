/*Important note : you cant use #(Clock_period)
as your prescale function scale the clock correctly ,but remeber you did the prescaled clock just for the data 
sampling block to check the majority of the samples and give you the best value otherwise you want the system clock
so what you want is still to wait 1 clock cycle of the system clock but the clock is scaled so what you have to do it 
is to wait for the clock cycle value 
example to make you understand better 
your system clock is 10 (regardless of the unit )
and you scaled the clock to be 1 but you still want to wait 1 clock cylce of the system block so what you will do it 
repeat( prescaled value (which is 10 in our example) ) @(posedge CLK_tb) which is ==#(Clock_period of the system clock)
also notice that repeat(prescale_tb) @(posedge CLK_tb); could be repeat(prescale_tb) #(clock_period); in out code but it 
could differ in other codes just what is important is to take care that to cancel the presacled effect of any thing 
do repeat(prescaled value)
*/
`include "UART_RX.v"
`timescale 1us/1ns
module UART_RX_tb();


//Declaring the testbench signals
    reg CLK_tb;
    reg  RST_tb;
    reg RX_IN_tb;
    reg [ 5 : 0 ]prescale_tb;
    reg  PAR_EN_tb;
    reg PAR_TYP_tb;
    wire [ 7 : 0 ]P_DATA_tb;
    wire data_vali_tb;

//Declaring the loop parameters
integer i;
integer j;


real TX_frequency =115.2  * 1e3 ;
real RX_frequnecy;
real Clock_period;

//Clock generation 
always 
    begin
        CLK_tb=0;
        #( Clock_period / 2.0 );
        CLK_tb=1;
        #( Clock_period / 2.0 );
    end


initial 
    begin
        $dumpfile("UART_RX.vcd");
        $dumpvars;
        initialize();
        

        $display("Test case 1 :Prescale=8 with parity enable=0 ");
            set_prescale( 4'd8 );
            frame(8'hab, 1'b0 , 1'b0 );
            check_output( 8'hab, 1'b0 , 1'b0 );
        reset();

        $display("Test case 2 :Prescale=8 with parity enable=1 and the type of the parity is even parity ");
            set_prescale( 4'd8 );
            frame(8'hab, 1'b1 , 1'b0 );
            check_output( 8'hab, 1'b1 , 1'b0 );
        reset();

        $display("Test case 3 :Prescale=8 with parity enable=1 and the type of the parity is odd parity ");
            set_prescale( 4'd8 );
            frame(8'hab, 1'b1 , 1'b1 );
            check_output( 8'hab, 1'b1 , 1'b1 );
        reset();

        $display("Test case 4 :Prescale=16 with parity enable=0 ");
            set_prescale( 5'd16 );
            frame(8'hcd, 1'b0 , 1'b0 );
            check_output( 8'hcd, 1'b0 , 1'b0 );
        reset();

        $display("Test case 5 :Prescale=16 with parity enable=1 and the type of the parity is even parity ");
            set_prescale( 5'd16 );
            frame(8'hcd, 1'b1 , 1'b0 );
            check_output( 8'hcd, 1'b1 , 1'b0 );
        reset();

        $display("Test case 6 :Prescale=16 with parity enable=1 and the type of the parity is odd parity ");
            set_prescale( 5'd16 );
            frame(8'hcd, 1'b1 , 1'b1 );
            check_output( 8'hcd, 1'b1 , 1'b1 );
        reset();

        $display("Test case 7 :Prescale=32 with parity enable=0 ");
            set_prescale( 6'd32 );
            frame(8'hef, 1'b0 , 1'b0 );
            check_output( 8'hef, 1'b0 , 1'b0 );
        reset();

        $display("Test case 8 :Prescale=32 with parity enable=1 and the type of the parity is even parity ");
            set_prescale( 6'd32 );
            frame(8'hef, 1'b1 , 1'b0 );
            check_output( 8'hef, 1'b1 , 1'b0 );
        reset();

        $display("Test case 9 :Prescale=32 with parity enable=1 and the type of the parity is odd parity ");
            set_prescale( 6'd32 );
            frame(8'hef, 1'b1 , 1'b1 );
            check_output( 8'hef, 1'b1 , 1'b1 );
        reset();

        $finish;

    end


//Tasks

task reset();
begin
    RST_tb=0;
    repeat(prescale_tb) #(Clock_period);
    RST_tb=1;
    repeat(prescale_tb) #(Clock_period);
end
endtask

task initialize();
begin
    RX_IN_tb=1;
    RST_tb=1;
    prescale_tb=1;
    PAR_EN_tb=0;
    PAR_TYP_tb=0;
    reset();
end
endtask

task set_prescale ( input [ 5 : 0 ] ps );
    begin
        prescale_tb = ps;
        RX_frequnecy = TX_frequency * ps;
        Clock_period = ( 1.0 / RX_frequnecy ) * 1e6; 
    end
endtask

task frame (input [ 7 : 0 ] data, input parity_enable , input parity_type );
reg parity_bit;
begin
    //Idle state
    RX_IN_tb=1;
    repeat(prescale_tb) #(Clock_period);

    //Start bit
    RX_IN_tb=0;
    repeat(prescale_tb) #(Clock_period);

    //Data bits
    for(  i = 0  ;  i <= 7 ;  i = i + 1  )
        begin
            RX_IN_tb = data[ i ];
            repeat(prescale_tb) #(Clock_period);
        end

    //Parity bit
    if( parity_enable )
        begin
            if( parity_type )
            parity_bit = ~ ( ^ data );
            else
            parity_bit = ^ data;
            RX_IN_tb = parity_bit;
            repeat(prescale_tb) #(Clock_period);
        end
    //Stop bit
    RX_IN_tb=1;
    repeat(prescale_tb) #(Clock_period);     
end
endtask

task check_output (input [ 7 : 0 ] data , input parity_enable , input parity_bit );
    begin
        //@(posedge data_vali_tb );
        if( P_DATA_tb == data )
            begin
                $display("The data is received correctly");
            end
        else
                $display("The received data is %0h ,while the expected data to be received is %0h " , data ,P_DATA_tb ); 
    end
endtask


//Module instantiation
UART_RX UART1
(
.CLK( CLK_tb ),
.RST( RST_tb ),
.RX_IN( RX_IN_tb ),
.prescale( prescale_tb ),
.PAR_EN( PAR_EN_tb ),
.PAR_TYP( PAR_TYP_tb ),
.P_DATA( P_DATA_tb ),
.data_valid( data_vali_tb )
);


endmodule