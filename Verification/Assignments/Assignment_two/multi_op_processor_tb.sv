`include "multi_op_processor.sv"
`timescale 1ns/1ns
module multi_op_processor_tb;

//Declaring the testbench variabeles
     logic [ 7 : 0 ] data_in ;
     logic [ 1 : 0 ] op_sel;

     logic [ 7 : 0 ] data_out;
	 
//module instantiation
 multi_op_processor mop
	(.*);
	
//Declaring the dynamic array 
    typedef struct
    {
         logic [ 7 : 0 ] data_in ;
         logic [ 1 : 0 ] op_sel;
    }stim;

    stim dyn_arr [];

//Declaring the queue to store the actuall output values
    logic [ 7 : 0 ] data_q [ $ ];

//Declaring the assocciative array to store the expected value
    logic [ 7 : 0 ] expected [ int ];   



///////////////////////////////FUNCTIONS AND TASKS///////////////////////////////
//configure_stim_storage : it just sets the size of the stimulus (how much tests we are doing)
    function void configure_stim_storage (input int size);
            dyn_arr = new[ size ];
            data_q.delete();
            expected.delete();
            $display("the stimulus has been configured to %0d locations", size);
    endfunction

//generate_stimulus : it just generates the stimulus using the urandom function
task automatic generate_stimulus (ref stim dynamic [] );
            foreach(  dynamic[ i ]  )
                begin
                    dynamic[ i ].data_in = $urandom_range(0,255);
                    dynamic[ i ].op_sel = $urandom_range (0,3);
                end
            $display("the stimulus have been generated with size %0d", dynamic.size());
endtask
 
//drive_stim :it takes the stimulus generated in the stim struct and send it to the actual tb variables
task drive_stim();
            foreach(  dyn_arr[ i ]  )
                begin
                    data_in = dyn_arr[ i ].data_in;
                    op_sel = dyn_arr[ i ].op_sel;
                    #1; //waiting 1ns for the stimulus to propgate and for the output to be ready
                    //now we will store the output of this stimulus
                    collect_output_data( data_out );

                end    
endtask

//golden_model :this task just calculates the expected value of the generated stimulus
task automatic golden_model (ref logic [ 7 : 0 ] aarr [ int ] );

    foreach(  dyn_arr[ i ]  )
        begin
            case(dyn_arr[i].op_sel)
                2'b00:   aarr[ i ] = dyn_arr[ i ].data_in + 1;
                2'b01:   aarr[ i ] = dyn_arr[ i ].data_in - 1;
                2'b10:   aarr[ i ] = ~dyn_arr[ i ].data_in ;
                2'b11:   aarr[ i ] = dyn_arr[ i ].data_in << 1;
                default: aarr[ i ] = dyn_arr[ i ].data_in;
            endcase
            $display("the expected result for the generated stimulus is %0d", aarr[ i ]);
        end
        
endtask

//collect_output_data : it calculates the output of the design and store it in the data queue
task automatic collect_output_data (input logic [ 7 : 0 ] temp);
    data_q.push_back(temp);
endtask

//check_results
task automatic check_results( const ref logic [ 7 : 0 ] ex [ int ] , const ref logic [ 7 : 0 ] acc [ $ ] );
    int pass_count = 0 ;
    int  fail_count = 0;
    if(ex.size() != acc.size() )
        begin
            $display("there is a mismatch, the size of the expected array and the actuall array dont match");
            $error("expected array (assosciative array) size :%0d , actual array (queue) size :%0d",ex.size(),acc.size());
        end
    else 
        begin
            foreach(  ex[ i ]  )
                begin
                    if(  ex[ i ]  ==  acc[ i ]  )
                        begin
                            pass_count++;
                            $display("test number : %0d passed successfully", i);
                        end
                    else
                    begin
                            fail_count++;
                            $display("test number : %0d failed---------------->", i);
                    end    
                end
$display("//////////////////////////////////////TEST SUMMARY://////////////////////////////////////");
$display("the number of passed tests :%0d----------- the number of failed tests : %0d",pass_count,fail_count);
        end
endtask

//reconfigure_stim: just randomize the order of the dynamic array
task automatic reconfigure_stim(ref stim dyna []);
    dyna.shuffle ();
    $display("the dynamic array has been shuffled sucessfully");        
endtask


initial
    begin
        ///////////////////////////// RUN1//////////////////////////////////
        $display ("///////////////////////////// RUN1:configure 100 runs//////////////////////////////////");
        configure_stim_storage(100);
        generate_stimulus(dyn_arr);
        drive_stim();
        golden_model(expected);
        check_results(expected, data_q);

                ///////////////////////////// RUN2//////////////////////////////////
        $display ("///////////////////////////// RUN2:configure 200 runs//////////////////////////////////");
        configure_stim_storage(200);
        generate_stimulus(dyn_arr);
        drive_stim();
        golden_model(expected);
        check_results(expected, data_q);

        
                ///////////////////////////// RUN3//////////////////////////////////
        $display ("///////////////////////////// RUN3:reorder run 2 using reconfigure_stim and run the test again//////////////////////////////////");
        configure_stim_storage(200);
        reconfigure_stim( dyn_arr );
        //generate_stimulus(dyn_arr);   NOTE: didnt generate stimulus as we want the same values of RUN2 but with different order
        drive_stim();
        golden_model(expected);
        check_results(expected, data_q);

        $display ("///////////////////////////// END OF THE TEST //////////////////////////////////");
        
    end


endmodule