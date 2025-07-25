//4-bit counter 
/*
=============================================================================================================================================
this design prioritize the latch so if the latch and dec signals are both high the system prioritize 
the lacth signal and enter the new number then after that on the next positive clock cycle the system 
checks if latch and dec is high which logically latch was just hugh so it will not be hygh again 
(even if it is high we prioritize it over dec) and then check dec and if it is high 
we decrement the new number
which is logical as we cant latch (store a new number) and decrement it at the same clock cycle 
as this is not possible (and even if it is this is really dangerous as it could take time more than the 
posedge and then it would still be operating while the new egde come which could hold a new number or ask to 
decrement the old number again which is still hasent been decremented)


also one important thing to notice is that using the blocking assigment in an always block makes it concurrent
and you cant use blocking assigment in this as this is a sequential always block so it is not recommended to use 
the non-blocking assigments
 so if you do it as 
always@(posedge clk)
begin
    if(latch)
    begin
counter <=IN;
    end
     if( dec && !zero)
    begin
    counter=counter-4'b001;
    end
end

now you are trying to check the two if statements at the same time meaning if dec and latch are 
both high your chip will be trying to store a number and decrement it at the same time (mid-latching it)
which is ofcourse invalid 

=============================================================================================================================================
*/
module counter_4bit
(

input wire [3:0] IN,
input wire latch,
input wire dec,
input wire clk,

output reg [3:0] counter,
output reg zero

);


always@(posedge clk)
begin
    if(latch)
    begin
counter <=IN;
    end
    else if( dec && !zero)
    begin
    counter=counter-4'b001;
    end
end

always @(*)
begin
    if(counter==4'b000)
    begin
        zero=1'b1;
    end
    else 
    begin
     zero=1'b1;
    end
end


endmodule 