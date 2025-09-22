module Decoder
(

//Declaring inputs
    input wire [1:0] ALU_FUN,
    input wire ALU_EN,

//Declaring outputs 
    output reg Arith_Enable,
    output reg Logic_Enable,
    output reg CMP_Enable,
    output reg Shift_Enable

);
//Declaring the op code 
    localparam Arith=2'b00; 
    localparam Logic=2'b01;
    localparam CMP=2'b10;
    localparam Shift=2'b11;

always@( * )
    begin
        //Default values
                Arith_Enable=1'b0;
                Logic_Enable=1'b0;
                CMP_Enable=1'b0;
                Shift_Enable=1'b0;
        if( ALU_EN )
        case( ALU_FUN )

            Arith: Arith_Enable=1'b1;
            Logic: Logic_Enable=1'b1;
            CMP: CMP_Enable=1'b1;
            Shift: Shift_Enable=1'b1;
            default:
                begin
                end

        endcase
        else
            begin
                Arith_Enable=1'b0;
                Logic_Enable=1'b0;
                CMP_Enable=1'b0;
                Shift_Enable=1'b0;
            end

    end

endmodule
