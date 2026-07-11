module multi_op_processor
(
//Declaring inputs
    input logic clk,
    input logic rst, //active-low asynchronous reset
    input logic [ 3 : 0 ] op_code,
    input logic [ 7 : 0 ] data_in,

//Declaring output
    output logic [ 7 : 0 ] data_out,
    output logic illegal_op  //a flag that is rasied when there is an illegal op code 
);

//Declaring internal variables 
logic [ 7 : 0 ] mem; //memory used for load/store
logic [ 7 : 0 ] acc; //accumulator used as the second operand of the processor

always@(  posedge clk  or  negedge rst  )
    begin
        if(  !rst  )
			begin
				data_out <= 0;
				illegal_op <= 0;
				mem <= 0;
				acc <= 0;
				
			end
		else
			begin
				//default value
					illegal_op <= 0;			
				case( op_code )
				4'd1: //loading into the memory and outputting this value
					begin
						mem <= data_in;
						data_out <= mem;   
						
					end
				4'd2:  //store 
					begin
						  acc <= mem;
						  data_out <= mem;
					end
				4'd4: //add
					begin
						acc <= acc + data_in;
						data_out <= data_in + acc;		
					end
				4'd5: //sub
					begin
						acc <= acc - data_in;
						data_out <= acc - data_in;		
					end
				4'd6: //AND
					begin
						acc <= acc & data_in;
						data_out <= data_in & acc;		
					end				
				4'd0: data_out <= 0; //NOP
				4'd3: data_out <= ~data_in; //NOT
				4'd7: data_out <= data_in <<1; //SHL
				4'd8: data_out <= data_in>>1; //SHR
				4'd9: data_out<=0;//Reserved
				4'd10:data_out<=0;//Reserved
				4'd11:data_out<=0;//Reserved
				4'd12:data_out<=0;//Reserved
				4'd13: data_out<=data_in;//nothing in=out
				4'd14:data_out<=data_in;//nothing in=out
				4'd15://illegal
					begin
						illegal_op <= 1'b1;
						data_out <=8'hff;
					end
				endcase
			end
    end


endmodule