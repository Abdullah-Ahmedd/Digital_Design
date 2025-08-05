module FSM
(
//Declaring inputs 
input wire Data_valid,
input wire PAR_EN,
input wire ser_done,
input wire CLK,
input wire RST, //Asynchronus active-low reset

//Declaring output
output reg [ 1 : 0 ] mux_sel,
output reg ser_en,
output reg busy
);

//Declaring registers to store the current and next state 
reg [ 4 : 0 ] Current_state;
reg [ 4 : 0 ] Next_state;

//State encoding (using one shot encoding)
localparam IDLE=5'b00001;
localparam Start_bit=5'b00010;
localparam Send_data=5'b00100;
localparam parity=5'b01000;
localparam Stop_bit=5'b10000;

//state transition
always@ ( posedge CLK or negedge RST )
    begin
        if( !RST )
            begin
                Current_state <= IDLE;
                busy <= 0;
                ser_en <= 0;
            end
        else Current_state <= Next_state;
    end

//Next state logic
always@( * )
    begin 
        case( Current_state )
            IDLE:
                begin
                    if( Data_valid )
                    Next_state = Start_bit;
                    else 
                    Next_state = IDLE;
                end
            Start_bit:
                begin
                    Next_state = Send_data;
                end
            Send_data:
                begin
                    if( ser_done )
                        begin
                        if( PAR_EN )
                        Next_state = parity;
                        else
                        Next_state = Stop_bit; 
                        end
                    else 
                        Next_state = Send_data;  
                end
            parity:
                begin
                    Next_state = Stop_bit;
                end
            Stop_bit:
                begin
                    /*
                    if( Data_valid )
                    Next_state = Start_bit;
                    else 
                    */
                    Next_state =IDLE;
                end
            default:
                begin
                    Next_state = IDLE;
                end
        endcase
    end    

//Output logic
always@( * )
    begin
        //Default values
            ser_en=0;
            busy=0;
            mux_sel=2'b01;
            case( Current_state )
                IDLE:
                    begin
                        busy=0;
                        mux_sel=2'b01;                                      
                    end
                Start_bit:
                    begin
                        busy=1;
                        mux_sel=2'b00; 
                    end
                Send_data:
                    begin
                        busy=1;
                        mux_sel=2'b10;
                        ser_en=1; 
                    end
                parity:
                    begin
                        busy=1;
                        mux_sel=2'b11; 
                    end
                Stop_bit:
                    begin
                        busy=1;
                        mux_sel=2'b01; 
                    end
                default:
                    begin
                        busy=0;
                        mux_sel=2'b01; 
                    end
            endcase        
        end

endmodule 