module CMP_UNIT#( parameter Input_data_width ='d8 , parameter Output_data_width ='d8  )
(

//Declaring inputs 
    input wire  [ Input_data_width - 1 : 0 ] A,
    input wire  [ Input_data_width - 1 : 0 ] B,
    input wire  [ 1 : 0 ] ALU_FUN,
    input wire CLK,
    input wire RST, //Active low asynchronus reset 
    input wire CMP_Enable,

//Declaring outputs
    output reg signed [ Output_data_width - 1 : 0 ] CMP_OUT,
    output reg CMP_Flag

);
//Declaring the op code 
    localparam NOP =2'b00;    //no operation
    localparam CMPEQ =2'b01; //checks if A = B
    localparam CMPG =2'b10; //checks if  A > B
    localparam CMPL =2'b11;//Checks if A < B

always@( posedge CLK or negedge RST )
    begin
        if( !RST )
            begin
                CMP_OUT <= 0;
                CMP_Flag <= 0;
            end
        else if( CMP_Enable )
            begin
                case( ALU_FUN )
                    NOP:CMP_OUT <= 0;
                    CMPEQ: if( A == B ) 
                        CMP_OUT <='d1;
                        else
                        CMP_OUT <='d0;
                    CMPG: if( A > B ) 
                        CMP_OUT <='d2;
                        else
                        CMP_OUT <='d0;
                    CMPL: if( A < B ) 
                        CMP_OUT <='d3;
                        else 
                        CMP_OUT <='d0;
                        
                endcase
                        CMP_Flag <=1'b1;
            end
        else
            begin
                CMP_OUT <=0;
                CMP_Flag <=0;                
            end
    end

endmodule 
