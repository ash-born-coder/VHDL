library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2_P is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Z : out STD_LOGIC);
end XOR2_P;

architecture Behavioral of XOR2_P is

begin

Z <= X xor Y;

end Behavioral;
