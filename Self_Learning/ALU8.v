 /*
 Notes i have noticed when solving:
 1)the overflow flag condition will not be checked using the xor method you knew before 
 as it involve dealing with the carry of the last 2 bits which is something we cant do 
 so the best way it so check it using the caryy flag definition
 "if the two added numbers have the same MSB and the result have a different MSB then overlfow must have occured while in 
 subtraction if the two bits are opposite signes and the MSB of thr result is different from the number we subtracted from (A in A-B)
 then overflow must have occured"
 2)if a branch in the case block involve one statment then the begin/end for this block is optional 
  */
module ALU8
(
input wire [7:0] A,
input wire [7:0] B,
input wire [3:0] OpCode,

output reg [7:0] Result, 
output reg C,    //additional bit for the arithmatic operation
output reg OV,  //overflow flag
output reg ZF //zero flag

);
//opcode values
localparam ADD_op=4'b0000;
localparam SUB_op=4'b0001;
localparam AND_OP=4'b0010;
localparam OR_op=4'b0011;
localparam XOR_op=4'b0100;
localparam NOT_op=4'b0101;
localparam INC_op=4'b0110;
localparam DEC_op=4'b0111;
localparam PASSA_op=4'b1000;
localparam PASSB_op=4'b1001;


always@(*)
begin
//initializing the value of result and flags to zero before we start using the ALU
Result=8'b00000000;
C=0;
OV=0;
ZF=0;


case(OpCode)
ADD_op:
begin
  {C,Result}=A+B;
  OV=(A[7] == B[7]) && (Result[7]!=A[7]); 
 
end
SUB_op:
begin
  {C,Result}=A-B;
  OV=(A[7] != B[7]) && (Result[7]!=A[7]);
end


OR_op: Result=A | B;
XOR_op:Result= ( A ^ B );
NOT_op: Result=~A;
INC_op:{C,Result}=A+8'b00000001;
DEC_op:Result=A-8'b00000001;
PASSA_op:Result=A;
PASSB_op:Result=B;


default:
begin
Result=8'b00000000;
C=0;
end



endcase

ZF=(Result==8'b0);
/*
could be replaced by
but the above method is used more professionally

if(Result==8'b0)
begin
    ZF=1'b1;
end

*/
end




endmodule 
 