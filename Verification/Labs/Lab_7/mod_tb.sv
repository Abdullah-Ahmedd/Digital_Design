`include "stimulus.sv"
`include "mod.sv"
module mod_tb;
//Declaring the testbench variables
    bit clk;
    bit rst;
    logic [ 7 :0 ] data_in ;

    logic [ 7 : 0 ] data_out;

//Module instantiation
    mod m 
    (.*);

//generating the stimulus instance
    stimulus stim;    

//clock generation 
initial
    begin
        forever
            begin
                 #10 clk=~clk;          
                stim.clk=clk; 
            end
    end

//now generating the testcases
initial
    begin
        stim = new();
        rst=0;
        #10;
        rst=1;
        repeat(5)
            begin
                assert (stim.randomize())
                else $error("something is wrong");
                stim.drive( data_in );
            end
        $finish;
    end




endmodule