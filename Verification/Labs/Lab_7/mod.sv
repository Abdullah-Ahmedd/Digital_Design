module mod
(
//Declaring inputs
    input bit clk,
    input bit rst,
    input logic [ 7 :0 ] data_in ,
//Declaring output
    output logic [ 7 : 0 ] data_out
);

always@(posedge clk or negedge rst)
    begin
        if(!rst)
            data_out <= 8'b0;

        else
            begin
                data_out <= data_in;
            end

    end

endmodule 