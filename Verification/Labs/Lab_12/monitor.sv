//`include "arb_if.sv"
module monitor
(  arb_if.monitor mon  );

initial
	begin
		$monitor ("[%0t] req=%0b , grant=%0b"  , $time  , mon.cb.req , mon.cb.grant );
	end


endmodule