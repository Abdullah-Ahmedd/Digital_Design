module ClkDiv
#( parameter Ratio_width ='d8 )
(
//Declaring inputs
    input wire i_ref_clk,
    input wire i_rst_n,
    input wire i_clk_en,
    input wire [ 7 : 0 ] i_div_ratio,
//Declaring outputs
    output wire o_div_clk
);

//Declaring internal registers
reg [ Ratio_width - 1 : 0 ] count;
wire [ Ratio_width - 2 : 0 ] Counter_half;
wire [ Ratio_width - 2 : 0 ] Counter_full; 
reg div_clk;
reg odd_edge_tog ;               
wire is_one ;
wire is_zero;
wire clk_en;
wire is_odd;



always @(posedge i_ref_clk or negedge i_rst_n)               // counter reset condition 
 begin : counter_proc
  if(!i_rst_n)
   begin
    count <= 0 ;
	div_clk <= 0 ;	
    odd_edge_tog <= 1 ;
   end
    else if(clk_en) 
     begin
      if(!is_odd && (count == Counter_half))              // even edge flip condition 
       begin
        count <= 0 ;                                        // reset counter
        div_clk <= ~div_clk ;                               // clock inversion		
       end
      else if((is_odd && (count == Counter_half) && odd_edge_tog ) || (is_odd && (count == Counter_full) && !odd_edge_tog ))  // odd edge flip condition
       begin  
        count <= 0 ;                                        // reset counter
        div_clk <= ~div_clk ;		                        // clock inversion
        odd_edge_tog <= ~odd_edge_tog ;                      
       end
    else
     count <= count + 1'b1 ;
   end
 end



assign is_odd = i_div_ratio[0] ;
assign Counter_half = ((i_div_ratio >> 1) - 1 ) ;
assign Counter_full = (i_div_ratio >> 1) ;

assign is_zero = ~|i_div_ratio ;                               // check if ratio equals to 0 
assign is_one  = (i_div_ratio == 1'b1) ;                       // check if ratio equals to 1 
assign clk_en = i_clk_en & !is_one & !is_zero;                 // Enable if div_ratio not equal to 0 or 1 and block is enabled
assign o_div_clk = clk_en ? div_clk : i_ref_clk ;              // if clock divider is disabled : generated clock is the reference clock


endmodule