module mux2x1 (
    input wire i0,    // Input 0
    input wire i1,    // Input 1
    input wire s,     // Select signal
    output wire out    // Output
);

    // If s = 0, out = i0
    // If s = 1, out = i1 

    assign out = s ? i1 : i0;

endmodule