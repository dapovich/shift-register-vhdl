library ieee;
use ieee.std_logic_1164.all;

entity shift_register_tb is
end entity;

architecture sim of shift_register_tb is

    -- We're slowing down the clock to speed up simulation time
    constant ClockPeriod      : time    := 50 ns;

    -- Declare signals
    signal i_clk_t : std_logic := '0';
    signal i_data_to_delay_t : std_logic := '1';

    -- Instantiate a component
    component shift_register
        port (
            i_clk : in std_logic;
            i_data_to_delay : in std_logic
        );
    end component;

begin

    -- The Unit Under Test (UUT)
    UUT: shift_register
    port map (
        i_clk => i_clk_t,
        i_data_to_delay => i_data_to_delay_t
    );

    -- Process for generating the clock
    i_clk_t <= not i_clk_t after ClockPeriod;
end sim;

