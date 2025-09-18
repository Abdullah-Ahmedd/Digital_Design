`include "edge_bit_counter.v"
`include "data_sampling.v"
`include "deserializer.v"
`include "parity_checker.v"
`include "start_checker.v"
`include "stop_checker.v"
`include "UART_RX_FSM.v"

module UART_RX
#( parameter Data_width = 8 )
(
//Declaring inputs
    input wire CLK,
    input wire RST,
    input wire RX_IN,
    input wire [ 5 : 0 ] prescale,
    input wire PAR_EN,
    input wire PAR_TYP,
//Declaring outputs
    output wire [ Data_width - 1 : 0 ] RX_P_DATA,
    output wire RX_data_valid
);
//Declaring internal signals
    wire reset_counters_internal;
    wire enable_internal;
    wire [ 3 : 0 ] bit_cnt_internal;
    wire [ 5 : 0 ]edge_cnt_counter_internal;
    wire data_sample_enable_internal;
    wire sampled_bit_internal;
    wire deserializer_enable_internal;
    wire parity_checker_enable_internal;
    wire parity_error_internal;
    wire start_checker_enable_internal;
    wire start_glitch_internal;
    wire stop_checker_enable_internal;
    wire stop_error_internal;


edge_bit_counter ebc
(
.CLK( CLK ),
.RST( RST ),
.reset_counters( reset_counters_internal ),
.enable( enable_internal ),
.prescale( prescale ),
.bit_cnt( bit_cnt_internal ),
.edge_cnt( edge_cnt_counter_internal )
);

data_sampling ds
(
.CLK( CLK ),
.RST( RST ),
.data_sample_enable( data_sample_enable_internal ),
.RX_IN( RX_IN ),
.prescale( prescale ),
.edge_cnt( edge_cnt_counter_internal ),
.sampled_bit( sampled_bit_internal )  
);

deserializer 
#( .Data_width ( Data_width ) )
d
(
.CLK( CLK ),
.RST( RST ),
.sampled_bit( sampled_bit_internal ),
.deserializer_enable( deserializer_enable_internal ),
.bit_cnt( bit_cnt_internal ),
.P_DATA( RX_P_DATA )
);

parity_checker
#( .Data_width ( Data_width ) )
 pc 
(
.CLK( CLK),
.RST( RST ),
.PAR_TYP( PAR_TYP ),
.parity_checker_enable( parity_checker_enable ),
.bit_cnt( bit_cnt_internal ),
.sampled_bit( sampled_bit_internal ),
.parity_error( parity_error_internal )
);

start_checker start 
(
.CLK( CLK ),
.RST( RST ),
.start_checker_enable( start_checker_enable_internal ),
.sampled_bit( sampled_bit_internal ),
.start_glitch( start_glitch_internal )
);

stop_checker stop
(
.CLK( CLK ),
.RST( RST ),
.stop_checker_enable( stop_checker_enable_internal ),
.sampled_bit( sampled_bit_internal ),
.stop_error( stop_error_internal )
);

UART_RX_FSM
#( .Data_width ( Data_width ) )
FSM1
(
.CLK( CLK ),
.RST( RST ),
.RX_IN( RX_IN ),
.edge_cnt( edge_cnt_counter_internal ),
.bit_cnt( bit_cnt_internal ),
.prescale( prescale ),
.stop_error( stop_error_internal ),
.start_glitch( start_glitch_internal ),
.parity_error( parity_error_internal ),
.PAR_EN( PAR_EN ),
.data_sample_enable( data_sample_enable_internal ),
.enable( enable_internal ),
.deserializer_enable( deserializer_enable_internal ),
.data_valid(RX_data_valid),
.stop_checker_enable( stop_checker_enable_internal ),
.start_checker_enable( start_checker_enable_internal ),
.parity_checker_enable( parity_checker_enable_internal ),
.reset_counters( reset_counters_internal )
);


endmodule