------------------------------------------------------------------
--
-- [IE3-DI] Digital Circuits Winter Term 2025
--          Exercise 2 – Add/Sub Unit with Status Flags
--
-- @name:   addsub.vhd
-- @author: Chanuka Ashan Gunawardena
-- @description: Adder/Subtractor with status flag generation
--
-- (c) 2025 HAW Hamburg
--
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity addsub is
    port(
        A   : in  std_logic_vector(7 downto 0);   -- Operand A (8-bit)
        B   : in  std_logic_vector(7 downto 0);   -- Operand B (8-bit)
        sel : in  std_logic;                      -- 0=Add, 1=Subtract

        S   : out std_logic_vector(7 downto 0);   -- Sum / Difference
        C   : out std_logic;                      -- Carry flag
        V   : out std_logic;                      -- Overflow flag
        N   : out std_logic;                      -- Negative flag
        Z   : out std_logic                       -- Zero flag
    );
end entity addsub;

architecture rtl of addsub is
begin

process(A, B, sel)

    -- Internal variables
    variable A_v, B_v  : std_logic_vector(7 downto 0);
    variable B_eff     : std_logic_vector(7 downto 0); -- Effective B after MUX
    variable S_v       : std_logic_vector(7 downto 0); -- Result sum
    variable carry     : std_logic;                    -- Ripple carry
    variable c7        : std_logic;                    -- Carry into MSB (bit 7)

begin

    A_v := A;
    B_v := B;


    if sel = '0' then
        B_eff := B_v;
        carry := '0';
    else
        B_eff := not B_v;     -- invert B for subtraction
        carry := '1';         -- add the +1 in two's complement
    end if;

    for i in 0 to 7 loop

        -- SUM bit
        S_v(i) := A_v(i) xor B_eff(i) xor carry;

        -- Save carry into MSB (c7) when i = 6
        if i = 6 then
            c7 := (A_v(i) and B_eff(i)) or
                  (A_v(i) and carry) or
                  (B_eff(i) and carry);
        end if;

        -- Next carry calculation (Full Adder carry-out)
        carry := (A_v(i) and B_eff(i)) or
                 (A_v(i) and carry) or
                 (B_eff(i) and carry);

    end loop;

    S <= S_v;            -- Result
    C <= carry;          -- Carry-out flag
    V <= carry xor c7;   -- Overflow flag
    N <= S_v(7);         -- Negative flag

    -- Zero flag
    if S_v = "00000000" then
        Z <= '1';
    else
        Z <= '0';
    end if;

end process;

end architecture rtl;
