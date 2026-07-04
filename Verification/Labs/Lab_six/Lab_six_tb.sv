`include "stimulus.sv"
`include "Lab_six.sv"
`timescale 1ns/1ns
module Lab_six_tb;

//Declaring the tb variabless
    bit clk;
    bit rst;
    logic [ 7 :0 ] data_in ;
    logic [ 7 : 0 ] data_out;
//instatiating the module
    Lab_six L6
    (.*);

stimulus stim;

always #10 clk=~clk;


initial 
begin
    stim=new();
    clk=0;
    rst=0;
    #30;
    rst=1;
    repeat(5)
        begin
            assert(stim.randomize())
            else $error("something is not working correctly");
            stim.drive(data_in,clk);
        end

        $finish;

end




endmodule