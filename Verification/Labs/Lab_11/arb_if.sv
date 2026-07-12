interface arb_if #( parameter N = 4 )
(
input clk //clk must be input to all modports if this modport have it as its direction is defined here
);
//Declaring the signals in this interface bundle
	logic [ N - 1 : 0 ] req;
	logic [ N - 1 : 0 ] grant;
	bit rst;
 
 //Declaring a modport for the DUT
 modport DUT
 (
 //Declaring inputs
	input req , clk , rst ,
 //Declaring outputs
	output grant
 );
 
  //Declaring a modport for the TB
 modport TB
 (
 //Declaring inputs
	input grant , clk,
 //Declaring outputs
	output req , rst
 );
 
 
 //Declaring a modport for monitor 
 modport monitor 
 (
 //Declaring inputs
	input req , grant //both are inputs as monitor module take both as an input to observe both of them 
 //Decalring outputs
 );
 
 
 
 endinterface
 
 
 

