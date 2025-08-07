module parity_calc
(
//Declaring inputs 
    input wire [7:0] P_DATA,
    input wire Data_valid,
    input wire PAR_TYP,

//Declaring outputs
    output reg par_bit
);
//Declaring a wire parity flag that is equal one when the number of of ones in P_DATA is odd
wire P_flag= ^P_DATA;

always@( * )
    begin
        if(PAR_TYP )
        par_bit=!P_flag;
        else
        par_bit=P_flag;

    end
endmodule