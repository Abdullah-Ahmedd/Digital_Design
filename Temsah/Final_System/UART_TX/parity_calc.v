module parity_calc
#( parameter Data_width = 8 )
(
//Declaring inputs 
    input wire [ Data_width - 1 : 0 ] P_DATA,
    input wire PAR_TYP,

//Declaring outputs
    output reg par_bit
);
//isolating P_DATA 
    wire [ Data_width - 1 : 0 ] P_DATA_ioslated; 


assign P_DATA_ioslated = P_DATA;
//Declaring a wire parity flag that is equal one when the number of of ones in P_DATA is odd
    wire P_flag = ^P_DATA_ioslated;

always@( * )
    begin
        if( PAR_TYP )
        par_bit =! P_flag;
        else
        par_bit = P_flag;

    end
endmodule