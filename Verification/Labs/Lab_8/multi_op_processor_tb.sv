`timescale 1ns/1ps
`include "Coverage_test.sv"
`include "multi_op_processor.sv"
module multi_op_processor_tb;
//Declaring the testbench variables
		logic clk;
		logic rst; 
		logic [ 3 : 0 ] op_code; 
		logic [ 7 : 0 ] data_in; 

		logic [ 7 : 0 ] data_out;
		logic illegal_op  ;
		
//Declaring the coverage class
		Coverage_test CT;

//Module instantiations
multi_op_processor DUT
(.*);		

//clock generation
always
	begin
		clk = 0;
		#5;
		clk = 1;
		#5;
	end

//initial block
initial
	begin 
	 //Constructing the class
	 CT = new();
	 //resetting before we start
	 rst = 0;
	 #10;
	 rst = 1;
			do
				begin
					@(negedge clk);
					assert( CT.randomize() ) else $error ("something is not working correclty");
						//driving the inputs of our design 
						op_code = CT.op_code;
						data_in = CT.data_in;
						CT.cg.sample();
				 
				end while (CT.cg.get_coverage() <= 90 );
		$finish;
	end
	
	
	
endmodule 	