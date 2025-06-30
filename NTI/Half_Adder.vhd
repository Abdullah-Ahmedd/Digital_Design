library ieee;
use ieee.std_logic_1164.all;

entity HA is 
port 
(
A : in std_logic;
B : in std_logic;
SUM : out std_logic;
CARRY : out std_logic
);
end HA;

architecture HAA of HA is 
begin 
SUM <= A xor B;
CARRY <= A and B;
end HAA ;
