module ClkDiv
(
//Declaring inputs
    input wire i_ref_clk,
    input wire i_rst_n,
    input wire i_clk_en,
    input wire [ 7 : 0 ] i_div_ratio,
//Declaring outputs
    output reg o_div_clk
);

//Declaring some internal registers
    reg [ 7 : 0 ] counter;
    wire [ 7 : 0 ] half_period;
    wire [ 7 : 0 ] half_period_plus_1;
    wire odd; //odd flag that equals one when the input clock ratio is odd
    reg flag; //flag equals one when the output of the clock divider equals one 

//Computing the half period value and the odd flag
assign half_period =  i_div_ratio >> 1 ;
assign half_period_plus_1 =  ( i_div_ratio >> 1 ) + 1 ;
assign odd = i_div_ratio[ 0 ] ;

//Declaring the clock divider enable
wire clk_divider_en;
assign clk_divider_en = i_clk_en && ( i_div_ratio != 0 )&&( i_div_ratio != 1 ); 


always@( posedge i_ref_clk  or  negedge i_rst_n )
    begin
        if( !i_rst_n )
            begin
                counter <= 0;
                o_div_clk <= i_ref_clk;
                flag <= 0;
            end
            /*
        else if ( !clk_divider_en )  
            begin
                counter <= o_div_clk;      
                o_div_clk <= i_ref_clk;   
                flag <= 0;        
            end
            */
            else if( clk_divider_en )
        begin
          /*  
         if( i_div_ratio == 0 || i_div_ratio == 1 ) //Handling when the division scale is zero or one
            begin
                o_div_clk <= i_ref_clk;
                counter <= 0;
                flag <= 0;
            end 
            */ 
            
         if( !odd && counter == half_period )
            begin
                counter <= 0;
                o_div_clk <= ~o_div_clk;
                flag <= ~flag;
            end
        else if(odd && ( ( ( counter == half_period ) && flag ) || ( ( counter == half_period_plus_1) && !flag ) ) )
            begin
                counter <= 0;
                o_div_clk <= ~o_div_clk;
                flag <= ~flag;

            end
        else
            begin
                counter <= counter + 1;
            end
        end
        else
        begin
           o_div_clk <= i_ref_clk; 
           counter <= 0;
           flag <= 0;
        end
    end

endmodule 