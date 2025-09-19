//Assuming that the frequency is 100KHz
`timescale 1us/1ns
`include "Register_file.v "
module Register_file_tb();

//Declaring the testbench signals

    reg [ 15 : 0 ] WrData_tb;
    reg [ 2 : 0 ] Address_tb;
    reg WrEn_tb;
    reg RdEn_tb;
    reg CLK_tb;
    reg RST_tb;

    wire [ 15 : 0 ] RdData_tb;

Register_file DUT
(  
.WrData( WrData_tb ),
.Address( Address_tb ),
.WrEn( WrEn_tb ),
.RdEn( RdEn_tb ),
.CLK( CLK_tb ),
.RST( RST_tb ),
.RdData( RdData_tb )
);

always #5 CLK_tb = ~CLK_tb;
initial CLK_tb= 1'b0;

initial
begin 

$dumpfile("Register_file.vcd");
$dumpvars;
RST_tb=1'b0;
#10
RST_tb=1'b1;
#10

$display("Test case 1: Writing on register[ 0 ] "); //storing a value 
#10
WrData_tb=16'habcd  ;Address_tb=3'b000;  WrEn_tb=1'b1;  RdEn_tb=1'b0;
#10
if( RdData_tb == 16'b0 ) // Value cannot be read because RdEn is low meaning that the read operation is disabled 
    $display("Test case 1 has passed at time %0t", $time );
else
    $display("Test case 1 has failed at time %0t",$time);

$display("Test case 2: Reading from register[ 0 ] "); //checking if the value stored about is stored correclty
#10 
WrEn_tb=1'b0;  RdEn_tb=1'b1;  Address_tb=3'b000;
#10
if( RdData_tb == 16'habcd )
    $display("Test case 2 has passed at time %0t", $time );
else
    $display("Test case 2 has failed at time %0t",$time);

$display("Test case 3: Reading from register[ 5 ] "); //checking if the register file store the values in the intended register 
#10
WrEn_tb=1'b0;  RdEn_tb=1'b1;  Address_tb=3'b101;
#10
if( RdData_tb == 16'b0 )
    $display("Test case 3 has passed at time %0t", $time );
else
    $display("Test case 3 has failed at time %0t",$time);

$display("Test case 4: Testing the Reset ");
#10
Address_tb=3'b000;  WrEn_tb=1'b0;  RdEn_tb=1'b1;
#10
$display("The value of Register[ 0 ] before resetting is 0x%0h",RdData_tb);
#10
RST_tb=1'b0;
#10
if( RdData_tb == 16'b0 )
begin
    $display("The value of Register[ 0 ] after resetting is 0x%0h", RdData_tb );    
    $display("Test case 4 has passed at time %0t", $time );
end
else
    $display("Test case 4 has failed at time %0t",$time);

$finish;

end

endmodule    
