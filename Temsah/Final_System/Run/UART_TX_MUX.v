module UART_TX_MUX
(
input wire [1:0] mux_sel ,
input wire ser_data,
input wire par_bit,


output reg MUX_OUT

);

always@( * )
begin
    case( mux_sel )
        2'b00: MUX_OUT = 1'b0;
        2'b01: MUX_OUT = 1'b1;
        2'b10: MUX_OUT = ser_data;
        2'b11: MUX_OUT = par_bit;
    endcase
end


endmodule