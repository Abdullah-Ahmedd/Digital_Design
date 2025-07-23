/*
NOTE:
The clock used in this testbench has a non-uniform duty cycle (60% high, 40% low).
Therefore, instead of using fixed # delays , @(negedge CLK_tb) is used, i did this to
avoid timing mismatches and ensure that the testbench is performing precisely 
*/
`timescale 1us/1ns
`include "ALU_TOP.v"
module ALU_TOP_tb();

parameter Width= 'd16 ;

//Declaring the testbench signals

    reg  signed [ Width-1 : 0 ] A_tb;
    reg signed [ Width-1 : 0 ] B_tb;
    reg  [ 3 : 0 ] ALU_FUN_tb;
    reg  CLK_tb;
    reg RST_tb;

     wire signed [ (2*Width)-1 : 0 ] Arith_OUT_tb;
     wire [ Width-1 : 0 ] Logic_OUT_tb;
     wire [ Width-1 : 0 ] Shift_OUT_tb;
     wire [ Width-1 : 0 ] CMP_OUT_tb;

     wire Arith_Flag_tb;
     wire Logic_Flag_tb;
     wire Shift_Flag_tb;
     wire CMP_Flag_tb;

//Top_module instantiation 
ALU_TOP #( .Width( Width ) ) DUT
(
.A( A_tb ) ,
.B( B_tb ),
.ALU_FUN( ALU_FUN_tb ),
.CLK( CLK_tb ),
.RST( RST_tb ),  
.Arith_OUT( Arith_OUT_tb ),
.Logic_OUT( Logic_OUT_tb ),
.Shift_OUT( Shift_OUT_tb ),
.CMP_OUT( CMP_OUT_tb ),
.Arith_Flag( Arith_Flag_tb ),
.Logic_Flag( Logic_Flag_tb ),
.Shift_Flag ( Shift_Flag_tb ),
.CMP_Flag( CMP_Flag_tb )
);

always 
    begin
        CLK_tb=1; #6;
        CLK_tb=0; #4;
    end 

