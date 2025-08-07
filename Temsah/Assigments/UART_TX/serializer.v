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
//Declaring a counter to know how many clock cycles are left for the whole data to be fully sent
    reg [ 3 : 0 ] counter;
//Declaring an internal registers to store the parallel data in before we start sending them 
    reg [ 7 : 0 ] internal_reg;
 
    reg busy;

always@( posedge CLK or negedge RST )
    begin
        if( !RST )
            begin
                ser_data <= 1'b1;
                ser_done <= 1'b0;
                internal_reg <= 8'b0;
                counter <= 4'b0;
                busy <= 1'b0;
            end
        else begin
            if( !busy && ser_en)
                begin
                    counter <= 4'b1;          
                    internal_reg <= P_DATA;
                    busy <= 1'b1;
                    ser_done <= 1'b0;
                    ser_data <= P_DATA[0];     
                end   
            else if( busy )
                begin
                    if( counter < 8 )          
                        begin
                            internal_reg <= internal_reg >> 1;
                            ser_data <= internal_reg[1];   
                            counter <= counter + 1;
                            ser_done <= 1'b0;
                        end
                    else // counter == 8
                        begin
                            ser_done <= 1'b1;
                            busy <= 1'b0;
                            ser_data <= 1'b1;   
                        end
                end
            else
                begin
                    ser_data <= 1'b1;         
                end                
        end
    end

endmodule