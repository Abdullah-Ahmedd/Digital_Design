module adder
(
//Declaring inputs
    input logic [ 7 : 0 ]   a,
    input logic [ 7 : 0 ]   b,
//Declaring outputs
    output logic [ 15 : 0 ] c  
);
 assign c = a + b ;
endmodule