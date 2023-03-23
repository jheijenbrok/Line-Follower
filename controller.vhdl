library IEEE;
use ieee.std_logic_1164.all;

entity controller is
    port (
        clk   : in std_logic;
        reset : in std_logic;

        sensor_data : in std_logic_vector (2 downto 0);

        count_in    : in std_logic_vector (19 downto 0);
        count_reset : out std_logic;

        motor_l_reset     : out std_logic;
        motor_l_direction : out std_logic;

        motor_r_reset     : out std_logic;
        motor_r_direction : out std_logic
    );
end entity controller;

architecture behavioural of controller is
    component motorcontrol is 
        port (
            clk         : in std_logic;
            reset       : in std_logic;
            direction   : in std_logic;
            count_in    : in std_logic_vector (19 downto 0);
            pwm         : out std_logic
        );
    end component motorcontrol;

begin

    process(clk, reset)
    begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                
            elseif ()
            end if;
        end if;
    end process;


end architecture behavioural;
