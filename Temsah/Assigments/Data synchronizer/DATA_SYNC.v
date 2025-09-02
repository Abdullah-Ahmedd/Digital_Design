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
    output reg enable_pulse
);
//Declaring the internal registers for the synchronizer 
    reg [ NUM_STAGES - 1 : 0 ] syn_reg;
//Declaring an internal signal for the pulse generator 
    wire pulse_gen;
//Declaring an internal reg for the pulse generator    
    reg pulse_gen_internal;
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
    assign pulse_gen = ~syn_reg[ NUM_STAGES - 1 ] & syn_reg[ NUM_STAGES - 2 ];

always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
        pulse_gen_internal <= 0;
        else 
        pulse_gen_internal <= pulse_gen;
        
    end
    
always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
        enable_pulse <= 0;
        else 
        enable_pulse <= pulse_gen_internal;
        
    end


//MUX 
assign mux = pulse_gen_internal ? unsync_bus : sync_bus ; //you did pulse_gen_internal (the real signal not the delayed signal) as you know that the enable signal is the only signal that comes early so we dealyed it but the output is not delayed so we dont need to delay it 

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