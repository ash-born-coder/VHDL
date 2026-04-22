library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR1_P is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : out STD_LOGIC);
end XOR1_P;

architecture Behavioral of XOR1_P is

begin

C <= A xor B;

end Behavioral;
