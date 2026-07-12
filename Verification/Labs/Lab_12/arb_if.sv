`timescale 1ns/1ps
interface arb_if #( parameter N = 4 )
(
input clk //clk must be input to all modports if this modport have it as its direction is defined here
);
//Declaring the signals in this interface bundle
	logic [ N - 1 : 0 ] req;
	logic [ N - 1 : 0 ] grant;
	bit rst;
 
 //Declaring the needed clocking block
	clocking cb @( posedge clk );
		default input #1step output #0;
		//input and output wrt to the tb
		//thats why req is output and grant is input
		input #1step output #3 req; //req is done input then output for monitor to be able to read it , it must be an input 
		input #4 grant;
	endclocking
 
 
 
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
	output req , rst,
// Declaring the clocking block 
	clocking cb
 );
 
 
 //Declaring a modport for monitor 
 modport monitor 
 (
 //Declaring inputs
	clocking cb //modified to have the clocking block passed to the monitor 
 //Declaring outputs
 );
 
 
 
 endinterface
 
 
 

