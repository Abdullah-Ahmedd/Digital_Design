`timescale 1ns/1ps 
`include "Up_Dn_Counter.v"
module Up_Dn_Counter_tb ();
//Declaring the testbench signals 
     reg [4:0] IN_tb;
     reg Load_tb;
     reg Up_tb;
     reg Down_tb;
     reg CLK_tb;

     wire High_tb;
     wire [4:0] Counter_tb;
     wire Low_tb;


// Design instantiation
Up_Dn_Counter DUT
(

    .IN(IN_tb),
    .Load(Load_tb),
    .Up(Up_tb),
    .Down(Down_tb),
    .CLK(CLK_tb),

    .High(High_tb),
    .Counter(Counter_tb),
    .Low(Low_tb)

);
//clock generation
always #5 CLK_tb=~CLK_tb; //assuming that the frequency of this block is 10Mhz (similar to Lab2)


//Initial block
initial 
    begin
        $dumpfile("Up_Dn_Counter.vcd");
        $dumpvars;
        IN_tb=5'b01010;
        Load_tb=1'b0;
        Up_tb=1'b0;
        Down_tb=1'b0;
        CLK_tb=1'b0;

        $display("Test case 1: "); //testing the latch function
        #10
        Load_tb=1'b1;
        #10
        if(Counter_tb==5'b01010)
            $display ("Test case 1 has passed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);
        else 
            $display ("Test case 1 has failed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);

        $display("Test case 2: "); //testing the latch priority (with Up=1)
        #10
         Load_tb=1'b1; Up_tb=1'b1;
         #10
        if(Counter_tb==5'b01010)
            $display ("Test case 2 has passed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);
        else 
            $display ("Test case 2 has failed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);

        $display("Test case 3: "); //testing the latch priority (with Down=1)
        #10
         Load_tb=1'b1; Down_tb=1'b1;
        #10
        if(Counter_tb==5'b01010)
            $display ("Test case 3 has passed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);
        else 
            $display ("Test case 3 has failed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);


        $display("Test case 4: "); //testing Up functionality
        #10
        Up_tb=1'b1;
        #10
        if(Counter_tb==5'b01011)
            $display ("Test case 4 has passed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);
        else 
            $display ("Test case 4 has failed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);

        $display("Test case 5: "); //testing Down priority
        #10
        Up_tb=1'b1; Down_tb=1'b1;
        #10
        if(Counter_tb==5'b01010)
            $display ("Test case 5 has passed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);
        else 
            $display ("Test case 5 has failed with counter value = 0x%0h at simulation time=%t",Counter_tb,$time);

        $display("Test case 6: "); //testing High flag
        #10
        Up_tb=1'b1;
        Load_tb=1'b1;
        IN_tb=5'b11111;
        #10
        if(Counter_tb==5'b11111)
            $display ("Test case 6 has passed with Low flag value = %0b at simulation time=%t",High_tb,$time);
        else 
            $display ("Test case 6 has failed with Low flag value = %0b at simulation time=%t",High_tb,$time);


        $display("Test case 7: "); //testing Low flag
        #10
        Up_tb=1'b1;
        Load_tb=1'b1;
        IN_tb=5'b00000;
        #10
        if(Counter_tb==5'b00000)
            $display ("Test case 7 has passed with High flag value = %0b at simulation time=%t",Low_tb,$time);
        else 
            $display ("Test case 7 has failed with High flag value = %0b at simulation time=%t",Low_tb,$time);

        $finish;

    end

endmodule 


