module deserializer
#( parameter Data_width = 8 )
(
//Declaring inputs
    input wire CLK,
    input wire RST,
    input wire sampled_bit,
    input wire deserializer_enable,
    input wire [ 3 : 0 ] bit_cnt,
//Declaring output
    output reg [ Data_width - 1 : 0 ] P_DATA
);

always@(posedge CLK or negedge RST)
    begin
        if( !RST )
            begin
                P_DATA <= 0;
            end
        else if( deserializer_enable && bit_cnt <= Data_width )
            begin
                P_DATA[ bit_cnt - 1 ] <= sampled_bit;
            end
    end

endmodule 
