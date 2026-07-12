`timescale 1ns/1ps

`include "arbiter.sv"
`include "arb_if.sv"
`include "arbiter_tb.sv"
`include "monitor.sv"


module arb_top;
//Declaring the parameter 
	parameter N = 4;
//Declaring the clk as it must be passed to the interface
	bit clk;
	
	always 
		begin
			clk = 0;
			#5;
			clk = 1;
			#5;
		end

//interface instantiation
arb_if #(  .N( N )  ) inter
(  .clk( clk )  ); 
//DUT instantiation
arbiter #(  .N( N )  ) arbit
(  .arb( inter.DUT )  );
//tb instantiation
arbiter_tb arbit_tb
(  .tb( inter.TB )  );
//monitor instantiation
monitor monn
(  .mon( inter.monitor )  );

endmodule