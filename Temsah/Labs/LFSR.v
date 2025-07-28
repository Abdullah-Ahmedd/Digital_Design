/*

enable is like the "power-on" for LFSR operation
It activates the internal logic: the LFSR shifts and updates its bits.
Think of it as "run the LFSR".
Without enable = 1, the LFSR is just sitting still—not generating anything new.

out_enable is like "open the gate to show the result"
It allows the current LFSR value (frozen after shifting) to be read out, bit by bit, usually via LFSR[0].
It doesn’t cause the LFSR to shift or change — just exposes the existing contents.

IF out_enable signal is activated, LFSR result could be serially out through LFSR[ 0 ] with Valid signal
meanns that when out_enable is on you will shift serially through	
			OUT <= LFSR[0]
			LFSR[0] <= LFSR[1]
			LFSR[1] <= LFSR[2]
			LFSR[2] <= LFSR[3]
			LFSR[3] <= LFSR[4]
			LFSR[4] <= LFSR[5]
			LFSR[5] <= LFSR[6]
			LFSR[6] <= LFSR[7]			
which is done using  { LFSR[ 6 : 0 ], OUT } <= LFSR[ 7 : 0 ];

*/
module LFSR
(
//Declaring inputs    
    input wire clock,
    input wire reset,
    input wire [ 7 : 0 ]Seed,
    input wire enable,
    input wire enable_out,
//Declaring outputs
    output reg OUT,
    output reg Valid

);
//Declaring the registers 
    reg [ 7 : 0 ] LFSR; //BTW this is an internal signal as the output of every register is (input to the nor gate and input to the rigter right to it)
//Declaring the loop variable
    integer i;
//Declaring the Feedback and Bits0to6 variables
    wire Feedback;
    wire [ 6 : 0 ] Bits0to6;
//Declarint taps
parameter [ 7: 0 ] taps= 8'b10101010;

assign Bits0to6 = ~| LFSR[ 6 : 0 ];
assign Feedback = LFSR[ 7 ] ^ Bits0to6;

always@( posedge clock or negedge reset )   
    begin
        if(! reset )
            begin
                OUT<=0;
                LFSR[ 7 : 0 ] <= Seed; //First requirment in the pdf (to input seed in the LFSR at reset acitvation )
                Valid<=1'b0;
            end
        else if ( enable )
            begin
                LFSR[ 0 ] <=Feedback;
                for( i=7 ; i>0 ; i=i-1 )
                    begin
                        if(taps[ i ] == 1'b1)
                            LFSR[ i ] <= Feedback ^ LFSR[ i - 1 ];
                        else LFSR[ i ] <= LFSR[ i - 1 ];
                    end
            end
        else if( enable_out )
            begin
                { LFSR[ 6 : 0 ], OUT } <= LFSR[ 7 : 0 ];
                Valid=1'b1;
            end

    end

endmodule 