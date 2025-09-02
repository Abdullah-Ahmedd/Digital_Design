module RST_SYNC
#( parameter NUM_STAGES = 2 )
(
//Declaring inputs
    input wire RST,
    input wire CLK,
//Declaring outputs
    output wire SYNC_RST
);

//Declaring the internal registers of the synchronizer
    reg [ NUM_STAGES - 1 : 0 ] sync_reg;


always@( posedge CLK  or  negedge RST )
    begin
        if( !RST )
            begin
                sync_reg <=0;
            end
        else
            begin
                sync_reg <= { 1'b1 , sync_reg[ NUM_STAGES - 1 : 1 ] };
            end
    end

assign SYNC_RST = sync_reg[ 0 ];

endmodule