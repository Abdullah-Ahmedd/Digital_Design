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
    reg [ 7 : 0 ] counter_even;
    reg [ 7 : 0 ] counter_odd_up;
    reg [ 7 : 0 ] counter_odd_down;
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
                counter_even<= 0;
                counter_odd_down<= 0;
                counter_odd_up<= 0;
                o_div_clk <= 0;
                flag <= 0;
            end
            
            else if( clk_divider_en )
        begin


         if( !odd )
         if( counter_even == half_period - 1 ) 
            begin
                counter_even <= 0;
                o_div_clk <= ~o_div_clk;
                flag <= ~flag;
            end
        else counter_even <= counter_even+1;
        else if( odd )
            begin
                if( flag )
                begin
                    if( counter_odd_up == half_period-1 )
                        begin
                            counter_odd_up <=0;
                            o_div_clk <= ~o_div_clk;
                            flag <= ~flag;
                       end
                    else counter_odd_up <= counter_odd_up + 1;
                end
                else if( !flag )
                    begin
                        if(counter_odd_down == half_period_plus_1-1)
                            begin
                                counter_odd_down <=0;
                                o_div_clk <= ~o_div_clk;
                                flag <= ~flag;
                        end
                        else counter_odd_down <= counter_odd_down + 1;
                    end                
            end
        end
        
    end
always@( i_ref_clk )
begin
    if(  clk_divider_en == 0  ||  i_clk_en == 0  )
        begin
            o_div_clk = i_ref_clk;
        end

end
    



endmodule 