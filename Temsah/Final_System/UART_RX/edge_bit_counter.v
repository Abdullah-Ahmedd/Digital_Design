module edge_bit_counter 
(
//Declaring inputs 
    input wire CLK,
    input wire RST, //Asynchronus active-low reset
    input wire reset_counters,
    input wire enable,
    input wire [ 5 : 0 ] prescale,
//Declaring outputs
    output reg [ 3 : 0 ] bit_cnt,
    output reg [ 5 : 0 ] edge_cnt
);

//edge counter 
always@( posedge CLK  or  negedge RST ) 
    begin
        if( !RST ) 
            begin
                edge_cnt <= 0;
            end 
        else if( reset_counters )
            begin
                edge_cnt <= 0;    
            end
        else if ( enable )
            begin                
                if( edge_cnt == prescale -1 )
                    begin
                        edge_cnt <= 0;
                    end 
                else edge_cnt <= edge_cnt + 1;
            end                 
    end

//bit counter 
always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                bit_cnt <= 0;
            end
        else if( reset_counters )
            begin
                bit_cnt <= 0;
            end            
        else if( enable )
            begin
                if( edge_cnt == prescale - 1 )
                    bit_cnt <= bit_cnt + 1;
            end
    end

endmodule 