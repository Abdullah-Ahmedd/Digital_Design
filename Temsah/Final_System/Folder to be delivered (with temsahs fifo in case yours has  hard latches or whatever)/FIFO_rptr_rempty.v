module FIFO_rptr_rempty #( parameter Address_width = 3 ) //Depth = 2^(Address)
(
//Declaring inputs
    input wire Rinc,
    input wire Rclk,
    input wire Rrst,
    input wire [ Address_width : 0 ] R2q_wptr,
//Declaring outputs
    output wire [ Address_width - 1 : 0 ] Radder,
    output reg Rempty,
    output reg Rempty_flag,
    output reg [ Address_width : 0 ] Rptr
);
//Declaring internal registers
reg [ Address_width  : 0 ] Radder_binary_current;
//reg [ Address_width  : 0 ] Radder_binary_next;
reg [ Address_width : 0 ] Radder_gray_next;

//Rptr logic
    always@( * )
        begin
            Radder_binary_next = Radder_binary_current + ( Rinc & ~Rempty );
            Radder_gray_next = ( Radder_binary_next >> 1 ) ^ Radder_binary_next;
        end
    always@( posedge Rclk  or  negedge Rrst )
        begin
            if( !Rrst ) 
                begin
                    Radder_binary_current <=0;
                    Rptr<=0;
                end
            else  
                begin
                    Radder_binary_current <= Radder_binary_next;
                    Rptr <= Radder_gray_next;
                end      
        end
//Radder logic
assign Radder = Radder_binary_current;

//Rempty logic
always@( posedge Rclk  or  negedge Rrst )
    begin
        if( !Rrst )
            begin
                Rempty <= 1;
            end
        else
            begin
                Rempty <=( Radder_gray_next == R2q_wptr);
                Rempty_flag <=( Radder_gray_next == R2q_wptr);          
            end
    end

endmodule 