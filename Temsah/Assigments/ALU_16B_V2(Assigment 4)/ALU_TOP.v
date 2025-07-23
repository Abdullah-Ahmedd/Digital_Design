`include "ARITHMATIC_UNIT.v"
`include "LOGIC_UNIT.v"
`include "SHIFT_UNIT.v"
`include "CMP_UNIT.v"
`include "Decoder.v"
module ALU_TOP#( parameter Width='d16 )
(

//Declaring inputs
    input wire signed [ Width-1 : 0 ] A,
    input wire signed [ Width-1 : 0 ] B,
    input wire [ 3 : 0 ] ALU_FUN,
    input wire CLK,
    input wire RST, //Active low asynchronus reset 

//Declaring outputs
    output wire [ (2*Width)-1 : 0 ] Arith_OUT,
    output wire [ Width-1 : 0 ] Logic_OUT,
    output wire [ Width-1 : 0 ] Shift_OUT,
    output wire [ Width-1 : 0 ] CMP_OUT,
//Declaring Flags
    output wire Arith_Flag,
    output wire Logic_Flag,
    output wire Shift_Flag,
    output wire CMP_Flag

);
//Declaring internal signals
wire Arith_Enable_internal;
wire Logic_Enable_internal;
wire Shift_Enable_internal;
wire CMP_Enable_internal;


//Decoder instantiaton
Decoder D1 
(
.ALU_FUN( ALU_FUN[ 3 : 2 ] ), 
.Arith_Enable( Arith_Enable_internal ),
.Logic_Enable( Logic_Enable_internal ),
.CMP_Enable( CMP_Enable_internal ),
.Shift_Enable( Shift_Enable_internal )
);

// Arithmatic unit instantiation
ARITHMATIC_UNIT #( .Width( Width ) ) ARU1 
(
.A( A ),
.B( B ),
.ALU_FUN( ALU_FUN[ 1 : 0 ] ),
.CLK( CLK ),
.RST( RST ),
.Arith_Enable( Arith_Enable_internal ),
.Arith_OUT( Arith_OUT ),
.Arith_Flag( Arith_Flag )
);

//Logic unit instantiation
LOGIC_UNIT #( .Width( Width ) ) LU1 
(
.A( A ),
.B( B ),
.ALU_FUN (ALU_FUN[ 1 : 0 ]),
.CLK( CLK ),
.RST( RST ),
.Logic_Enable( Logic_Enable_internal ),
.Logic_OUT( Logic_OUT ),
.Logic_Flag( Logic_Flag )
);

//Compare unit instantiation
CMP_UNIT #( .Width( Width ) ) CMPU1 
( 
.A( A ),
.B( B ),
.ALU_FUN( ALU_FUN[ 1 : 0 ]),
.CLK( CLK ),
.RST( RST ),
.CMP_Enable( CMP_Enable_internal ),
.CMP_OUT( CMP_OUT ),
.CMP_Flag( CMP_Flag )
);

//Shift unit instantiation 
SHIFT_UNIT #( .Width( Width ) ) SHU1 
(
.A( A ),
.B( B ),
.ALU_FUN( ALU_FUN[ 1 : 0 ] ),
.CLK( CLK ),
.RST( RST ), 
.Shift_Enable( Shift_Enable_internal ),
.Shift_OUT( Shift_OUT ),
.Shift_Flag( Shift_Flag )
);

endmodule