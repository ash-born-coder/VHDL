library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_P2 is
    Port ( O : in STD_LOGIC;
           P : in STD_LOGIC;
           Q : out STD_LOGIC);
end OR_P2;

architecture Behavioral of OR_P2 is

begin

Q <= P AND O;

end Behavioral;
