//////////////////////////////////////////////////////////////////////
//      THIS LAB WANT US TO MODIFY LAB 6 TO USE ENUM AND ALSO        //
//      ASKS FOR SOME NEW FUNCTIONS NOTHING MORE                     //
//////////////////////////////////////////////////////////////////////
//importing the enum_package as it will be needed in the stimulus
import enum_package ::*;

//writing the stimulus class 
class stimulus;
rand cmd_e cmd;
rand bit [ 7 : 0 ] payload [4];
bit clk;

//will modify the constrains to have a constraint for cmd
//and another constraint for payload 
constraint cmd_c
{
cmd dist {  CMD_READ := 3  ,  CMD_WRITE :=5  ,  CMD_RESET :=1  };
cmd inside {  CMD_READ  ,  CMD_WRITE  ,  CMD_RESET  };
}
constraint payload_c
{
    foreach(  payload[ i ]  )
        payload [ i ] inside {  [ 8'h10 : 8'h20 ]  };    
}


//writing the cmd_to_string function
function string cmd_to_string( cmd_e cm );
    case(cm)
        8'h00: return "CMD_NOP";
        8'h01: return "CMD_READ";
        8'h02: return "CMD_WRITE";
        default: return "UNKNOWN COMMAND";
    endcase

endfunction


//modifing the pre and post randomize functions
function void pre_randomize ();
$display("///////////////pre randomization values///////////////");
$display("the command is cmd=%0s",cmd_to_string( cmd ) );
foreach(payload[i])
    $display (" payload[%0d]=%0h",i,payload[i]);
endfunction

function void post_randomize ();
$display("///////////////post randomization values///////////////");
$display("the command is cmd=%0s",cmd_to_string( cmd ) );
foreach(payload[i])
    $display (" payload[%0d]=%0h",i,payload[i]);
endfunction

task drive (  ref logic [ 7 : 0 ] sig ); //modified the drive task to take only the sig not the sig+clk
//Driving the cmd
@(posedge clk)
    begin
         sig = cmd;
    end
//Driving the payload
  
        foreach( payload[ i ] )
            begin
                @(posedge clk)
                    begin
                        sig  = payload[ i ] ;
                        $display("the payload has been driven by the value payload[%0d]=%0d", i , payload[ i ] );
                    end
            end
 

endtask


endclass