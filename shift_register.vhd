library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port (
        i_clk : in std_logic;
        i_data_to_delay : in std_logic
    );
end entity;

architecture RTL of shift_register is

    -- Instantiate a vector to shift a bit within it
    signal r_shift : std_logic_vector(7 downto 0) := (others => '0');

begin

    process(i_clk) is
    begin
        if rising_edge(i_clk) then
            r_shift(7 downto 1) <= r_shift(6 downto 0); -- shift left
            r_shift(0) <= i_data_to_delay;
            -- Bit 7 of r_shift has been delayed by 8 clock cycles
        end if;
    end process;
end RTL;