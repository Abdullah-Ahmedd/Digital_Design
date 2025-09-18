module CLK_gate
(
//Declaring inputs
    input wire CLK_EN,
    input wire CLK,
//Declaring outputs
    output wire GATED_CLK
);

//Declaring the latch in the clock gating 
    reg latch;
    
always@( CLK or CLK_EN )
    begin
        if( !CLK ) //Active-low latch
            begin
                latch <= CLK_EN ;
            end
    end

assign GATED_CLK = latch & CLK;    

endmodule 