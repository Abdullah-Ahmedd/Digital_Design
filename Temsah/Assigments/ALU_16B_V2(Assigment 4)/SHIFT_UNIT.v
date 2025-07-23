module SHIFT_UNIT#( parameter Width='d16 )
(

//Declaring inputs 
    input wire  [ Width-1 : 0 ] A,
    input wire  [ Width-1 : 0 ] B,
    input wire [ 1 : 0 ] ALU_FUN,
    input wire CLK,
    input wire RST, //Active low asynchronus reset 
    input wire Shift_Enable,

//Declaring outputs
    output reg  [ Width-1 : 0 ] Shift_OUT,
    output reg Shift_Flag

);
//Declaring the op code 
    localparam SHRA=2'b00;   //A>>1
    localparam SHLA=2'b01;  //A<<1
    localparam SHRB=2'b10; //B>>1
    localparam SHLB=2'b11;//B<<1

always@ ( posedge CLK or negedge RST )
    begin
        if( !RST )
            begin

                Shift_OUT<=0;
                Shift_Flag<=0;

            end
        else if( Shift_Enable )
                begin
                    case( ALU_FUN )

                        SHRA: Shift_OUT<= A >> 1;
                        SHLA: Shift_OUT<= A << 1;
                        SHRB: Shift_OUT<= B >> 1;
                        SHLB: Shift_OUT<= B << 1;

                    endcase
                        Shift_Flag<=1'b1;
                end
                else 
                begin

                Shift_OUT<=0;
                Shift_Flag<=0;

                end
                    
    end
endmodule 
