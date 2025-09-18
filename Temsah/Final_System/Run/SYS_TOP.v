`include "../Reset_syncrhonizer/RST_SYNC.v"
`include "../Clock_divider/ClkDiv.v"
`include "../System_control/SYS_CTRL.v"
`include "../Data_syncrhonizer/DATA_SYNC.v"
`include "../UART_RX/UART_RX.v"
`include "../UART_TX/UART_TX.v"
`include "../Pulse_generator/PULSE_GEN.v"
`include "../Asyncrhonous_FIFO/ASYNC_FIFO.v"
`include "../MUX/MUX.v"
`include "../Clock_gating/CLK_gate.v"
`include "../ALU/ALU.v"
`include "../Register_file/Register_file.v"



module SYS_TOP
#(  parameter Data_width = 'd8 , parameter Address_width = 'd4 , parameter NUM_STAGES = 'd2 , parameter Depth = 'd8 )
(
//Declaring inputs
    input wire Ref_clk,
    input wire RST,
    input wire UART_clk,
    input wire RX_IN,
//Declaring output
    output wire TX_OUT

);
//Declaring internal signals
wire SYNC_RST_domain_1;
wire SYNC_RST_domain_2;

wire UART_TX_clk_internal;
wire [ Data_width - 1 : 0 ] REG3_internal;
wire UART_RX_clk_internal;
wire [ Data_width - 1 : 0 ] REG2_internal;

wire [ Data_width - 1 : 0 ] ALU_OUT_internal;
wire OUT_VALID_internal;
wire [ Data_width - 1 : 0 ] RX_p_data_SYNC_internal;
wire RX_d_valid_SYNC_internal;
wire [ Data_width - 1 : 0 ] Rd_data_internal;
wire RdData_valid_internal;
wire Wfull_internal;
wire ALU_EN_internal;
wire [ 3 : 0 ] ALU_FUN_internal;
wire CLK_EN_internal;
wire [ Address_width - 1 : 0 ] Address_internal;
wire RdEN_internal;
wire WrEN_internal;
wire [ Data_width - 1 : 0 ]WrData_internal;
wire clk_div_en_internal;

wire [ Data_width - 1 : 0 ] RX_P_DATA_internal;
wire RX_data_valid_internal;

wire busy_internal;

wire Rinc_internal;

wire Rempty_internal;

wire [ Data_width - 1 : 0 ] Rdata_internal;

wire [ 3 : 0 ] RX_clock_div_ratio_internal;

wire ALU_clk_internal;

wire [ Data_width - 1 : 0 ] REG0_internal;
wire [ Data_width - 1 : 0 ] REG1_internal;

wire [ Data_width - 1 : 0 ] TX_p_data_inetrnal;

//Reset synchronizer for clock domain 1
RST_SYNC
#(.NUM_STAGES ( NUM_STAGES ) )
Reset_synchronizer1
(
.RST( RST ),
.CLK( Ref_clk ),
.SYNC_RST( SYNC_RST_domain_1 )
);

//Reset synchronizer for clock domain 2
RST_SYNC
#(.NUM_STAGES ( NUM_STAGES ) )
Reset_synchronizer2
(
.RST( RST ),
.CLK( UART_clk ),
.SYNC_RST( SYNC_RST_domain_2 )
);

