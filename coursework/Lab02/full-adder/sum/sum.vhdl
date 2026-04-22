library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           out1 : out STD_LOGIC);
end Main;

architecture Behavioral of Main is

component XOR1_P is
port (
A : in std_logic;
B : in std_logic;
C : out std_logic
);
end component;

component XOR2_P is
port(
X : in std_logic;
Y : in std_logic;
Z : out std_logic 
);
end component;

signal wire : std_logic;

begin

XOR_PORTv1 : XOR1_P
port map(
A => in1,
B => in2,
C => wire);

XOR_PORTv2 : XOR2_P
port map(
X => wire,
Y => in3,
Z => out1);

end Behavioral;
