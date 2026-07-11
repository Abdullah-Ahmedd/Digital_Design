`include "adder.sv"
module Lab_four();

     logic [ 7 : 0 ]   a;
     logic [ 7 : 0 ]   b;

    logic [ 15 : 0 ] c;

adder uut 
(.*);


initial 
begin
    for(int i=0;i<9;i++)
        begin
    send_and_check();
        end
        $finish;

end


function logic [ 15 : 0 ] expected_sum (  input logic [ 7 : 0 ]   a_fun, input logic [ 7 : 0 ]   b_fun  );
    begin
        return  a_fun + b_fun; 
    end
endfunction

task automatic send_and_check ( ); //creates a random testcase and checks                  //task must be automatic to make sure the value 
                                                                                          //of each run doesnt effect the other one
logic [ 15 : 0 ] expected;         //if the test is satisfied or no
begin
    a = $urandom ();
    b = $urandom ();
    #1; // A MUST TO WAIT FOR THE VALUES TO BE UPDATED

 
 expected= expected_sum( a , b );
 if( c !== expected )
 $error("The two operands are %0d %0d and the expected result was %0d however it was %0d", a , b ,expected , c);
 else
 begin
 $display("/////////////////testcase passed successfully/////////////////");
 $display("%0d + %0d = %0d", a , b ,c);
 end

end
endtask


endmodule 