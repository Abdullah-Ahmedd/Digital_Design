`include "ASYNC_FIFO.v"
`timescale 1ns/1ps
module ASYNC_FIFO_tb();
//Declaring the read and write clock periods
  parameter Wperiod = 10 ;
  parameter Rperiod =25 ;
//Declaring the parameters
    parameter Data_width = 8;
    parameter Depth = 8;
    parameter Address = 3; // depth = 2^(Address) 
    parameter NUM_STAGES= 2;
//Declaring the testbench signals
    reg Winc_tb;
    reg Wrst_tb;
    reg Wclk_tb;
    reg Rinc_tb;
    reg Rrst_tb;
    reg Rclk_tb;
    reg [ Data_width - 1 : 0 ] Wrdata_tb;
    wire Wfull_tb;
    wire Rempty_tb;
    wire [Data_width - 1 : 0 ] Rdata_tb;
//Declaring the loop variabe
    integer i;
    integer Windex; //write index to know how many elements have been written
    integer Rindex; //read index to know how many elements have been read
//Declaring an internal memory to stored the expected output at
    reg [ Data_width - 1 : 0 ] expected_output [ Depth - 1 : 0 ];
//Delcaring a done flag that equals one when a cetain task is done
    reg done;

//Clock generation
always //Write clock 
  begin
    Wclk_tb=0;
    #( Wperiod/2.0 );
    Wclk_tb=1;
    #( Wperiod/2.0 );
  end
  always //Read clock
  begin
    Rclk_tb=0;
    #( Rperiod/2.0 );
    Rclk_tb=1;
    #( Rperiod/2.0 );
  end


//Tasks
task initialize();
  begin
    Winc_tb = 0;
    Wrst_tb = 1;
    Rinc_tb = 0;
    Rrst_tb = 1;
    Wrdata_tb = 0;
  end
endtask

task reset();
  begin
    Wrst_tb = 0;
    Rrst_tb = 0;
    @( posedge Rclk_tb );
    Wrst_tb = 1;
    Rrst_tb = 1;
    @( posedge Rclk_tb );
    Windex = 0;
    Rindex = 0;   
  end
endtask

task write ( input [ Data_width - 1 : 0 ] data );
  begin
    @( posedge Wclk_tb )
    if( !Wfull_tb )
      begin
        Wrdata_tb = data;
        expected_output[ Windex ] = data;
        Windex = Windex + 1;
        Winc_tb = 1;
        @( posedge Wclk_tb )
        Winc_tb =0;

      end 
  end
endtask

task read();
  begin
    @( posedge Rclk_tb )
    if( !Rempty_tb )
      begin
        Rinc_tb = 1;
        @(posedge Rclk_tb)
        Rinc_tb = 0;     
      if( Rdata_tb != expected_output[ Rindex ] )
      begin
        $display("There is an error with reading the data");
      end   
      Rindex = Rindex + 1;     
      end

  end
endtask

//Write initial block
initial 
  begin
    initialize();
    reset();

      $display("Test case 1: trying to fill FIFO to its maximum value");
        for(  i = 1  ;  i <= Depth  ; i = i + 1  )
          begin
            write( 'd10 + i );
          end
          #( Wclk_tb );
          $display("Number of writes=%0d ,Wfull=%0b , Wempty=%0b", Windex , Wfull_tb , Rempty_tb );

    $display("Test case 2 : trying to store a data when the FIFO is full");
        write( 'd10 + 10 );
        #( Wclk_tb );
        $display("Wfull=%0b , Wempty=%0b", Wfull_tb , Rempty_tb );


  end

//Read initial block
initial
  begin
    #1000;
    $display("Test case 3: trying to read all the contents in the FIFO ");
          while( !Rempty_tb  && (Rindex < Windex) ) 
            read();
            #( Rclk_tb );
            $display("Number of Reads=%0d ,Wfull=%0b , Wempty=%0b", Rindex , Wfull_tb , Rempty_tb );



    $display("Test case 4: trying to read when the FIFO is empty");
          read();
          #( Rclk_tb );
          $display("Wfull=%0b , Wempty=%0b", Wfull_tb , Rempty_tb );



    $display("Test case 5: trying to read and write simultaneously");
        reset();
          done=0;
        fork
          begin
            for(  i = 1  ;  i <= Depth  ; i = i + 1 )
              write( 'd50 + i );
          end
          begin
            while( !done )
              begin
                read();
                if( Rindex == 8 )
                done = 1 ;
                else
                read();
              end
          end
        join
    $display("Number of Reads=%0d , Number of writes=%0d , Wfull=%0b , Wempty=%0b", Rindex , Windex , Wfull_tb , Rempty_tb );   



    #100 ;
    $finish;
  end


//Module instantiation
ASYNC_FIFO
#(
.Data_width( Data_width ),
.Depth( Depth ),
 .Address( Address ), 
.NUM_STAGES( NUM_STAGES )
)
FIFOASYNC
(
.Winc( Winc_tb ),
.Wrst( Wrst_tb ),
.Wclk( Wclk_tb ),
.Rinc( Rinc_tb ),
.Rrst( Rrst_tb ),
.Rclk( Rclk_tb ),
.Wrdata( Wrdata_tb ),
.Wfull( Wfull_tb ),
.Rempty( Rempty_tb ),
.Rdata( Rdata_tb )
);

endmodule