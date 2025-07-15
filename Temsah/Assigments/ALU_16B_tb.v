`timescale 1us/1ns
`include "ALU_16B.v"
module ALU_16B_tb();

//Declaring the testbench signals

    reg [15:0] A_tb;
    reg [15:0] B_tb;
    reg [3:0] ALU_FUN_tb;
    reg CLK_tb;

    wire [15:0] ALU_OUT_tb;
    wire Carry_Flag_tb;
    wire Arith_Flag_tb;
    wire Logic_Flag_tb;
    wire CMP_Flag_tb;
    wire Shift_Flag_tb;

//module instantiation 
ALU_16B DUT
(

    .A(A_tb),
    .B(B_tb),
    .ALU_FUN(ALU_FUN_tb),
    .CLK(CLK_tb),

    .ALU_OUT(ALU_OUT_tb),
    .Carry_Flag(Carry_Flag_tb),
    .Arith_Flag(Arith_Flag_tb),
    .Logic_Flag(Logic_Flag_tb),
    .CMP_Flag(CMP_Flag_tb),
    .Shift_Flag(Shift_Flag_tb)

);    

//Clock generation and initialization
always #5 CLK_tb=~CLK_tb;
initial CLK_tb=1'b0;



//Initial block
    initial 
        begin

            //Test case 1: ADD
            $display("Test case 1: Addition");
            #10
            A_tb=16'd6; B_tb=16'd7;  ALU_FUN_tb=4'b0000;
            #10
            if(ALU_OUT_tb==16'd13)
                begin
                    $display("The addition of %0d , %0d is %0d ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 1 has passed at time %0t",$time);

                end
            else
            $display("Test case 1 has failed at time %0t",$time);

            //Test case 2: SUB
            $display("Test case 2: Subtraction");
            #10
            A_tb=16'd15; B_tb=16'd4;  ALU_FUN_tb=4'b0001;
            #10
            if(ALU_OUT_tb==16'd11)
                begin
                    $display("The subtraction of %0d , %0d is %0d ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 2 has passed at time %0t",$time);

                end
            else
            $display("Test case 2 has failed at time %0t",$time);

            //Test case 3: MUL
            $display("Test case 3: Multiplication");
            #10
            A_tb=16'd4; B_tb=16'd3;  ALU_FUN_tb=4'b0010;
            #10
            if(ALU_OUT_tb==16'd12)
                begin
                    $display("The multiplication of %0d , %0d is %0d ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 3 has passed at time %0t",$time);

                end
            else
            $display("Test case 3 has failed at time %0t",$time);

            //Test case 4: DIV
            $display("Test case 4: Division");
            #10
            A_tb=16'd9; B_tb=16'd3;  ALU_FUN_tb=4'b0011;
            #10
            if(ALU_OUT_tb==16'd3)
                begin
                    $display("The division of %0d by %0d is %0d ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 4 has passed at time %0t",$time);

                end
            else
            $display("Test case 4 has failed at time %0t",$time);

            //Test case 5:AND
            $display("Test case 5: AND");
            #10
            A_tb=16'haaaa; B_tb=16'h5555;  ALU_FUN_tb=4'b0100;
            #10
            if(ALU_OUT_tb==16'd0)
                begin
                    $display("The AND of %0h , %0h is %0h ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 5 has passed at time %0t",$time);

                end
            else
            $display("Test case 5 has failed at time %0t",$time);

            //Test case 6:OR
            $display("Test case 6: OR");
            #10
            A_tb=16'haaaa; B_tb=16'h5555;  ALU_FUN_tb=4'b0101;
            #10
            if(ALU_OUT_tb==16'hffff)
                begin
                    $display("The OR of %0h , %0h is %0h ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 6 has passed at time %0t",$time);

                end
            else
            $display("Test case 6 has failed at time %0t",$time);

            //Test case 7:NAND
            $display("Test case 7: NAND");
            #10
            A_tb=16'haaaa; B_tb=16'h5555;  ALU_FUN_tb=4'b0110;
            #10
            if(ALU_OUT_tb==16'hffff)
                begin
                    $display("The NAND of %0h , %0h is %0h ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 7 has passed at time %0t",$time);

                end
            else
            $display("Test case 7 has failed at time %0t",$time);

            //Test case 8:NOR
            $display("Test case 8: NOR");
            #10
            A_tb=16'haaaa; B_tb=16'h5555;  ALU_FUN_tb=4'b0111;
            #10
            if(ALU_OUT_tb==16'h0)
                begin
                    $display("The NOR of %0h , %0h is %0h ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 8 has passed at time %0t",$time);

                end
            else
            $display("Test case 8 has failed at time %0t",$time);

            //Test case 9:XOR
            $display("Test case 9: XOR");
            #10
            A_tb=16'haaaa; B_tb=16'h5555;  ALU_FUN_tb=4'b1000;
            #10
            if(ALU_OUT_tb==16'hffff)
                begin
                    $display("The XOR of %0h , %0h is %0h ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 9 has passed at time %0t",$time);

                end
            else
            $display("Test case 9 has failed at time %0t",$time);

            //Test case 10:XNOR
            $display("Test case 10: XNOR");
            #10
            A_tb=16'haaaa; B_tb=16'h5555;  ALU_FUN_tb=4'b1001;
            #10
            if(ALU_OUT_tb==16'h0)
                begin
                    $display("The XNOR of %0h , %0h is %0h ", A_tb, B_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 10 has passed at time %0t",$time);

                end
            else
            $display("Test case 10 has failed at time %0t",$time);

            //Test case 11:CMPEQ
            $display("Test case 11: Compare if A and B are equal");
            #10
            A_tb=16'haaaa; B_tb=16'haaaa;  ALU_FUN_tb=4'b1010;
            #10
            if(ALU_OUT_tb==16'd1)
                begin
                    $display(" A=%0d , B=%0d ,so they are equal", A_tb, B_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 11 has passed at time %0t",$time);

                end
            else
            $display("Test case 11 has failed at time %0t",$time);

            //Test case 12:CMPG
            $display("Test case 12: Compare if A is greater than B");
            #10
            A_tb=16'hf; B_tb=16'ha;  ALU_FUN_tb=4'b1011;
            #10
            if(ALU_OUT_tb==16'd2)
                begin
                    $display(" A=%0d , B=%0d so A>B  ", A_tb, B_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 12 has passed at time %0t",$time);

                end
            else
            $display("Test case 12 has failed at time %0t",$time);

            //Test case 13:CMPL
            $display("Test case 13: Compare if A is less than B ");
            #10
            A_tb=16'ha; B_tb=16'hf;  ALU_FUN_tb=4'b1100;
            #10
            if(ALU_OUT_tb==16'd3)
                begin
                    $display(" A=%0d , B=%0d so A<B", A_tb, B_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 13 has passed at time %0t",$time);

                end
            else
            $display("Test case 13 has failed at time %0t",$time); 

            //Test case 14:SHR
            $display("Test case 14: Shift right A by one bit");
            #10
            A_tb=16'd14; ALU_FUN_tb=4'b1101;
            #10
            if(ALU_OUT_tb==16'd7)
                begin
                    $display(" A=%0b and after being shifted it will be %0b ", A_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 14 has passed at time %0t",$time);

                end
            else
            $display("Test case 14 has failed at time %0t",$time);

            //Test case 15:SHL
            $display("Test case 15: Shift Left A by one bit");
            #10
            A_tb=16'd6; ALU_FUN_tb=4'b1110;
            #10
            if(ALU_OUT_tb==16'd12)
                begin
                    $display(" A=%0b and after being shifted it will be %0b ", A_tb, ALU_OUT_tb);
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 15 has passed at time %0t",$time);

                end
            else
            $display("Test case 15 has failed at time %0t",$time);

            //Test case 16:Division by zero 
            $display("Test case 16: Dividing a number by zero");
            #10
            A_tb=16'd14;B_tb=16'd0;  ALU_FUN_tb=4'b0011;
            #10
            if(ALU_OUT_tb==16'd0)
                begin
                    $display("Dividing a number with zero is handeled making it result in a zero");
                    $display("Carry_Flag=%b , Arith_Flag=%b ,Logic_Flag=%b ,CMP_Flag=%b ,Shift_Flag=%b", Carry_Flag_tb, Arith_Flag_tb ,Logic_Flag_tb ,CMP_Flag_tb ,Shift_Flag_tb );
                    $display("Test case 16 has passed at time %0t",$time);

                end
            else
            $display("Test case 16 has failed at time %0t",$time);                

        $finish;


        end


endmodule

