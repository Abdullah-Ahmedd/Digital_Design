module BIT_SYNC
#(
    parameter NUM_STAGES = 2,
    parameter BUS_WIDTH = 1
)
(
//Declaring inputs
    input wire [BUS_WIDTH - 1 : 0] ASYNC,
    input wire CLK,
    input wire RST,
//Declaring output
    output reg [BUS_WIDTH - 1 : 0] SYNC
);

//Declaring the synchronizer registers - proper 2D array
reg [NUM_STAGES - 1 : 0] sync_reg [0 : BUS_WIDTH - 1];

//Declaring the loop variable
integer i;

// Initialize to avoid X values
initial begin
    for (i = 0; i < BUS_WIDTH; i = i + 1) begin
        sync_reg[i] = {NUM_STAGES{1'b0}};
    end
    SYNC = {BUS_WIDTH{1'b0}};
end

//Sequential logic for synchronizer flip-flops
always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        for (i = 0; i < BUS_WIDTH; i = i + 1) begin
            sync_reg[i] <= {NUM_STAGES{1'b0}};
        end
    end
    else begin
        for (i = 0; i < BUS_WIDTH; i = i + 1) begin
            sync_reg[i] <= {sync_reg[i][NUM_STAGES - 2 : 0], ASYNC[i]};
        end
    end     
end

//Combinational logic for output
always @(*) begin
    for (i = 0; i < BUS_WIDTH; i = i + 1) begin
        SYNC[i] = sync_reg[i][NUM_STAGES - 1];
    end
end

endmodule