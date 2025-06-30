library ieee;
use ieee.std_logic_1164.all;

entity FABM is 
port
(
A : in std_logic;
B : in std_logic;
Cin : in std_logic;
Cout :out std_logic;
Sum :out std_logic
);
end FABM;


architecture FA of FABM is 
signal xor1 , and1 ,and2: std_logic ;
begin 
xor1<= a xor b;
sum<= xor1 xor cin;
and1<= cin and xor1;
and2 <= a and b;
cout<= and1 or and2;
end FA;
 
