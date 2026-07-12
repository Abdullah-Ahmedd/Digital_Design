`timescale 1ns/1ps
`include "arb_if.sv"
module arbiter_tb
(  arb_if.TB tb  );
//No need to declare the testbench variables here
//As the signals is written in arb_if.TB and the connections will be
//done at the top module 

initial
	begin
		//initialization
			tb.rst=0;
			#10;
			tb.rst=1;
			#10;
		//Testcase 1: single request everytime
			@( posedge tb.clk ); tb.req = 4'b0001;
			@( posedge tb.clk ); tb.req = 4'b0010;
			@( posedge tb.clk ); tb.req = 4'b0100;
			@( posedge tb.clk ); tb.req = 4'b1000;
			
		//Testcae 2: multiple request at the same time
			@( posedge tb.clk ); tb.req = 4'b0011;
			@( posedge tb.clk ); tb.req = 4'b0110;
			@( posedge tb.clk ); tb.req = 4'b1100;
			@( posedge tb.clk ); tb.req = 4'b1111;
			
		//Testcase 3: No requests
			@( posedge tb.clk ); tb.req = 4'b0000;
			
		//Testcase 4: Random requests
			repeat( 4 )
				begin
					@( posedge tb.clk ); tb.req = $urandom_range( 0, 15 );
				end
		$finish;
	end
	
endmodule