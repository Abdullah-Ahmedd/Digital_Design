module mux_4x1 (
    input wire i0,    // Input 0
    input wire i1,    // Input 1
    input wire i2,    // Input 2
    input wire i3,    // Input 3
    input wire s0,    // Select signal 0 (LSB)
    input wire s1,    // Select signal 1 (MSB)
    output reg out    // Output
);

    always @(*) begin
        // Concatenating s1 and s0 to form a 2-bit selection bus
        case ({s1, s0})
            2'b00: out = i0; // Selects i0 when s1=0, s0=0
            2'b01: out = i1; // Selects i1 when s1=0, s0=1
            2'b10: out = i2; // Selects i2 when s1=1, s0=0
            2'b11: out = i3; // Selects i3 when s1=1, s0=1
            default: out = 1'b0;
        endcase
    end

endmodule