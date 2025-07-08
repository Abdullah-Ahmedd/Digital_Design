module DigCt
(

input wire IN1,
input wire IN2,
input wire IN3,
input wire IN4,
input wire IN5,
input wire CLK,

output reg OUT1,
output reg OUT2,
output reg OUT3

);
reg D1,D2,D3;
reg nor1,or1;


  
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


  
always@(IN1 , IN2 , IN3)
begin
nor1= ~(IN1 | IN2);
D1= ~(nor1 & IN3 );
end
  
always@(IN2 , IN3)
begin
D2=~(IN2 & IN3);
end
  
always@(IN2 , IN3)
begin
or1=(IN3 | ~IN4);
D3=(or1 | IN5);
end


  
endmodule
