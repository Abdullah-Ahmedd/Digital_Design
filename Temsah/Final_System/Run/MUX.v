module MUX
(
//Declaring inputs
    input wire [ 5 : 0 ] prescale,
//Declaring outputs
    output reg [ 2 : 0 ] OUT
);

always@( * )
    begin
        case( prescale )
            6'b001000: OUT = 3'b100;
            6'b010000: OUT = 3'b010;
            6'b100000: OUT = 3'b001;
            default:   OUT = 3'b001;
        endcase
    end

endmodule