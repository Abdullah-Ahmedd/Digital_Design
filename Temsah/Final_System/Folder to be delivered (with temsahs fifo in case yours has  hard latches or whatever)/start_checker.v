module start_checker
(
//Declaring inputs
    input wire CLK,
    input wire RST,
    input wire start_checker_enable,
    input wire sampled_bit,
//Declaring outputs 
    output reg start_glitch
);

always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                start_glitch <= 0;
            end
        else if( start_checker_enable )
            begin
                 if( sampled_bit == 0 )
                    start_glitch <= 0;
                 else 
                    start_glitch <= 1;
            end
    end

endmodule 