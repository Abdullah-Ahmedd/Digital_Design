module serializer
#( parameter Data_width = 8 )
(
//Declaring inputs
    input wire [ Data_width - 1 : 0 ] P_DATA,
    input wire ser_en,
    input wire CLK,
    input wire RST, //Asynchronus active-low reset

//Declaring outputs
    output reg ser_data,
    output reg ser_done
);
//Declaring a counter to know how many clock cylces are left for the whole data to be fully sent
    reg [ 3 : 0 ] counter;
//isolating P_DATA  
    reg [ Data_width - 1 : 0 ] P_DATA_ioslated;
//Declaring an internal flag that is equal 1 when the data is stored successfully in the internal registers and ready to be outputted 
    reg ready;

always@( posedge CLK or negedge RST )
    begin
        if( !RST )
            begin
                ser_data <= 1'b0;
                ser_done <= 1'b0;
                P_DATA_ioslated <= 'b0;
                counter <= 4'b0;
                ready <= 1'b0;
            end
        else begin
            if( !ready && ser_en )
                begin
                    counter <= 4'b0;
                    P_DATA_ioslated <= P_DATA;
                    ready <= 1'b1;
                    ser_done <= 1'b0;
                end   
            else if( ready )
                begin
                    if( counter <= Data_width - 1 )
                        begin
                            ser_data <= P_DATA_ioslated[ 0 ];
                            P_DATA_ioslated <= P_DATA_ioslated >> 1;
                            counter <= counter + 1;
                            ser_done <= 1'b0;
                        end
                    if ( counter == Data_width - 1 )
                        begin
                            ser_done <= 1'b1;
                            ready <= 0;
                           counter <= counter + 1;
                        end
                end                
        end
    end

endmodule