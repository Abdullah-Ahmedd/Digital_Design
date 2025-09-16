module data_sampling 
(
//Declaring inputs
    input wire CLK,
    input wire RST, //Asynchronus active-low reset
    input wire data_sample_enable,
    input wire RX_IN,
    input wire [ 5 : 0 ] prescale,
    input wire [ 5 : 0 ] edge_cnt,
//Declaring outputs
    output reg sampled_bit
);

//Declaring a register to store the value of the sampled data
    reg sample1;
    reg sample2;
    reg sample3;

always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                //All registers are reseted to one as idle equal one
                    sample1 <= 1;
                    sample2 <= 1;
                    sample3 <= 1;
                    sampled_bit <= 1;
            end
        else if( data_sample_enable )
            begin
                    if( edge_cnt == ( prescale >> 1 ) - 1 )
                        sample1 <= RX_IN; 

                    if( edge_cnt == ( prescale >> 1 ) )
                        sample2 <= RX_IN;

                    if( edge_cnt == ( prescale >> 1 ) + 1 )
                    begin
                            sample3 <= RX_IN;                        
                            sampled_bit <= ( sample1 && sample2 ) || ( sample2 && sample3 ) || ( sample1 && sample3 );
                     end
            end        
    end

endmodule 