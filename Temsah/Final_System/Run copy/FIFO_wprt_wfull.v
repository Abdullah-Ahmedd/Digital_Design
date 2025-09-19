module FIFO_wprt_wfull
#(parameter Address_width = 3) // Depth = 2^(Address)
(
//Declaring inputs
    input wire Wrst,
    input wire Winc,
    input wire Wclk,
    input wire [Address_width : 0] Wq2_rptr,

//Declaring outputs
    output wire [Address_width - 2 : 0] Wadder,
    output reg [Address_width : 0] Wptr,
    output reg Wfull
);

//Declaring internal registers 
reg [Address_width -1: 0] Wadder_binary_current;
reg [Address_width -1: 0] Wadder_binary_next;
reg [Address_width -1: 0] Wadder_gray_next;

// Wptr logic - combinational next state logic
always @(*) begin
    Wadder_binary_next = Wadder_binary_current + (Winc & ~Wfull);
    Wadder_gray_next = (Wadder_binary_next >> 1) ^ Wadder_binary_next; //binary to gray conversion
end

//Sequential logic for pointers
always @(posedge Wclk or negedge Wrst) begin
    if (!Wrst) begin
        Wadder_binary_current <= 0;
        Wptr <= 0;
    end
    else begin
        Wadder_binary_current <= Wadder_binary_next; 
        Wptr <= Wadder_gray_next;
    end    
end

//Wadder logic - only lower bits for memory addressing
assign Wadder = Wadder_binary_current[Address_width - 1 : 0];

//Wfull logic - using next state for proper timing
always @(posedge Wclk or negedge Wrst) begin
    if (!Wrst) begin
        Wfull <= 0;
    end
    else begin
        // Full condition: MSB and MSB-1 are different, rest are same
        Wfull <= (Wadder_gray_next[Address_width] != Wq2_rptr[Address_width]) &&  
                 (Wadder_gray_next[Address_width - 1] != Wq2_rptr[Address_width - 1]) &&
                 (Wadder_gray_next[Address_width - 2 : 0] == Wq2_rptr[Address_width - 2 : 0]);
    end
end

endmodule