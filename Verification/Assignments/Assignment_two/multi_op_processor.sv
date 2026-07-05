module multi_op_processor
(
//Declaring inputs
    input logic [ 7 : 0 ] data_in ,
    input logic [ 1 : 0 ] op_sel,

//Declaring outputs
    output logic [ 7 : 0 ] data_out
);

//Trying enums 
typedef enum 
{
increment,
decrement,
bitwise_not,
left_shift
}op_code;

always@( * )
    begin
        case( op_sel )
				increment:
					begin
					data_out = data_in + 1 ;	//increment	
					end
				decrement: data_out = data_in - 1; //decrement
				bitwise_not: data_out = ~data_in; //bitwise_not
				left_shift: data_out = data_in<<1;
				default: data_out = data_in;
		endcase
    end

endmodule