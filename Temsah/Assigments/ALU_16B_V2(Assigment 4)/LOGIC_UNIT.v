module LOGIC_UNIT#(parameter Width='d16)
(

//Declaring inputs 
    input wire  [ Width-1 : 0 ] A,
    input wire  [ Width-1 : 0 ] B,
    input wire [ 1 : 0 ] ALU_FUN,
    input wire CLK,
    input wire RST, //Active low asynchronus reset 
    input wire Logic_Enable,

//Declaring outputs
    output reg [ Width-1 : 0 ] Logic_OUT,
    output reg Logic_Flag

);
//Declaring the op code 
    localparam AND =2'b00;
    localparam OR =2'b01;
    localparam NAND =2'b10;
    localparam NOR =2'b11;

always@( posedge CLK or negedge RST ) 
    begin
        if( !RST )
            begin
                Logic_OUT<=0;
                Logic_Flag<=0;
            end
        else if ( Logic_Enable )
            begin
                case( ALU_FUN )

                AND: Logic_OUT<= A & B ;
                OR: Logic_OUT<= A | B ;
                NAND: Logic_OUT<= ~( A & B ) ;
                NOR: Logic_OUT<= ~( A | B ) ;

                endcase

                     Logic_Flag<=1'b1;
            end
        else
            begin
                Logic_OUT<=0;
                Logic_Flag<=0;
            end 
    
    end
endmodule 
