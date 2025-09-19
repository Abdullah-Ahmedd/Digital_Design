module Comb_logic
(
//Declaring inputs
    input wire Winc,
    input wire Wfull,
//Declaring output 
output reg Wclken   
);

always@( * )
    begin
        Wclken = Winc & ~Wfull;
    end

endmodule