module ARITHMATIC_UNIT 
#( parameter Input_data_width ='d8 , parameter Output_data_width ='d8  )
(

//Declaring inputs 
    input wire [ Input_data_width - 1 : 0 ] A,
    input wire [ Input_data_width - 1 : 0 ] B,
    input wire [ 1 : 0 ] ALU_FUN,
    input wire CLK,
    input wire RST, //Active low asynchronus reset 
    input wire Arith_Enable,

//Declaring outputs
    output reg [  Output_data_width - 1 : 0 ] Arith_OUT,
    output reg Arith_Flag

);
//Declaring the op code 
    localparam ADD=2'b00;
    localparam SUB=2'b01;
    localparam MUL=2'b10;
    localparam DIV=2'b11;


always@( posedge CLK or negedge RST )
    begin
            if( !RST )
                begin

                    Arith_OUT<= 0;
                    Arith_Flag <= 1'b0;
                    
                end
            else if( Arith_Enable )
                begin

                     case( ALU_FUN ) 
                       
                            ADD:Arith_OUT <= A + B ;
                            SUB:Arith_OUT <= A - B ;
                            MUL:Arith_OUT <= A * B ; 
                            DIV:Arith_OUT <= A / B ;
                         
                     endcase

                                Arith_Flag <= 1; 
                end
            else
                begin
                    Arith_OUT <= 0;
                    Arith_Flag <= 1'b0;
                end

                
            

    end 

endmodule
