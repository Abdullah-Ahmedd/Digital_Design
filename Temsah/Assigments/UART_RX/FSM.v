module FSM
(
//Declaring inputs
    input wire CLK,
    input wire RST,
    input wire RX_IN,
    input wire [ 5 : 0 ] edge_cnt,
    input wire [ 3 : 0 ] bit_cnt,
    input wire [ 5 : 0 ] prescale,
    input wire stop_error,
    input wire start_glitch,
    input wire parity_error,
    input wire PAR_EN,
//Declaring outputs 
    output reg data_sample_enable,
    output reg enable,
    output reg deserializer_enable,
    output reg data_valid,
    output reg stop_checker_enable,
    output reg start_checker_enable,
    output reg parity_checker_enable,
    output reg reset_counters
);

//Declaring internal registers for the current and next state
    reg [ 5 : 0 ] Current_state;
    reg [ 5 : 0 ] Next_state;

//States encoding (using one-shot)
localparam Idle = 6'b000001;
localparam Start_bit_check = 6'b000010;
localparam Data_bits = 6'b000100;
localparam Parity_bit_check =6'b001000;
localparam Stop_bit_check =6'b010000;
localparam Data_valid =6'b100000;

//States transition
always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                Current_state <= Idle;
            end
        else
        Current_state <= Next_state;
    end

//Next state logic 
always@( * )
    begin
        case( Current_state )

            Idle:
                begin
                    if( RX_IN == 0 )
                        Next_state = Start_bit_check;
                    else 
                        Next_state=Idle;
                end

                /*

            Start_bit_detected:
                begin
                    if( !start_glitch )
                        Next_state = Start_bit_check;
                    else
                        Next_state=Idle;
                end
                */

            Start_bit_check:
                begin
                    if(edge_cnt == prescale - 1 )
                        begin
                            if( !start_glitch )
                                Next_state = Data_bits;
                            else
                                Next_state = Idle;
                        end
                    else Next_state = Start_bit_check;
                end

            Data_bits:
                begin
                    if( bit_cnt >= 1  &&  bit_cnt <= 8 )
                        Next_state = Data_bits;
                    else 
                        begin
                        if( PAR_EN )
                            Next_state = Parity_bit_check;
                        else
                            Next_state = Stop_bit_check;
                        end                    
                end

            Parity_bit_check:
                begin
                    if( edge_cnt == prescale - 1 )
                        begin
                            if( !parity_error )
                                Next_state = Stop_bit_check;                    
                            else
                                Next_state = Idle;
                        end
                    else Next_state=Parity_bit_check;
                end            

            Stop_bit_check:
                begin
                    if( edge_cnt == prescale - 1 )
                        begin
                            if( !stop_error )
                                Next_state = Data_valid;                    
                            else
                                Next_state = Idle;
                        end
                    else Next_state = Stop_bit_check;
                end

            Data_valid:
                begin
                    if( RX_IN == 0 )
                        Next_state = Start_bit_check;
                    else 
                        Next_state=Idle;                
                end   

            default:    
                begin
                        Next_state = Idle;                    
                end               

        endcase
    end

//Output logic
always@( * )
    begin
        //Default values
        data_sample_enable = 0;
        enable = 0;
        deserializer_enable = 0;
        data_valid =0;
        stop_checker_enable = 0 ;
        start_checker_enable = 0;
        parity_checker_enable = 0;
        reset_counters = 0;        
            case( Current_state )

                Idle:
                    begin
                        reset_counters = 1;                            
                    end

                    /*

                Start_bit_detected:
                    begin
                        if( !start_glitch )
                            Next_state = Start_bit_check;
                        else
                            Next_state=Idle;
                    end
                    */

                Start_bit_check:
                    begin
                        start_checker_enable = 1;
                        data_sample_enable = 1;
                        enable = 1;
                    end

                Data_bits:
                    begin
                        enable = 1;
                        data_sample_enable = 1;
                        //if( bit_cnt >= 1 && bit_cnt <= 8)
                            deserializer_enable = 1;
                    end

                Parity_bit_check:
                    begin
                        enable = 1;
                        data_sample_enable = 1;
                        parity_checker_enable = 1; 
                    
                    end            

                Stop_bit_check:
                    begin
                        enable = 1;
                        data_sample_enable = 1;
                        stop_checker_enable = 1;
                    end

                Data_valid:
                    begin
                        //data_valid = 1;
                        reset_counters = 1;
                    end   

                default:    
                    begin

                    end               

            endcase

    end  


endmodule 