-- this is a binary adder than takes two 
--8-bit numbers A,B and adds them showing 
--the sum and carry
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;  -- Needed for unsigned arithmetic

entity BA is
port 
(
A : in std_logic_vector (7 downto 0);
B : in std_logic_vector (7 downto 0);
Sum :out std_logic_vector (7 downto 0);
Carry : out std_logic
);
end BA;


architecture BAA of BA is 
begin

process(A,B)

variable Temp: unsigned (8 downto 0);
begin 
Temp := unsigned(A)+ unsigned(B);
Sum<=  std_logic_vector( Temp(7 downto 0) );
Carry <= std_logic( Temp(8) );

end process;


end BAA;




