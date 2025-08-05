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
    if ( !Data_valid )
        begin
            par_bit=par_bit;
        end
    else  
        begin  
        if( !PAR_TYP )
            begin
                if( P_flag )
                par_bit = 1;
                else
                par_bit = 0;
            end
        else    
            begin
                if( P_flag )
                par_bit = 0;
                else
                par_bit = 1;
            end
        end
end

endmodule