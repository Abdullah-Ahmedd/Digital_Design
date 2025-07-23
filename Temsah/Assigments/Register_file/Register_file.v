//16x8 register file
module Register_file
(

//Declaring inputs
    input wire [ 15 : 0 ] WrData,
    input wire [ 2 : 0 ] Address,
    input wire WrEn,
    input wire RdEn,
    input wire CLK,
    input wire RST, //Active low asynchronus reset

//Declaring outputs
    output reg [ 15 : 0 ] RdData

);
//Declarint the Register files 
    reg [ 15 : 0 ] Regfile [ 7 : 0 ]; //8 register files everyone of them is 16-bits

always@(posedge CLK or negedge RST )
    begin       
        if(!RST)
            begin
                Regfile[ 7 ] <= 16'b0;
                Regfile[ 6 ] <= 16'b0;
                Regfile[ 5 ] <= 16'b0;
                Regfile[ 4 ] <= 16'b0;
                Regfile[ 3 ] <= 16'b0;
                Regfile[ 2 ] <= 16'b0;
                Regfile[ 1 ] <= 16'b0;
                Regfile[ 0 ] <= 16'b0;
                RdData<=16'b0;
            
            end
        else if ( WrEn && !RdEn )
            begin                    
                    Regfile[ Address ] <= WrData;
            end    
        else if ( RdEn && !WrEn ) 
            begin
                    RdData <= Regfile[ Address ];  
            end  
    end

endmodule 