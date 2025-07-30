module Door
( 
//Declaring inputs
    input wire UP_Max,
    input wire Activate,  
    input wire DN_Max,
    input wire CLK,
    input wire RST, //Active low Asynchronus delay
//Declaring outputs
    output reg UP_M,
    output reg DN_M
);
//Finite state machine encoding (Using gray code to minimize the power)
    localparam IDLE= 2'b00;
    localparam MV_Up=2'b01;
    localparam MV_Dn=2'b11;

//Declaring current and next state 
reg [ 1 : 0 ] Current_state;
reg [ 1 : 0 ] Next_state;

//State transsition 
always@(posedge CLK or negedge RST)
    begin
        if(!RST) 
            begin
                Current_state<=IDLE;
            end
        else Current_state<=Next_state; 
    end

//Next state logic
always@( * )
    begin
        case( Current_state )        
            IDLE:
                begin
                    if( !Activate )
                        Next_state = IDLE;
                    else if ( !UP_Max )
                        Next_state = MV_Up;                      
                    else if ( !DN_Max )
                        Next_state = MV_Dn;
                    else Next_state = IDLE;  
                end
            MV_Up:
                begin
                    if( UP_Max )
                    Next_state = IDLE;
                    else Next_state = MV_Up;
                end
            MV_Dn:
                begin
                    if( DN_Max )
                    Next_state = IDLE;
                    else Next_state = MV_Dn;
                end
            default:
                begin
                    Next_state=IDLE;
                end                             
            endcase
    end    

//Output logic
always@( * )
    begin
        case( Current_state )
            IDLE:
                begin
                    UP_M = 0;
                    DN_M = 0;
                end
            MV_Up:
                begin
                    UP_M = 1;
                    DN_M = 0;
                end
            MV_Dn:
                begin
                    UP_M = 0;
                    DN_M = 1;
                end 
            default:
                begin
                    UP_M = 0;
                    DN_M = 0;
                end                                                     
        endcase
    end 

endmodule

