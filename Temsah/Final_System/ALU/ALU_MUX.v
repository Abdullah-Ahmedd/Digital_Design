module ALU_MUX
#( parameter Output_data_width ='d8 )
(
//Declaring inputs
    input wire   [ Output_data_width - 1 : 0 ] In0,
    input wire   [ Output_data_width - 1 : 0 ] In1,
    input wire   [ Output_data_width - 1 : 0 ] In2,
    input wire   [ Output_data_width - 1 : 0 ] In3,
    input wire  [ 1 : 0 ] Sel,
//Declaring outputs
    output reg  [ Output_data_width - 1 : 0 ] Out
);

always@( * )
    begin
        case( Sel )
            2'b00: Out = In0;
            2'b01: Out = In1;
            2'b10: Out = In2;
            2'b11: Out = In3;
        endcase
    end

endmodule 