//Clock divider for UART RX
ClkDiv clock_divider_UART_RX
(
.i_ref_clk( UART_clk ),
.i_rst_n( SYNC_RST_domain_2 ),
.i_clk_en( clk_div_en_internal ),
.i_div_ratio( {4'b0000,RX_clock_div_ratio_internal} ),
.o_div_clk( UART_RX_clk_internal )
);

//Clock divider for UART TX
ClkDiv clock_divider_UART_TX
(
.i_ref_clk( UART_clk ),
.i_rst_n( SYNC_RST_domain_2 ),
.i_clk_en( clk_div_en_internal ),
.i_div_ratio( REG3_internal ),
.o_div_clk( UART_TX_clk_internal )
);

//SYS_CTRL
SYS_CTRL
#( .Data_width ( Data_width ) , .Address_width ( Address_width ) )
System_control
(
.ALU_OUT( ALU_OUT_internal ),
.OUT_VALID( OUT_VALID_internal ),
.RX_p_data( RX_p_data_SYNC_internal ),
.RX_d_valid( RX_d_valid_SYNC_internal ),
.Rd_data( Rd_data_internal ),
.RdData_valid( RdData_valid_internal ),
.FIFO_full( Wfull_internal ),
.CLK( Ref_clk ),
.RST( SYNC_RST_domain_1 ),
.ALU_EN( ALU_EN_internal ),
.ALU_FUN( ALU_FUN_internal ),
.CLK_EN( CLK_EN_internal ),
.Address( Address_internal ),
.WrEN( WrEN_internal ),
.RdEN( RdEN_internal ),
.WrData( WrData_internal ),
.TX_p_data( TX_p_data_inetrnal ), // Wrdata ( FIFO )
.TX_d_valid( TX_d_valid_internal ), // Winc ( FIFO )
.clk_div_en( clk_div_en_internal )
);

//Data syncrhonizer
DATA_SYNC
#( .NUM_STAGES ( NUM_STAGES ) , .BUS_WIDTH ( Data_width ) )
Data_syncrhonizer
(
.unsync_bus( RX_P_DATA_internal ),
.bus_enable( RX_data_valid_internal ),
.CLK( Ref_clk ),
.RST( SYNC_RST_domain_1 ),
.sync_bus( RX_p_data_SYNC_internal ),
.enable_pulse( RX_d_valid_SYNC_internal ) 
);

//UART RX
UART_RX
#( .Data_width ( Data_width ) )
UARTRX
(
.CLK( UART_RX_clk_internal ),
.RST( SYNC_RST_domain_2 ),
.RX_IN( RX_IN ),
.prescale(REG2_internal [ 7 : 2 ] ),
.PAR_EN( REG2_internal [ 0 ] ),
.PAR_TYP(REG2_internal [ 1 ]),
.RX_P_DATA( RX_P_DATA_internal ),
.RX_data_valid( RX_data_valid_internal )
);

//UART TX
UART_TX
#( .Data_width ( Data_width ) )
UARTTX
(
.TX_P_DATA( Rdata_internal ),
.TX_Data_valid( ~Rempty_internal ),
.PAR_EN( REG2_internal [ 0 ] ),
.PAR_TYP( REG2_internal [ 1 ] ),
.CLK( UART_TX_clk_internal ),
.RST( SYNC_RST_domain_2 ),
.TX_OUT( TX_OUT ),
.busy( busy_internal )
);

//Pulse generator 
PULSE_GEN Pulse_gen
(
//Declaring inputs
.LVL_SIG( busy_internal ),
.CLK( UART_TX_clk_internal ),
.RST( SYNC_RST_domain_2 ),
.PULSE_SIG( Rinc_internal )    
);

//Asynchronous FIFO
ASYNC_FIFO
#( .Data_width( Data_width ), .Depth ( Depth ) , .Address_width ( Address_width ) , .NUM_STAGES( NUM_STAGES ) )
FIFO
(
.Winc( TX_d_valid_internal ),
.Wrst( SYNC_RST_domain_1 ),
.Wclk( Ref_clk ),
.Rinc( Rinc_internal ),
.Rrst( SYNC_RST_domain_2 ),
.Rclk( UART_TX_clk_internal ),
.Wrdata( TX_p_data_inetrnal ),
.Wfull( Wfull_internal ),
.Rempty( Rempty_internal ),
.Rdata( Rdata_internal )
);

//MUX
MUX Prescale_MUX
(
.prescale( REG2_internal [ 7 : 2 ] ),
.OUT( RX_clock_div_ratio_internal )
);

//Clock gate
CLK_gate clock_gating_ALU
(
.CLK_EN( CLK_EN_internal ),
.CLK( Ref_clk ),
.GATED_CLK( ALU_clk_internal )    
);

//ALU
ALU
#(.Input_data_width ( Data_width ) , .Output_data_width ( Data_width ) )
ALU1
(
.A( REG0_internal ),
.B( REG1_internal ),
.ALU_FUN( ALU_FUN_internal ),
.CLK( ALU_clk_internal ),
.RST( SYNC_RST_domain_1 ),
.ALU_EN( ALU_EN_internal ),
.ALU_OUT( ALU_OUT_internal ),
.OUT_VALID( OUT_VALID_internal )
);
//Register file
Register_file
#( .DATA_width ( Data_width )  , .Address_width ( Address_width ) )
Regfile
(
.WrData(WrData_internal),
.Address( Address_internal ),
.WrEn( WrEN_internal ),
.CLK( Ref_clk ),
.RST( SYNC_RST_domain_1 ),
.RdData( Rd_data_internal ),
.RdData_valid( RdData_valid_internal ),
.REG0( REG0_internal ),
.REG1( REG1_internal ),
.REG2( REG2_internal ),
.REG3( REG3_internal )
);


endmodule