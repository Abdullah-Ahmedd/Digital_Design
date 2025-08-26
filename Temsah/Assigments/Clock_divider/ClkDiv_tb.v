`include "ClkDiv.v"
`timescale 1ns/1ps //assuming the clock frequency is 100MHz
module ClkDiv_tb();
//Declaring the Clock period
    parameter Clock_period = 10;
//Declaring the testebench signals 
    reg i_ref_clk_tb;
    reg i_rst_n_tb;
    reg i_clk_en_tb;
    reg [ 7 : 0 ] i_div_ratio_tb;
    wire o_div_clk_tb;

//clock generation
always 
    begin
        i_ref_clk_tb = 0;
        #( Clock_period / 2.0 );
        i_ref_clk_tb = 1;
        #( Clock_period  / 2.0 );
    end

initial 
    begin
        $dumpfile("CLK_DIV.vcd");
        $dumpvars;

        initialization();
        reset();

        $display("Test case 1: trying to divide by (0) ");
            do_operation(1,0);
            #(Clock_period * 4 );
            reset();    
        
        $display("Test case 2: trying to divide by (1) ");
            do_operation(1,1);
            #(Clock_period * 6 );
            reset();

        $display("Test case 3: trying to divide by an even number (2) ");
            do_operation( 1 , 2);
            #(Clock_period * 6 * 2 );
            reset(); 
                       


        $display("Test case 4: trying to divide by an even number (8) ");
            do_operation(1,8);
            #(Clock_period * 6 * 8  );
            reset();               


        $display("Test case 5: trying to divide by an odd number number (7) ");
            do_operation(1,7);
            #(Clock_period * 6 * 7  );
            reset();   

        $display("Test case 6: trying to divide by an odd number number (9) ");
            do_operation(1,9);
            #(Clock_period * 6 * 9  );
            reset();  

    
        $finish;
    end


//tasks

task initialization();
    begin
     i_ref_clk_tb = 0;
    i_clk_en_tb= 1;
    i_div_ratio_tb = 0;       
    end
endtask

task reset();
    begin
        i_rst_n_tb = 0;
        #( Clock_period );
        i_rst_n_tb = 1;
        #( Clock_period );
    end
endtask

task do_operation( input clock_enable , input [ 7 : 0 ] division_ratio );
    begin
        i_clk_en_tb = clock_enable;
        i_div_ratio_tb = division_ratio;
    end
endtask

//Module instantiation
ClkDiv CD 
(
.i_ref_clk( i_ref_clk_tb ),
.i_rst_n( i_rst_n_tb ),
.i_clk_en( i_clk_en_tb ),
.i_div_ratio( i_div_ratio_tb ),
.o_div_clk( o_div_clk_tb )
);


endmodule