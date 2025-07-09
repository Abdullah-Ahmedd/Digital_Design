//Swapping Contents of Two Registers using a Temporary Register:
always@(posedge clk)
begin
  b<=a;
  a<=b;
end

