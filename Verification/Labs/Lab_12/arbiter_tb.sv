`timescale 1ns/1ps
//`include "arb_if.sv"
program arbiter_tb
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
			$display("//////////////////////////////////////Testcase 1: single request everytime//////////////////////////////////////");
			@( tb.cb ); tb.req = 4'b0001;
			@( tb.cb ); tb.req = 4'b0010;
			@( tb.cb ); tb.req = 4'b0100;
			@( tb.cb ); tb.req = 4'b1000;
			
		//Testcae 2: multiple request at the same time
		    $display("//////////////////////////////////////Testcae 2: multiple request at the same time//////////////////////////////////////");
			@( tb.cb ); tb.req = 4'b0011;
			@( tb.cb ); tb.req = 4'b0110;
			@( tb.cb ); tb.req = 4'b1100;
			@( tb.cb ); tb.req = 4'b1111;
			
		//Testcase 3: No requests
		    $display("//////////////////////////////////////Testcase 3: No requests//////////////////////////////////////");
			@( tb.cb ); tb.req = 4'b0000;
			
		//Testcase 4: Random requests
		$display("//////////////////////////////////////Testcase 4: Random request//////////////////////////////////////");
			repeat( 4 )
				begin
					@( tb.cb ); tb.req = $urandom_range( 0 , 15 );
				end
		$finish;
	end
	
endprogram