module serializer
(
//Declaring inputs
    input wire [ 7 : 0 ] P_DATA,
    input wire ser_en,
    input wire CLK,

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
        if( !ready )
            begin
                counter <= 0;
                internal_reg <= P_DATA;
                ready <= 1;
                ser_done <= 0;
            end   
        else if( ser_en )
            begin
              if( counter <= 7 ) 
                    begin
                        ser_done <= 0;
                        ser_data <= internal_reg[ 0 ];
                        internal_reg <= internal_reg >> 1;
                        counter <= counter + 1;
                    end
              if (counter == 7) //hena kanet lazem tkoon if msh else if 3alashan lw e7na fe a5er wa7da fa counter<=7 fe3lan fa hand5ol el block el foo2 we msh hand5ol el block dy fa hant2a5ar clock cycle 3ala ma negy tany we el block el foo2 tkoon unvalid we el block dy tkoon valid 3ady 
                begin //hena lazem counter ykoon ==7 msh 8 3alashan el foo2 dy non blocking assigment fa el assigments bt7sal concurrent fa el value el gdeda(8) leesa matsagletsh
                        ser_done <= 1;
                        ready <= 0;
                    end

            end                
    end

endmodule
