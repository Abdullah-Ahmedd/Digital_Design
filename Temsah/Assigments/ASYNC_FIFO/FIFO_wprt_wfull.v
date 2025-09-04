/*
you did binary and gary as you want to convert from binary to gray

and you did current and next as
If you did:
assign wfull_val = (wgray == {~wq2_rptr[ADDR_WIDTH:ADDR_WIDTH-1],
                              wq2_rptr[ADDR_WIDTH-2:0]});
Then wfull would go high one cycle late.
That means the FIFO could accept one extra write and overflow before detecting full.

ba3d ma 3amlt el code la2et en wgray aslun msh bt3mel 7aga fa la8etha we sebt wgray_next 
*/

/*
enta 3andak wptr we wadder fe3lan byshawro 3ala el address el hatkteb feeh bas el bt3melo fl code howa enk 
5alast cycle 5las fa lazem t update wptr we wadder le el value el gdeeda bta3thom

we da by5aleek fl full detection tt2aked next 3alashan howa b2a el current bta3ak men Wptr <= Wadder_gray_next; bas 3alashan
kol el sequentual blocks concurrent fa el value makentsh lessa etgadett
*/
module FIFO_wptr_wfull
#( parameter Address =3  ) // Depth = 2^(Address)
(
//Declaring inputs
    input wire Wrst,
    input wire Winc,
    input wire Wclk,
    input wire [ Address : 0 ] Wq2_rptr,

//Declaring outputs
    output wire [ Address - 1 : 0 ] Wadder,
    output reg [ Address : 0 ] Wptr,
    output reg Wfull
);

//Declaring internal registers 
    reg [ Address : 0 ] Wadder_binary_current;
    reg [ Address : 0 ] Wadder_binary_next;
    reg [ Address : 0 ] Wadder_gray_next;

// Wptr logic
    always@( * )
        begin
            Wadder_binary_next = Wadder_binary_current + ( Winc & ~Wfull );
            Wadder_gray_next = ( Wadder_binary_next >> 1) ^ Wadder_binary_next ; //to convert from binary to gray encoding 
        end
    always@( posedge Wclk  or  negedge Wrst ) 
        begin
            if( !Wrst )
                begin
                    Wadder_binary_current <= 0;
                    Wptr <= 0;
                end
            else
                begin
                    Wadder_binary_current <= Wadder_binary_next; 
                    Wptr <= Wadder_gray_next;
                end    
        end

//Wadder logic
    assign Wadder = Wadder_binary_current;

//Wfull logic
    always@(posedge Wclk or negedge Wrst)
        begin
            if( !Wrst )
                begin
                    Wfull<=0;
                end
            else
            Wfull <=( Wadder_gray_next [ Address ] != Wq2_rptr[Address] ) &&  
                    ( Wadder_gray_next [ Address - 1 ] != Wq2_rptr[Address - 1 ] ) &&
                    ( Wadder_gray_next [ Address - 2 : 0 ] == Wq2_rptr[ Address - 2 : 0 ] );
                    
        end

endmodule