//`include "arb_if.sv"
module arbiter #( parameter N = 4 ) 
(
arb_if.DUT arb 
);

//Declaring a pointer to be look the starting point (where the arbiter should look for the next winner) 
//if ptr=1 , this means start looking from request 1
//will use clog2 as if we have 4 requests we will need only 2 bits
logic [ $clog2( N ) - 1 : 0 ] ptr;
 
//Declaring index which is the index of the current request being checked
//will use int for the index
int index;

always@(  posedge arb.clk  or  negedge arb.rst   )
	begin
			if(  !arb.rst  )
				begin
					ptr <= 0;
					index <= 0;
					arb.grant <= 0;
				end
				
			else
				begin
					arb.grant <= 0; // this mean no one gets access this cycle which is the default value untill we find our grant this cycle
					for( int i = 0  ;  i < N  ;  i++  ) //i start at 0 not 1 as requests start from req 0,1,2,.....
						begin
						
							index = ( ptr + i )%N;
							if(  arb.req[ index ]  )
								begin
									arb.grant[ index ] <= 1; //we give the grant to the first request we find with value 1(asking for a grant)
									ptr <= ( index + 1 )% N; //we increment the pointer to be ready for the next cylce 
									break;
								end
								
						end
					
				end
	end





endmodule