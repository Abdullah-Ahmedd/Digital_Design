module serializer
(
//Declaring inputs
    input wire [ 7 : 0 ] P_DATA,
    input wire ser_en,
    input wire CLK,
    input wire RST, //Asynchronus active-low reset

//Declaring outputs
    output reg ser_data,
    output reg ser_done
);
//Declaring a counter to know how many clock cylces are left for the whole data to be fully sent
    reg [ 3 : 0 ] counter;
//Declaring an internal registers to store the parallel data in before we start sending them 
    reg [ 7 : 0 ] internal_reg;
//Declaring an internal flag that is equal 1 when the data is stored successfully in the internal registers and ready to be outputted 
    reg ready;

always@( posedge CLK )
    begin
        if( !RST )
            begin
                ser_data <= 1'b1;
                ser_done <= 1'b0;
                internal_reg <= 8'b0;
                counter <= 4'b0;
                ready <= 1'b0;
            end
        else begin
            if( !ready && ser_en)
                begin
                    counter <= 4'b0;
                    internal_reg <= P_DATA;
                    ready <= 1'b1;
                    ser_done <= 1'b0;
                end   
            else if( ready )
                begin
                    if( counter <= 7 )
                        begin
                            ser_data <= internal_reg[ 0 ];
                            internal_reg <= internal_reg >> 1;
                            counter<=counter+1;
                        end
                    if (counter == 7)
                        begin
                            ser_done <= 1'b1;
                            ready <= 0;
                           counter <=counter+1;
                        end
                    else
                        begin
                            counter <=counter+1;
                            ser_done <= 0;
                        end

                end                
        end
    end

endmodule