
module FSM
(
//Declaring inputs
    input wire Data_valid,
    input wire PAR_EN,
    input wire ser_done,
    input wire CLK,
    input wire RST, // Asynchronous active-low reset

//Declaring outputs
    output reg [1:0] mux_sel,
    output reg ser_en,
    output reg busy
);

// FSM state registers
    reg [4:0] Current_state;
    reg [4:0] Next_state;

// State encoding (One-Shot)
    localparam Idle        = 5'b00001;
    localparam Start_bit   = 5'b00010;
    localparam Send_data   = 5'b00100;
    localparam Parity_Bit  = 5'b01000;
    localparam Stop_bit    = 5'b10000;

// State transition 
    always @ ( posedge CLK or negedge RST ) 
        begin
            if ( !RST ) 
                begin
                    Current_state <= Idle;
                end 
            else 
                begin
                    Current_state <= Next_state;
                end
        end

// Next state logic
    always @( * ) 
        begin
            case ( Current_state )
                Idle:
                    if ( Data_valid )
                        Next_state = Start_bit;
                    else
                        Next_state = Idle;

                Start_bit:
                    Next_state = Send_data;

                Send_data:
                    if ( ser_done )
                        if ( PAR_EN )
                            Next_state = Parity_Bit;
                        else
                            Next_state = Stop_bit;
                    else
                        Next_state = Send_data;

                Parity_Bit:
                    Next_state = Stop_bit;

                Stop_bit:
                    /*
                    if( Data_valid )
                    Next_state = Start_bit;
                    else 
                    Next_state = Idle;
                    */
                    Next_state = Idle;

                default:
                    Next_state = Idle;
            endcase
        end

// Output logic
    always @( * ) 
    begin
        // Default values
            ser_en  = 0;
            busy    = 0;
            mux_sel = 2'b01; 

            case ( Current_state )
                Idle: 
                    begin
                        busy = 0;
                        mux_sel = 2'b01; 
                        ser_en  = 0;
                    end

                Start_bit: 
                    begin
                        busy = 0;
                        mux_sel = 2'b01; 
                        ser_en  = 1;    
                    end

                Send_data: 
                    begin
                        busy = 1;
                        mux_sel = 2'b10; 
                        ser_en  = 1;
                    end

                Parity_Bit: 
                    begin
                        busy = 1;
                        mux_sel = 2'b11;
                        ser_en  = 0;
                    end

                Stop_bit: 
                    begin
                        busy = 1;
                        mux_sel = 2'b01; 
                        ser_en  = 0;
                    end

                default: begin
                    busy    = 0;
                    mux_sel = 2'b01;
                    ser_en  = 0;
                end
            endcase
    end

endmodule
