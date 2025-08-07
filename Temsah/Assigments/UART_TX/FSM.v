module FSM
(
    // Inputs
    input wire Data_valid,
    input wire PAR_EN,
    input wire ser_done,
    input wire CLK,
    input wire RST, // Asynchronous active-low reset

    // Outputs
    output reg [1:0] mux_sel,
    output reg ser_en,
    output reg busy
);

    // FSM state registers
    reg [4:0] Current_state;
    reg [4:0] Next_state;

    // State encoding
    localparam IDLE        = 5'b00001;
    localparam Start_bit   = 5'b00010;
    localparam SER_SETUP   = 5'b00011; // New state
    localparam Send_data   = 5'b00100;
    localparam parity      = 5'b01000;
    localparam Stop_bit    = 5'b10000;

    // State transition logic
    always @ (posedge CLK or negedge RST) begin
        if (!RST) begin
            Current_state <= IDLE;
        end else begin
            Current_state <= Next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (Current_state)
            IDLE:
                if (Data_valid)
                    Next_state = Start_bit;
                else
                    Next_state = IDLE;

            Start_bit:
                Next_state = SER_SETUP;

            SER_SETUP:
                Next_state = Send_data;

            Send_data:
                if (ser_done)
                    if (PAR_EN)
                        Next_state = parity;
                    else
                        Next_state = Stop_bit;
                else
                    Next_state = Send_data;

            parity:
                Next_state = Stop_bit;

            Stop_bit:
                Next_state = IDLE;

            default:
                Next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default values
        ser_en  = 0;
        busy    = 0;
        mux_sel = 2'b01; // IDLE

        case (Current_state)
            IDLE: begin
                busy    = 0;
                mux_sel = 2'b01; // IDLE
            end

            Start_bit: begin
                busy    = 1;
                mux_sel = 2'b00; // Start bit (usually 0)
                ser_en  = 0;     // Don’t start serializer yet
            end

            SER_SETUP: begin
                busy    = 1;
                mux_sel = 2'b10; // Select serializer output
                ser_en  = 1;     // ✅ Now enable serializer
            end

            Send_data: begin
                busy    = 1;
                mux_sel = 2'b10; // Continue sending serialized data
                ser_en  = 1;
            end

            parity: begin
                busy    = 1;
                mux_sel = 2'b11; // Select parity bit generator
                ser_en  = 0;
            end

            Stop_bit: begin
                busy    = 1;
                mux_sel = 2'b01; // Stop bit (typically logic 1)
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
