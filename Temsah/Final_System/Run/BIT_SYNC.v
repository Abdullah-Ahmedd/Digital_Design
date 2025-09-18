module BIT_SYNC
#(
parameter NUM_STAGES = 2,
parameter BUS_WIDTH = 1
)
(
//Declaring inputs
    input wire [ BUS_WIDTH - 1 : 0 ] ASYNC,
    input wire CLK,
    input wire RST,
//Declaring output
    output reg [ BUS_WIDTH - 1 : 0 ] SYNC
);
//Declaring the synchronizer registers
reg [ NUM_STAGES-1 : 0 ] sync_reg [ BUS_WIDTH - 1 : 0 ];
//Declaring the loop variable
integer i;

always@( posedge CLK  or  negedge RST )
begin
    if( !RST )
        begin
            for(  i = 0  ;  i <= BUS_WIDTH - 1  ;  i = i + 1  )
                    sync_reg[ i ] <= 0;
                 
        end
    else
        begin
            for(  i = 0  ;  i <= BUS_WIDTH - 1  ;  i = i + 1  )
                sync_reg [ i ] <= {sync_reg[ i ][ NUM_STAGES - 2 ] , ASYNC[i] };
        end     

end

always@( * )
    begin
        for(  i = 0  ;  i <= BUS_WIDTH - 1  ;  i = i + 1  )
            SYNC[ i ] = sync_reg[ i ][ NUM_STAGES - 1 ];
    end

endmodule