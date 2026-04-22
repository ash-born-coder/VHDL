library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_P2 is
    Port ( K : in STD_LOGIC;
           L : in STD_LOGIC;
           M : out STD_LOGIC);
end AND_P2;

architecture Behavioral of AND_P2 is

begin

M <= K AND L;

end Behavioral;
