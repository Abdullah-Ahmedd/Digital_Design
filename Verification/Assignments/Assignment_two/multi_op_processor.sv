module multi_op_processor
(
//Declaring inputs
    input logic [ 7 : 0 ] data_in ,
    input logic [ 1 : 0 ]  op_sel,

//Declaring outputs
    output logic [ 7 : 0 ] data_out
);
always@( * )
    begin
        case( op_sel )
				2'b00:
					begin
					data_out = data_in + 1 ;	//increment	
					end
				2'b01: data_out = data_in - 1; //decrement
				2'b10: data_out = ~data_in; //bitwise_not
				2'b11: data_out = data_in<<1;
				default: data_out = data_in;
		endcase
    end

endmodule
