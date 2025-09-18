module DATA_SYNC
#( parameter NUM_STAGES = 2 , parameter BUS_WIDTH = 8 )
(
//Declaring inputs
    input wire [ BUS_WIDTH - 1 : 0 ] unsync_bus,
    input wire bus_enable,
    input wire CLK, //Destination clock 
    input wire RST, //Destination reset
//Declaring outputs
    output reg [ BUS_WIDTH - 1 : 0 ] sync_bus,
    output reg enable_pulse
);
//Declaring the internal registers for the synchronizer 
    reg [ NUM_STAGES - 1 : 0 ] syn_reg;
//Declaring an internal signal for the pulse generator 
    wire pulse_gen;
//Declaring the mux output
    wire [ BUS_WIDTH - 1 : 0 ] mux;  
//Isolating the unsync data input
reg [ BUS_WIDTH - 1 : 0 ] unsync_reg;




//Synchronizer
always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                syn_reg <= 0;
                unsync_reg<=0;
            end
        else if( unsync_reg != unsync_bus )    
            begin
                syn_reg<=0;
                unsync_reg<=unsync_bus;
            end
        else
            begin
                syn_reg <= { syn_reg [ NUM_STAGES - 2 : 0 ] , bus_enable };
            end
    end

//Pulse generator
    assign pulse_gen = ~syn_reg[ NUM_STAGES - 1 ] & syn_reg[ NUM_STAGES - 2 ];

always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
        enable_pulse <= 0;
        else 
        enable_pulse <= pulse_gen;
        
    end


//MUX 
assign mux = pulse_gen ? unsync_reg : sync_bus ;

//Destination flip flop
    always@( posedge CLK  or  negedge RST )
        begin
            if( !RST )
                begin
                  sync_bus <= 0;
                end                
            else
                begin
                    sync_bus <= mux ;
                end
                      
        end

endmodule