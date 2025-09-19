/*
`include "ARITHMATIC_UNIT.v"
`include "LOGIC_UNIT.v"
`include "SHIFT_UNIT.v"
`include "CMP_UNIT.v"
`include "Decoder.v"
`include "ALU_MUX.v"
*/
module ALU
#( parameter Input_data_width ='d8 , parameter Output_data_width ='d8  )
(

//Declaring inputs
    input wire [ Input_data_width - 1 : 0 ] A,
    input wire [ Input_data_width - 1 : 0 ] B,
    input wire [ 3 : 0 ] ALU_FUN,
    input wire CLK,
    input wire RST, //Active low asynchronus reset 
    input wire ALU_EN,

//Declaring outputs
    output wire  [ Output_data_width - 1 : 0 ] ALU_OUT,
    output wire OUT_VALID


);
//Declaring internal signals
wire  Arith_Enable_internal;
wire Logic_Enable_internal;
wire Shift_Enable_internal;
wire CMP_Enable_internal;

wire Arith_Flag_internal;
wire Logic_Flag_internal;
wire Shift_Flag_internal;
wire CMP_Flag_internal;

wire signed [ Output_data_width - 1 : 0 ] Arith_out_internal;
wire  [ Output_data_width - 1 : 0 ] Logic_out_internal;
wire  [ Output_data_width - 1 : 0 ] Shift_out_internal;
wire  [ Output_data_width - 1 : 0 ] CMP_out_internal;


//Decoder instantiaton
Decoder D1 
(
.ALU_FUN( ALU_FUN[ 3 : 2 ] ), 
.Arith_Enable( Arith_Enable_internal ),
.Logic_Enable( Logic_Enable_internal ),
.CMP_Enable( CMP_Enable_internal ),
.Shift_Enable( Shift_Enable_internal ),
.ALU_EN( ALU_EN )
);

// Arithmatic unit instantiation
ARITHMATIC_UNIT #( .Input_data_width ( Input_data_width ) , .Output_data_width ( Output_data_width )  ) ARU1 
(
.A( A ),
.B( B ),
.ALU_FUN( ALU_FUN[ 1 : 0 ] ),
.CLK( CLK ),
.RST( RST ),
.Arith_Enable( Arith_Enable_internal ),
.Arith_OUT( Arith_out_internal ),
.Arith_Flag( Arith_Flag_internal )
);

//Logic unit instantiation
LOGIC_UNIT #( .Input_data_width ( Input_data_width ) , .Output_data_width ( Output_data_width ) ) LU1 
(
.A( A ),
.B( B ),
.ALU_FUN (ALU_FUN[ 1 : 0 ]),
.CLK( CLK ),
.RST( RST ),
.Logic_Enable( Logic_Enable_internal ),
.Logic_OUT( Logic_out_internal ),
.Logic_Flag( Logic_Flag_internal )
);

//Compare unit instantiation
CMP_UNIT #( .Input_data_width ( Input_data_width ) , .Output_data_width ( Output_data_width ) ) CMPU1 
( 
.A( A ),
.B( B ),
.ALU_FUN( ALU_FUN[ 1 : 0 ] ),
.CLK( CLK ),
.RST( RST ),
.CMP_Enable( CMP_Enable_internal ),
.CMP_OUT( CMP_out_internal ),
.CMP_Flag( CMP_Flag_internal )
);

//Shift unit instantiation 
SHIFT_UNIT #( .Input_data_width ( Input_data_width ) , .Output_data_width ( Output_data_width ) ) SHU1 
(
.A( A ),
.B( B ),
.ALU_FUN( ALU_FUN[ 1 : 0 ] ),
.CLK( CLK ),
.RST( RST ), 
.Shift_Enable( Shift_Enable_internal ),
.Shift_OUT( Shift_out_internal ),
.Shift_Flag( Shift_Flag_internal )
);

//MUX for ALU_OUT instantiation
ALU_MUX #( .Output_data_width ( Output_data_width ) ) ALU_OUT_MUX
(
.In0( Arith_out_internal ),
.In1( Logic_out_internal ),
.In2( CMP_out_internal ),
.In3( Shift_out_internal ),
.Sel( ALU_FUN[ 3 : 2 ] ),
.Out( ALU_OUT )
);

//MUX for OUT_VALID instantiation
ALU_MUX #( .Output_data_width ( 1 ) ) OUT_VALID_MUX
(//Declaring inputs
.In0( Arith_Flag_internal ),
.In1( Logic_Flag_internal ),
.In2( CMP_Flag_internal ),
.In3( Shift_Flag_internal ),
.Sel( ALU_FUN[ 3 : 2 ] ),
.Out( OUT_VALID )
);

endmodule