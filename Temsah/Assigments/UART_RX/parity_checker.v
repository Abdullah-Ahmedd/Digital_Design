module parity_checker
(
//Declaring inputs
    input wire CLK,
    input wire RST,
    input wire PAR_TYP,
    input wire parity_checker_enable,
    input wire [ 3 : 0 ] bit_cnt,
    input wire sampled_bit,
//Declaring outputs
    output reg parity_error
);

//Declaring an internal register to store the value of the data to calculate its parity bit
reg [ 7 : 0 ] data;

//Declaring a parity flag that is equal one when the number of of ones in P_DATA is odd
reg P_flag;

always@( posedge CLK  or  negedge RST ) 
    begin
        if(!RST)
            begin
                data <= 0;
                parity_error <= 0;
                P_flag <= 0;
            end
        else if( parity_checker_enable )
            begin
                if( bit_cnt >= 4'd1  &&  bit_cnt <= 4'd8 )
                begin
                    data[ bit_cnt - 1 ] <= sampled_bit;
                end
                if( bit_cnt == 4'd8 )
                    begin
                         P_flag <= ^{ data[ 6 : 0 ] , sampled_bit }; //had to be this way becuase data[ bit_cnt - 1 ] <= sampled_bit; is non blocking to its value wont be updated by the time we come at this line as at bit count=8 both this and the above if will be exucted
                    end                
                if( bit_cnt == 4'd9 )
                    begin
                        if( PAR_TYP )
                            if( !P_flag == sampled_bit )
                            parity_error<=0;
                            else parity_error<=1;
                        if( !PAR_TYP )
                            if( P_flag == sampled_bit )
                            parity_error<=0;
                            else parity_error<=1;  

                    end    
            end

    end

endmodule