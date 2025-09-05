`include "FIFO_wprt_wfull.v"
`include "Comb_logic.v"
`include "FIFO_MEMORY.v"
`include "FIFO_rptr_rempty.v"
`include "BIT_SYNC.v"
module ASYNC_FIFO
#(  
    parameter Data_width = 8,
    parameter Depth = 8,
    parameter Address = 3, // depth = 2^(Address) 
    parameter NUM_STAGES= 2
)
(
//Declaring inputs
    input wire Winc,
    input wire Wrst,
    input wire Wclk,
    input wire Rinc,
    input wire Rrst,
    input wire Rclk,
    input wire [ Data_width - 1 : 0 ] Wrdata,
//Declaring outputs
    output wire Wfull,
    output wire Rempty,
    output wire [ Data_width - 1 : 0 ] Rdata
);
//Internal signals
wire [ Address : 0 ] Wq2_rptr_internal;
wire [ Address - 1 : 0 ] Wadder_internal;
wire [ Address : 0 ] Wptr_internal;
wire Wclken_internal;
wire [ Address - 1 : 0 ] Radder_internal;
wire [ Address : 0 ]R2q_wptr_internal;
wire [ Address : 0 ] Rptr_internal;
wire Rempty_flag_internal;


//Modules instantiation

FIFO_wptr_wfull 
#( .Address ( Address ) )
FIFO_WPTRFULL
(
.Wrst( Wrst ),
.Winc( Winc ),
.Wclk( Wclk ),
.Wq2_rptr( Wq2_rptr_internal ),
.Wadder( Wadder_internal ),
.Wptr( Wptr_internal ),
.Wfull( Wfull )
);

Comb_logic Clogic 
(
.Winc( Winc ),
.Wfull( Wfull ),
.Wclken( Wclken_internal )    
);

FIFO_MEMORY
#(
.Data_width ( Data_width ),
.Depth ( Depth ),
.Address ( Address )
)
FIFO_MEM
(
.Wrdata( Wrdata ),
.Wadder( Wadder_internal ),
.Wclken( Wclken_internal ),
.Wclk( Wclk ),
.Rdata( Rdata ),
.Radder( Radder_internal ),
.Rclk( Rclk ),
.Rempty_flag( Rempty_flag_internal )
);

FIFO_rptr_rempty
#( .Address ( Address ) )
FIFO_RPTRREMPTY
(
.Rinc( Rinc ),
.Rclk( Rclk ),
.Rrst( Rrst ),
.R2q_wptr( R2q_wptr_internal ),
.Radder( Radder_internal ),
.Rempty( Rempty ),
.Rptr( Rptr_internal ),
.Rempty_flag( Rempty_flag_internal )
);

BIT_SYNC 
#(
.NUM_STAGES( NUM_STAGES ),
.BUS_WIDTH ( Address + 1 )
)
BIT_W2q_rptr
(
.ASYNC( Rptr_internal ),
.CLK( Wclk ),
.RST( Wrst ),
.SYNC( Wq2_rptr_internal )
);

BIT_SYNC 
#(
.NUM_STAGES( NUM_STAGES ),
.BUS_WIDTH ( Address + 1 )
)
BIT_r2q_wptr
(
.ASYNC( Wptr_internal ),
.CLK( Rclk ),
.RST( Rrst ),
.SYNC( R2q_wptr_internal )
);

endmodule