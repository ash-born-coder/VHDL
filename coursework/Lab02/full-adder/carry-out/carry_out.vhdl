library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_out is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           out1 : out STD_LOGIC);
end Carry_out;

architecture Behavioral of Carry_out is

component AND_P1 is
port(
A : in std_logic;
B : in std_logic;
C : out std_logic);
end component;

component OR_P1 is
port(
X : in std_logic;
Y : in std_logic;
Z : out std_logic);
end component;

component AND_P2 is
port(
K : in std_logic;
L : in std_logic;
M : out std_logic);
end component;

component OR_P2 is
port(
O : in std_logic;
P : in std_logic;
Q : out std_logic);
end component;

signal wire1, wire2, wire3 : std_logic;

begin

AND_PORT1 : AND_P1
port map(
A => in1,
B => in2,
C => wire1);

OR_PORT1 : OR_P1
port map(
X => in1,
Y => in2,
Z => wire2);

AND_PORT2 : AND_P2
port map(
K => wire2,
L => in3,
M => wire3);

OR_PORT2 : OR_P2
port map(
O => wire1,
P => wire2,
Q => out1);

end Behavioral;
