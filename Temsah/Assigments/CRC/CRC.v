module CRC
(
//Declaring inputs
    input wire DATA,
    input wire ACTIVE,
    input wire CLK,
    input wire RST,

//Declaring outputs
    output reg CRC,
    output reg Valid    

);
//Declaring the SEED
    parameter SEED=8'hD8;
//Declaring the registers 
    reg [ 7 : 0 ] LFSR; 
//Declaring the loop variable
    integer i;
//Declaring the Feedback
    wire Feedback;
//Declarint taps
    parameter [ 7: 0 ] taps= 8'b01000100;
//Declaring a counter for the input and output data
    reg [ 4 : 0 ] DATA_counter; //4-bits as the maximum input bits is 4 bytes
    reg [ 2 : 0 ] CRC_counter;  //2-bits this shift register is only 8 bits

assign Feedback= DATA ^ LFSR[ 0 ] ;    


always@(posedge CLK or negedge RST )
    begin
        if( !RST ) 
         begin
            LFSR[ 7 : 0 ] <= SEED ;
            CRC <= 0;
            Valid <= 0;
            DATA_counter<=0;
            CRC_counter<=0;
        end
        else if( ACTIVE )
            begin
                LFSR[ 7 ] <= Feedback;
                //DATA_counter <= DATA_counter + 1;
                for(i=6;i>=0;i=i-1)
                    begin
                        if(taps[ i ]==1)
                        LFSR[ i ] <= Feedback ^ LFSR[ i + 1 ];
                else
                        LFSR[ i ] <= LFSR[ i + 1 ];
                    end
            Valid <= 0;
            CRC_counter<=0; //reset the CRC_counter everytime we input data 
            end  
        else if( !ACTIVE && CRC_counter < 8 )
            begin
                { LFSR[ 6 : 0 ] , CRC } <= LFSR [ 7 : 0 ];
                Valid<=1;
                CRC_counter<=CRC_counter+1;
            end
        else Valid <= 0;

    end

endmodule 