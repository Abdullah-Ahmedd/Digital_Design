class stimulus;
rand bit [ 7 : 0 ] cmd;
rand bit [ 7 : 0 ] payload [4];
bit clk;

constraint c
{
    cmd dist {'h01:=3 ,'h02:=5 , 'hff:=1};
        foreach(payload[i])
            payload[i] inside {[8'h10 : 8'h20]};
}


function void pre_randomize ();
$display("///////////////pre randomization values///////////////");
$display("the command is cmd=%0h",cmd);
foreach(payload[i])
    $display (" payload[%0d]=%0h",i,payload[i]);
endfunction

function void post_randomize ();
$display("///////////////post randomization values///////////////");
$display("the command is cmd=%0h",cmd);
foreach(payload[i])
    $display (" payload[%0d]=%0h",i,payload[i]);
endfunction

task drive (  ref logic [ 7 : 0 ] sig , ref bit c );
//Driving the cmd
@(posedge c)
    begin
         sig = cmd;
    end
//Driving the payload
  
        foreach( payload[ i ] )
            begin
                @(posedge c)
                    begin
                        sig  = payload[ i ] ;
                        $display("the payload has been driven by the value payload[%0d]=%0d", i , payload[ i ] );
                    end
            end
 

endtask


endclass