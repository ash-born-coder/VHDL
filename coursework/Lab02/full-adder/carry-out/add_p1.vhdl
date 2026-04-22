library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_P1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : out STD_LOGIC);
end AND_P1;

architecture Behavioral of AND_P1 is

begin

C <= A AND B;

end Behavioral;
