module DigCt
(
//declaring inputs
input wire IN1,
input wire IN2,
input wire IN3,
input wire IN4,
input wire CLK,

//declaring outputs
output reg OUT1,
output reg OUT2,
output reg OUT3

);
//now we need to declare 
//the intermidate signals
reg D1,D2,D3;


//making whenever there is a psitive edge 
//clock the D fliplops output there values
always@(posedge CLK)
begin 
OUT1<=D1;
end
always@(posedge CLK)
begin 
OUT2<=D2;
end
always@(posedge CLK)
begin 
OUT3<=D3;
end
//In a D flip-flop,anything meaningful 
//(like data being stored or output changing) 
//happens only at the clock edge.

//meaning you store the value of inputs 
//at the D and when the clock edge occurs 
//you output it
always@(IN1 | IN2)
begin 
D1=~(IN1 | IN2);
end
always@(IN2 | IN3)
begin 
D2= ~(IN2 & IN3);
end
always@(IN3 | IN4)
begin 
D3=IN2 | IN3;
end


