module FIFO_wptr_wfull
#( parameter Address = 3 ) // Depth = 2^Address
(
    input  wire             Wrst,
    input  wire             Winc,
    input  wire             Wclk,
    input  wire [Address:0] Wq2_rptr,  // read pointer synchronized to write clock

    output wire [Address-1:0] Wadder,
    output reg  [Address:0]    Wptr,
    output reg                 Wfull
);

    // Binary counter for write pointer
    reg [Address:0] wbin; 
    wire [Address:0] wbin_next;

    assign wbin_next = wbin + (Winc & ~Wfull);

    // Convert binary to Gray code
    wire [Address:0] wgray_next;
    assign wgray_next = (wbin_next >> 1) ^ wbin_next;

    // Output address for memory (lower Address bits)
    assign Wadder = wbin[Address-1:0];

    // Sequential block for pointer update
    always @(posedge Wclk or negedge Wrst) begin
        if(!Wrst) begin
            wbin <= 0;
            Wptr <= 0;
        end else begin
            wbin <= wbin_next;
            Wptr <= wgray_next;
        end
    end

    // Full logic using standard Gray code comparison
    // Full occurs when next write pointer = read pointer with MSB inverted
    always @(posedge Wclk or negedge Wrst) begin
        if(!Wrst) begin
            Wfull <= 0;
        end else begin
            Wfull <= ( wgray_next[Address]      != Wq2_rptr[Address]) &&
                     ( wgray_next[Address-1]    != Wq2_rptr[Address-1]) &&
                     ( wgray_next[Address-2:0] == Wq2_rptr[Address-2:0]);
        end
    end

endmodule
