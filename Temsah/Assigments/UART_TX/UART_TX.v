`include "serializer.v"
`include "parity_calc.v"
`include "FSM.v"
`include "MUX.v"
module UART_TX
(
//Declaring inputs    
    input wire [ 7 : 0 ] P_DATA,
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
    serializer S1 
    (
    .P_DATA( P_DATA ),
    .ser_en( ser_en_internal ),
    //.Data_valid(Data_valid_tb),
    .CLK( CLK ),
    .RST( RST ),
    .ser_data( ser_data_internal ),
    .ser_done( ser_done_internal )
    );
    parity_calc P1
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

/*
always@( * )
begin
    case( mux_sel_internal )
        2'b00: TX_OUT = 1'b0;
        2'b01: TX_OUT = 1'b1;
        2'b10: TX_OUT = ser_data_internal;
        2'b11: TX_OUT = par_bit_internal;
    endcase
end
*/

endmodule 