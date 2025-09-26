module FIFO_MEMORY 
#(
    parameter Data_width = 8,
    parameter Depth = 8,
    parameter Address_width = 3 // depth = 2^(Address) 
)
(
//Declaring write ports
    input wire [ Data_width - 1 : 0 ] Wrdata,
    input wire [ Address_width - 2 : 0 ] Wadder,
    input wire Wclken,
    input wire Wclk,
    input wire Wrst,
//Declaring read ports
    output reg [ Data_width - 1 : 0 ] Rdata,
    input wire [ Address_width - 2 : 0 ] Radder,
    input wire Rempty_flag,
    input wire Rclk
);
//Declaring the memory to store the data
 reg [ Data_width - 1 : 0 ] MEM [ Depth - 1 : 0 ];

integer i;

//Writing
always@( posedge Wclk or negedge Wrst )
    begin
        if( !Wrst )
            begin
                for( i = 0 ; i< Depth ; i = i + 1 )
                MEM[i] = {Data_width{ 1 'b0 }};
            end
        if( Wclken )
            MEM[ Wadder ] <= Wrdata ;
    end

//Reading
always@( posedge Rclk )
    begin
        if( !Rempty_flag )
        Rdata <= MEM[ Radder ];
    end

endmodule