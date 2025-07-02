library ieee;
use ieee.std_logic_1164.all;

entity FASM is
port
(

A : in std_logic;
B :in std_logic;
Cin :in std_logic;
SUM :out std_logic;
COUT :out std_logic

);
end FASM;
architecture FAA of FASM is

component HA
port 
(
A : in std_logic;
B : in std_logic;
SUM : out std_logic;
CARRY : out std_logic
);
end component;
signal sum1,carry1,carry2 :std_logic;

begin
HA1:HA port map
(
A=>A,
B=>B,
Sum=>sum1,
carry=>carry1
);



HA2: HA port map
(
A=>sum1,
B=>cin,
sum=>sum,
carry=>carry2
);


cout<= carry1 or carry2;
end FAA;
