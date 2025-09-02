module DATA_SYNC
#( parameter NUM_STAGES = 2 , parameter BUS_WIDTH = 8 )
(
//Declaring inputs
    input wire [ BUS_WIDTH - 1 : 0 ] unsync_bus,
    input wire bus_enable,
    input wire CLK,
    input wire RST,
//Declaring outputs
    output reg [ BUS_WIDTH - 1 : 0 ] sync_bus,
    output wire enable_pulse
);
//Declaring the internal registers for the synchronizer 
    reg [ NUM_STAGES - 1 : 0 ] syn_reg;
//Declaring an internal register for the pulse gen
    reg pulse_gen;
//Declaring the mux output
    wire [ BUS_WIDTH - 1 : 0 ] mux;       

//Synchronizer
always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                syn_reg <= 0;
            end
        else
            begin
                syn_reg<={ syn_reg [ NUM_STAGES - 2 : 0 ] , bus_enable };
            end
    end

//Pulse generator
    always@(posedge CLK or negedge RST)
        begin
            if(!RST)
                begin
                  pulse_gen <= 0;
                end
            else
            pulse_gen <= syn_reg[ NUM_STAGES - 1 ] ;    
        end

assign enable_pulse = ~pulse_gen & syn_reg[ NUM_STAGES - 2 ];


//MUX 
assign mux = enable_pulse ? unsync_bus : sync_bus ;

//Destination flip flop
    always@(posedge CLK or negedge RST)
        begin
            if(!RST)
                begin
                  sync_bus <= 0;
                end
            else
            sync_bus <= mux ;    
        end

endmodule
