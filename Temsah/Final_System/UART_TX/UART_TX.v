`include "serializer.v"
`include "parity_calc.v"
`include "FSM.v"
`include "MUX.v"
module UART_TX
#( parameter Data_width = 8 )
(
//Declaring inputs    
    input wire [ Data_width - 1 : 0 ] P_DATA,
    input wire Data_valid,
    input wire PAR_EN,
    input wire PAR_TYP,
    input wire CLK,
    input wire RST,

//Declaring outputs
    output wire TX_OUT,
    output wire busy
);
//Declaring internal signals 
    wire [ 1 : 0 ] mux_sel_internal;
    wire ser_data_internal;
    wire par_bit_internal;
    wire ser_done_internal;
    wire ser_en_internal;


//modules instantiations
    serializer 
    #( .Data_width ( Data_width ) )
    S1 
    (
    .P_DATA( P_DATA ),
    .ser_en( ser_en_internal ),
    //.Data_valid(Data_valid_tb),
    .CLK( CLK ),
    .RST( RST ),
    .ser_data( ser_data_internal ),
    .ser_done( ser_done_internal )
    );
    parity_calc 
    #( .Data_width ( Data_width ) )
    P1
    (
    .P_DATA( P_DATA ),
    //.Data_valid( Data_valid ),
    .PAR_TYP( PAR_TYP ),
    .par_bit( par_bit_internal )
    //.PAR_EN(PAR_EN)
    );
    FSM FSM1
    (
    .Data_valid( Data_valid ),
    .PAR_EN( PAR_EN ),
    .ser_done( ser_done_internal ),
    .CLK( CLK ),
    .RST( RST ),
    .mux_sel( mux_sel_internal ),
    .ser_en( ser_en_internal ),
    .busy( busy )
    );


MUX M1
(
.mux_sel(mux_sel_internal),
.ser_data(ser_data_internal),
.par_bit(par_bit_internal),
.MUX_OUT(TX_OUT)
);

endmodule 