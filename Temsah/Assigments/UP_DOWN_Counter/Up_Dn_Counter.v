/*
What you did wrong in this RTL design

here if down=1 and low=1 and up=1 and high =0 (which is logical as low=1)
so the first else if will not be excuted howerver the second else if will be 
excuted making the counter increment while down=1 which violates the degisn 
so the second else if should be else if (up && !high && !down) 

*/
module Up_Dn_Counter
(

//Declaring inputs
    input wire [4:0] IN,
    input wire Load,
    input wire Up,
    input wire Down,
    input wire CLK,

//Declaring outputs    
    output reg High,
    output reg [4:0] Counter,
    output reg Low

);

always@(posedge CLK)
    begin

        // Priority: Load > Down > Up
        if(Load==1'b1) 
        Counter<=IN;
        else if( Down==1'b1 && !Low) 
        Counter<=Counter-1;
        else if( Up==1'b1 && !High ) //it should be else if (up && !high && !down) 
        Counter<=Counter+1;                             

    end

always@(*)
    begin
        
        if(Counter==5'd31) // Set High flag when Counter reaches 31 
        High=1'b1;
        else High=1'b0;

        if(Counter==5'd0) // Set Low flag when Counter reaches 0
        Low=1'b1;
        else Low=1'b0; 

    end

endmodule

