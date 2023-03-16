library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity motorcontrol is
    port (	
        clk         : in    std_logic;
        reset       : in    std_logic;
        direction   : in    std_logic;
        count_in    : in    std_logic_vector (19 downto 0);
        pwm         : out   std_logic
    );
end entity motorcontrol;

architecture behavioral of motorcontrol is

    signal pwm	: std_logic;

begin
    process (clk, reset)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                pwm <= '0';
            elsif (direction = '1') then
                -- 1 ms
                if (to_integer(unsigned(count_in)) < 50000) then
                    pwm <= '1';
                else
                    pwm <= '0';
                end if;
            else
                -- 2 ms
                if (to_integer(unsigned(count_in)) < 100000) then
                    pwm <= '1';
                else
                    pwm <= '0';
                end if;
            end if;
        end if;
    end process;

    process (pwm)
    begin
        pwm <= pwm;
    end process;

end architecture behavioral;
