module mux_2x1_en (
    input wire i0,    // Input 0
    input wire i1,    // Input 1
    input wire s,     // Select signal
    input wire en,    // Enable signal (Active High)
    output reg out    // Output
);

    always @(*) begin
        if (en) begin
            // If enabled, behave like a normal mux
            // If s = 0, out = i0
            // If s = 1, out = i1 
            out = s ? i1 : i0;
        end else begin
            // If disabled, pull output low
            out = 1'b0;
        end
    end

endmodule