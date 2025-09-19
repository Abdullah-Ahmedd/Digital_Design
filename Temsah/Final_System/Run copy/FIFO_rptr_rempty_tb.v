module FIFO_rptr_rempty
#( parameter Address_width = 3 )
(
    input  wire           Rinc,
    input  wire           Rclk,
    input  wire           Rrst,
    input  wire [Address_width:0] R2q_wptr, // Write pointer synchronized to read clock

    output wire [Address_width-1:0] Radder,
    output reg                    Rempty,
    output reg                    Rempty_flag,
    output reg  [Address_width:0] Rptr
);

    // Internal binary counters
    reg [Address_width:0] Rbin_current, Rbin_next;
    reg [Address_width:0] Rgray_next;

    // Next pointer logic
    always @(*) begin
        Rbin_next  = Rbin_current + (Rinc & ~Rempty);
        Rgray_next = (Rbin_next >> 1) ^ Rbin_next; // binary -> Gray
    end

    // Update binary & gray pointer
    always @(posedge Rclk or negedge Rrst) begin
        if (!Rrst) begin
            Rbin_current <= 0;
            Rptr         <= 0;
        end else begin
            Rbin_current <= Rbin_next;
            Rptr         <= Rgray_next;
        end
    end

    assign Radder = Rbin_current[Address_width-1:0];

    // Synchronize write pointer into read clock domain
    reg [Address_width:0] Wptr_sync1, Wptr_sync2;
    always @(posedge Rclk) begin
        Wptr_sync1 <= R2q_wptr;
        Wptr_sync2 <= Wptr_sync1;
    end

    // Empty detection
    always @(posedge Rclk or negedge Rrst) begin
        if (!Rrst) begin
            Rempty      <= 1'b1;
            Rempty_flag <= 1'b1;
        end else begin
            Rempty      <= (Rgray_next == Wptr_sync2);
            Rempty_flag <= (Rgray_next == Wptr_sync2);
        end
    end

endmodule
