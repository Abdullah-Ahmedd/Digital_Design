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
        else if( Up==1'b1 && !High )
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

