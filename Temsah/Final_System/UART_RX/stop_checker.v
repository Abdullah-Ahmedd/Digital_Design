module stop_checker
(
//Declaring inputs
    input wire CLK,
    input wire RST,
    input wire stop_checker_enable,
    input wire sampled_bit,
//Declaring outputs 
    output reg stop_error
);

always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                stop_error <= 0;
            end
        else if( stop_checker_enable )
            begin
                 if( sampled_bit == 1 )
                    stop_error <= 0;
                 else 
                    stop_error <= 1;
            end
    end

endmodule 