`include "SYS_TOP.v"
`timescale 1ns/1ps

module SYS_TOP_tb();

//Declaring the parameters
  parameter Data_width = 'd8 ;
  parameter Address_width = 'd4 ;
  parameter NUM_STAGES = 'd2 ;
  parameter Depth = 'd8;
  
  wire [ 5 : 0 ] PRESCALE  ;
  assign PRESCALE = system_top.Regfile.Regfile[ 2 ][ 7 : 2 ];

//Declaring the ref clock and the UART clock
  parameter REF_CLK = 20 ;
  parameter UART_CLK = 271 ;
  reg [ 31 : 0 ] BIT_PERIOD ;
  
//Declaring the testbench signals
  reg Ref_clk_tb;
  reg RST_tb;
  reg UART_clk_tb;
  reg RX_IN_tb;
  wire TX_OUT_tb;
  wire framing_error_tb;
  wire parity_error_tb;

//Declaring the loop parameters
integer i,j;

//Clock generation
always 
  begin
    Ref_clk_tb = 0;
    #( REF_CLK/2.0 );
    Ref_clk_tb = 1;
    #( REF_CLK/2.0 );
  end
always
  begin
    UART_clk_tb=0;
    #( UART_CLK/2.0 );
    UART_clk_tb = 1;
    #( UART_CLK/2.0 );
  end

//initial block
initial 
  begin
    $dumpfile("SYS_TOP.vcd");
    $dumpvars;

    reset();
    #( BIT_PERIOD * 10 );

    BIT_PERIOD = PRESCALE * UART_CLK ; 

//Testcase 1
    $display("Test case 1: Write data then read it");
    send_data(8'hAA); send_data(8'h05); send_data(8'h55); 
    #(BIT_PERIOD * 10);
    send_data(8'hBB); send_data(8'h05);
    expected_result(8'h55);

//Testcase 2
    $display("Test case 2: ALU addition ( 10 + 25 ) (with OP)");
    send_data(8'hCC); send_data(8'd10); send_data(8'd25); send_data(8'd00);
    expected_result(8'd35);   
  
  //Testcase 3
    $display("Test case 3: ALU subtraction ( 50 - 20 ) (with OP)");
    send_data(8'hCC); send_data(8'd50); send_data(8'd20); send_data(8'd01);
    expected_result(8'd30); 

//Testcase 4
    $display("Test case 4: ALU multiplication ( 6 * 7 ) (with OP)");
    send_data(8'hCC); send_data(8'd06); send_data(8'd07); send_data(8'd02);
    expected_result(8'd42); 

//Testcase 5
    $display("Test case 5: ALU division ( 12 / 4 ) (with OP)");
    send_data(8'hCC); send_data(8'd12); send_data(8'd04); send_data(8'd03);
    expected_result(8'd3); 


//Testcase 6
    $display("Test case 6: ALU 12 AND 4 ( NO OP )");
    send_data(8'hDD); send_data(8'd04);
    expected_result(8'h04);     


//Testcase 7
    $display("Test case 7: ALU  12 OR 4 ( NO OP )");
    send_data(8'hDD); send_data(8'd05);
    expected_result(8'h0c); 

//Testcase 8
    $display("Test case 8: ALU  12 NAND 4 ( NO OP )");
    send_data(8'hDD); send_data(8'd06);
    expected_result(8'hfb); 

//Testcase 9
    $display("Test case 9: ALU  12 NOR 4 ( NO OP )");
    send_data(8'hDD); send_data(8'd07);
    expected_result(8'hf3); 

//Testcase 10
    $display("Test case 10: ALU checking whether 12 > 4 ( NO OP )");
    send_data(8'hDD); send_data(8'd10);
    expected_result(8'h02); 



    #( BIT_PERIOD * 100 );
    $finish;
  end

//Tasks
//reset task
task reset();
  begin
    RST_tb = 0;
    #( 10 * REF_CLK );
    RST_tb = 1;
    #( 10 * REF_CLK );
  end
endtask
//send data
task send_data( input [ Data_width - 1 : 0 ] data  );
  begin
        //start bit
          RX_IN_tb = 0;
          #( BIT_PERIOD );
        //Data
          for(  i = 0  ;  i < Data_width  ; i = i + 1  )
            begin
              RX_IN_tb = data [ i ];
              #( BIT_PERIOD );
            end
        //stop
        RX_IN_tb = 1; 
        #( BIT_PERIOD );
        #( BIT_PERIOD * 2 ); //a must to make sure you are past the sending packets and you are simply in the constant default bit (1)
  end
endtask
//receive data
task receive_data( output [ Data_width - 1 : 0 ] data  );
  begin
    @(negedge TX_OUT_tb )
    #( 1.5 * BIT_PERIOD );
    for(  j = 0  ;  j < Data_width  ;  j = j + 1  )
      begin
        data[ j ] = TX_OUT_tb;
        #( BIT_PERIOD ); 
      end
  end
endtask
//expected result task
task expected_result( input [ Data_width - 1 : 0 ] expected_data );
    reg [ Data_width - 1 : 0 ] received_data;
  begin
    receive_data(received_data);
    if( parity_error_tb == 0  &&  framing_error_tb==0 )
      begin
        if(received_data == expected_data)
        $display("Passed successfully as the expected data is 0x%0h and the received data is 0x%0h",expected_data , received_data );
        else
        $display ("There is an error as the expected data is 0x%0h and the received data is 0x%0h",expected_data , received_data );
      end
      else
       $display ("There is an error as the expected data is 0x%0h and the received data is 0x%0h",expected_data , received_data );
  end
endtask

//Module instantiaion
SYS_TOP
#(.Data_width ( Data_width ), .Address_width ( Address_width ) , .NUM_STAGES ( NUM_STAGES ) , .Depth ( Depth ) )
system_top
(
.Ref_clk( Ref_clk_tb ),
.RST( RST_tb ),
.UART_clk( UART_clk_tb ),
.RX_IN( RX_IN_tb ),
.TX_OUT( TX_OUT_tb ),
.parity_error( parity_error_tb ),
.framing_error( framing_error_tb )
);


endmodule 