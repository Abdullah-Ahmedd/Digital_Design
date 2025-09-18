module PULSE_GEN
(
//Declaring inputs
    input wire LVL_SIG,
    input wire CLK,
    input wire RST,

//Declaring output
    output reg PULSE_SIG
);
//Declaring a register to store the previous value of the input signal 
reg PREV;

always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                PREV <= 0;
                PULSE_SIG <= 0;
            end
        else
            begin
                PREV <= LVL_SIG;
                PULSE_SIG <= LVL_SIG && !PREV;
            end
    end

endmodule 