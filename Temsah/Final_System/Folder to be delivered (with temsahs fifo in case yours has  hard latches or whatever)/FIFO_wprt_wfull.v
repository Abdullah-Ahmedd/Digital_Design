module FIFO_wptr_wfull
#( parameter Address_width = 3 ) // Depth = 2^Address
(
    input  wire           Wrst,
    input  wire           Winc,
    input  wire           Wclk,
    input  wire [Address_width:0] Wq2_rptr, // Read pointer synchronized to write clock

    output wire [Address_width-1:0] Wadder,
    output reg  [Address_width:0]   Wptr,
    output reg                    Wfull
);

    // Internal binary counters
    reg [Address_width:0] Wbin_current, Wbin_next;
    reg [Address_width:0] Wgray_next;

    // Next pointer logic
    always @(*) begin
        Wbin_next  = Wbin_current + (Winc & ~Wfull);
        Wgray_next = (Wbin_next >> 1) ^ Wbin_next; // binary -> Gray
    end

    // Update binary & gray pointer
    always @(posedge Wclk or negedge Wrst) begin
        if (!Wrst) begin
            Wbin_current <= 0;
            Wptr         <= 0;
        end else begin
            Wbin_current <= Wbin_next;
            Wptr         <= Wgray_next;
        end
    end

    assign Wadder = Wbin_current[Address_width-1:0];

    // Synchronize read pointer into write clock domain
    reg [Address_width:0] Rptr_sync1, Rptr_sync2;
    always @(posedge Wclk) begin
        Rptr_sync1 <= Wq2_rptr;
        Rptr_sync2 <= Rptr_sync1;
    end

    // Full detection
    always @(posedge Wclk or negedge Wrst) begin
        if (!Wrst)
            Wfull <= 0;
        else
            Wfull <= (Wgray_next[Address_width]   != Rptr_sync2[Address_width]) &&
                     (Wgray_next[Address_width-1] != Rptr_sync2[Address_width-1]) &&
                     (Wgray_next[Address_width-2:0] == Rptr_sync2[Address_width-2:0]);
    end

endmodule