initial 
    begin
        $dumpfile("ALU_TOP.vcd");
        $dumpvars;
        
        RST_tb=1'b0;
        @( negedge CLK_tb )
        RST_tb=1'b1;
        @( negedge CLK_tb )

        //Test case 1: Arithmatic addition ( A is negative and B is negative )
        $display("Test case 1 :");
        @( negedge CLK_tb )

        A_tb=-'d8; B_tb=-'d3; ALU_FUN_tb=4'b0000; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == -'d11 )
            begin
                    $display("The addition of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 1 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 1 has failed at time %0t",$time);
               

        //Test case 2: Arithmatic addition ( A is positive and B is negative )
        $display("Test case 2 :");
        @( negedge CLK_tb )
        A_tb='d8; B_tb=-'d3; ALU_FUN_tb=4'b0000; RST_tb=1'b1;
        @( negedge CLK_tb )
        if( Arith_OUT_tb == 'd5 )
            begin
                    $display("The addition of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 2 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 2 has failed at time %0t",$time);
            
        //Test case 3: Arithmatic addition ( A is negative and B is positive )
        $display("Test case 3 :");
        @( negedge CLK_tb )
        A_tb=-'d8; B_tb='d3; ALU_FUN_tb=4'b0000; RST_tb=1'b1;
        @( negedge CLK_tb )
        if( Arith_OUT_tb == -'d5 )
            begin
                    $display("The addition of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 3 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 3 has failed at time %0t",$time);

        //Test case 4: Arithmatic addition ( A is positive and B is positive )
        $display("Test case 4 :");
        @( negedge CLK_tb )
        A_tb='d8; B_tb='d3; ALU_FUN_tb=4'b0000; RST_tb=1'b1;
        @( negedge CLK_tb )
        if( Arith_OUT_tb == 'd11 )
            begin
                    $display("The addition of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 4 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 4 has failed at time %0t",$time);            

        //Test case 5: Arithmatic subtraction ( A is negative and B is negative )
        $display("Test case 5 :");
        @( negedge CLK_tb )
        A_tb=-'d8; B_tb=-'d3; ALU_FUN_tb=4'b0001; RST_tb=1'b1;
        @( negedge CLK_tb )
        if( Arith_OUT_tb == -'d5 )
            begin
                    $display("The subtraction of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 5 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 5 has failed at time %0t",$time);

        //Test case 6: Arithmatic subtraction ( A is positive and B is negative )
        $display("Test case 6 :");
        @( negedge CLK_tb )
        A_tb='d8; B_tb=-'d3; ALU_FUN_tb=4'b0001; RST_tb=1'b1;
        @( negedge CLK_tb )
        if( Arith_OUT_tb == 'd11 )
            begin
                    $display("The subtraction of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 6 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 6 has failed at time %0t",$time);

        //Test case 7: Arithmatic subtraction ( A is negative and B is positive )
        $display("Test case 7 :");
        @( negedge CLK_tb )
        A_tb=-'d8; B_tb='d3; ALU_FUN_tb=4'b0001; RST_tb=1'b1;
        @( negedge CLK_tb )
        if( Arith_OUT_tb == -'d11 )
            begin
                    $display("The subtraction of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 7 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 7 has failed at time %0t",$time);

        //Test case 8: Arithmatic subtraction ( A is positvie and B is positive )
        $display("Test case 8 :");
        @( negedge CLK_tb )
        A_tb='d8; B_tb='d3; ALU_FUN_tb=4'b0001; RST_tb=1'b1;
        @( negedge CLK_tb )
        if( Arith_OUT_tb == 'd5 )
            begin
                    $display("The subtraction of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 8 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 8 has failed at time %0t",$time);

        //Test case 9: Arithmatic Multiplication ( A is negative and B is negative )
        $display("Test case 9 :");
        @( negedge CLK_tb )

        A_tb=-'d8; B_tb=-'d3; ALU_FUN_tb=4'b0010; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == 'd24 )
            begin
                    $display("The Multiplication of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 9 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 9 has failed at time %0t",$time);

        //Test case 10: Arithmatic Multiplication ( A is positive and B is negative )
        $display("Test case 10 :");
        @( negedge CLK_tb )

        A_tb='d8; B_tb=-'d3; ALU_FUN_tb=4'b0010; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == -'d24 )
            begin
                    $display("The Multiplication of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 10 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 10 has failed at time %0t",$time);
               
        //Test case 11: Arithmatic Multiplication ( A is negative and B is positive )
        $display("Test case 11 :");
        @( negedge CLK_tb )

        A_tb=-'d8; B_tb='d3; ALU_FUN_tb=4'b0010; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == -'d24 )
            begin
                    $display("The Multiplication of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 11 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 11 has failed at time %0t",$time);

        //Test case 12: Arithmatic Multiplication ( A is positive and B is positive )
        $display("Test case 12 :");
        @( negedge CLK_tb )

        A_tb='d8; B_tb='d3; ALU_FUN_tb=4'b0010; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == 'd24 )
            begin
                    $display("The Multiplication of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 12 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 12 has failed at time %0t",$time);

        //Test case 13: Arithmatic Divison ( A is negative and B is negative )
        $display("Test case 13 :");
        @( negedge CLK_tb )

        A_tb=-'d9; B_tb=-'d3; ALU_FUN_tb=4'b0011; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == 'd3 )
            begin
                    $display("The Division of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 13 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 13 has failed at time %0t",$time);

        //Test case 14: Arithmatic Divison ( A is positive and B is negative )
        $display("Test case 14 :");
        @( negedge CLK_tb )

        A_tb='d9; B_tb=-'d3; ALU_FUN_tb=4'b0011; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == -'d3 )
            begin
                    $display("The Division of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 14 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 14 has failed at time %0t",$time);

        //Test case 15: Arithmatic Divison ( A is negative and B is positive )
        $display("Test case 15 :");
        @( negedge CLK_tb )

        A_tb=-'d9; B_tb='d3; ALU_FUN_tb=4'b0011; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == -'d3 )
            begin
                    $display("The Division of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 15 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 15 has failed at time %0t",$time);

        //Test case 16: Arithmatic Divison ( A is positive and B is positive )
        $display("Test case 16 :");
        @( negedge CLK_tb )

        A_tb='d9; B_tb='d3; ALU_FUN_tb=4'b0011; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == 'd3 )
            begin
                    $display("The Division of %0d , %0d is %0d ", A_tb, B_tb, Arith_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 16 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 16 has failed at time %0t",$time);

        //Test case 17: Logic operations ( A AND B )
        $display("Test case 17 :");
        @( negedge CLK_tb )

        A_tb='haaaa; B_tb='hcccc; ALU_FUN_tb=4'b0100; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Logic_OUT_tb == 'h8888 )
            begin
                    $display("The ANDing of 0b%0b , 0b%0b is 0b%0b ", A_tb, B_tb, Logic_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 17 has passed at time %0t",$time );                                 
            end
        else 
            $display("Test case 17 has failed at time %0t",$time);

        //Test case 18: Logic operations ( A OR B )
        $display("Test case 18 :");
        @( negedge CLK_tb )

        A_tb='haaaa; B_tb='hcccc; ALU_FUN_tb=4'b0101; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Logic_OUT_tb == 'heeee )
            begin
                    $display("The ORing of 0b%0b , 0b%0b is 0b%0b ", A_tb, B_tb, Logic_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 18 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 18 has failed at time %0t",$time);

        //Test case 19: Logic operations ( A NAND B )
        $display("Test case 19 :");
        @( negedge CLK_tb )

        A_tb='haaaa; B_tb='hcccc; ALU_FUN_tb=4'b0110; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Logic_OUT_tb == 'h7777 )
            begin
                    $display("The NANDing of 0b%0b , 0b%0b is 0b%0b ", A_tb, B_tb, Logic_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 19 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 19 has failed at time %0t",$time);  

       //Test case 20: Logic operations ( A NOR B )
        $display("Test case 20 :");
        @(negedge CLK_tb)

        A_tb='haaaa; B_tb='hcccc; ALU_FUN_tb=4'b0111; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Logic_OUT_tb == 'h1111 )
            begin
                    $display("The NORing of 0b%0b , 0b%0b is 0b%0b ", A_tb, B_tb, Logic_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 20 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 20 has failed at time %0t",$time);  

       //Test case 21: Compare operations ( A = B )
        $display("Test case 21 :");
        @( negedge CLK_tb )

        A_tb='d3; B_tb='d3; ALU_FUN_tb=4'b1001; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( CMP_OUT_tb == 'd1 )
            begin
                    $display("Comparing( A == B ) : A= %0d ,B= %0d , CMP_OUT= %0d ", A_tb, B_tb, CMP_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 21 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 21 has failed at time %0t",$time);  

       //Test case 22: Compare operations ( A > B )
        $display("Test case 22 :");
        @( negedge CLK_tb )

        A_tb='d6; B_tb='d3; ALU_FUN_tb=4'b1010; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( CMP_OUT_tb == 'd2 )
            begin
                    $display("Comparing( A > B ) : A= %0d ,B= %0d , CMP_OUT= %0d ", A_tb, B_tb, CMP_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 22 has passed at time %0t",$time );              
            end
        else 
            $display("Test case 22 has failed at time %0t",$time);  

       //Test case 23: Compare operations ( A < B )
        $display("Test case 23 :");
        @( negedge CLK_tb )

        A_tb='d3; B_tb='d6; ALU_FUN_tb=4'b1011; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( CMP_OUT_tb == 'd3 )
            begin
                    $display("Comparing( A < B ) : A= %0d ,B= %0d , CMP_OUT= %0d ", A_tb, B_tb, CMP_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 23 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 23 has failed at time %0t",$time);  

       //Test case 24: Shift operations ( Logic shift A right by one bit )
        $display("Test case 24 :");
        @( negedge CLK_tb )

        A_tb='d6; B_tb='d6; ALU_FUN_tb=4'b1100; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Shift_OUT_tb == 'd3 )
            begin
                    $display("Shift( A >> 1 ) : A= %0d is  %0d ", A_tb, Shift_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 24 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 24 has failed at time %0t",$time);  

      //Test case 25: Shift operations ( Logic shift A Left by one bit )
        $display("Test case 25 :");
        @( negedge CLK_tb )

        A_tb='d6; B_tb='d6; ALU_FUN_tb=4'b1101; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Shift_OUT_tb == 'd12 )
            begin
                    $display("Shift( A << 1 ) : A= %0d is  %0d ", A_tb, Shift_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 25 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 25 has failed at time %0t",$time);  

      //Test case 26: Shift operations ( Logic shift B rigt by one bit )
        $display("Test case 26 :");
        @( negedge CLK_tb )

        A_tb='d6; B_tb='d8; ALU_FUN_tb=4'b1110; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Shift_OUT_tb == 'd4 )
            begin
                    $display("Shift( B >> 1 ) : B= %0d is  %0d ", B_tb, Shift_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 26 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 26 has failed at time %0t",$time);  

      //Test case 27: Shift operations ( Logic shift B rigt by one bit )
        $display("Test case 27 :");
        @( negedge CLK_tb )

        A_tb='d6; B_tb='d8; ALU_FUN_tb=4'b1111; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Shift_OUT_tb == 'd16 )
            begin
                    $display("Shift( B << 1 ) : B= %0d is  %0d ", B_tb, Shift_OUT_tb );
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 27 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 27 has failed at time %0t",$time); 


      //Test case 28: No operation  
        $display("Test case 28 :");
        @( negedge CLK_tb )

        A_tb='d6; B_tb='d8; ALU_FUN_tb=4'b1000; RST_tb=1'b1;

        @( negedge CLK_tb )
        
        if( Arith_OUT_tb == 0  &&  Logic_OUT_tb == 0  &&  CMP_OUT_tb == 0  &&  Shift_OUT_tb == 0  )
            begin
                    $display("Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 28 has passed at time %0t",$time );                
            end
        else 
            $display("Test case 28 has failed at time %0t",$time); 


        $finish;    
    end



endmodule