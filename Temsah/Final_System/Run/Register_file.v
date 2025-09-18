module Register_file
#( parameter DATA_width = 8  ,  parameter Address_width = 4 )
(

//Declaring inputs
    input wire [ DATA_width - 1  : 0 ] WrData,
    input wire [ Address_width - 1 : 0 ] Address,
    input wire WrEn,
    input wire RdEn,
    input wire CLK,
    input wire RST, //Active low asynchronus reset

//Declaring outputs
    output reg [ DATA_width - 1 : 0 ] RdData,
    output reg RdData_valid,
    output wire [DATA_width - 1 : 0 ] REG0,
    output wire [DATA_width - 1 : 0 ] REG1,
    output wire [DATA_width - 1 : 0 ] REG2,
    output wire [DATA_width - 1 : 0 ] REG3

);
//Declarint the Register files 
    reg [ DATA_width - 1 : 0 ] Regfile [ (  1 << Address_width  ) - 1 : 0 ]; 
//Declaring loop parameter
    integer i;    
    
always@(posedge CLK or negedge RST )
    begin       
        if( !RST )
            begin
                RdData <= 0;
                RdData_valid <= 0;
                for(  i = 0  ;  i <= (  1 << Address_width  ) - 1  ;  i = i + 1 )
                    begin
                        if( i == 2 )
                            Regfile[ i ] <= 'b100000_0_1;
                        else if( i == 3 )
                            Regfile[ i ] <= 'b100000;
                        else 
                            Regfile[ i ] <= 0;
                    end
            end
        else if ( WrEn )
            begin                    
                    Regfile[ Address ] <= WrData;
                    RdData_valid <= 0;
            end    
        else if ( RdEn && !WrEn ) 
            begin
                    RdData <= Regfile[ Address ];  
                    RdData_valid <= 1;
            end  
    end

assign REG0 = Regfile[ 0 ];
assign REG1 = Regfile[ 1 ];
assign REG2 = Regfile[ 2 ];
assign REG3 = Regfile[ 3 ];

endmodule 