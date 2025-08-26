/*
Important notes:
1) this code we will use just to model the CLK_gating in simulation only but when making the synthesis as we have said before
we will use some sort of a command to tell the tool to use an already made clock gating cell defined in its libarary 
2)you can use the * as you want but the clock gating code is some how of a thing you memorize so professional engineers will feel something
off when they say your code is different from the one you want 
(also not so sure but some say that when you use * for some reason the tool make the latch using gates and not get an already made latch from the library)
3) you can make the <= as a = and both will do the same thing in the synthesis (and functionality of the code) but in some tools as the cdc tool the linting tool
will suggest to use it as <=
*/
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