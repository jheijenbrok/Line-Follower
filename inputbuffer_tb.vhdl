library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inputbuffer_tb is end;

architecture testbench of inputbuffer_tb is

    component inputbuffer is
        port(
            clk: in std_logic;

            sensor_l_in: in std_logic;
            sensor_m_in: in std_logic;
            sensor_r_in: in std_logic;

            sensor_l_out: out std_logic;
            sensor_m_out: out std_logic;
            sensor_r_out: out std_logic
        );
    end component;
    
    signal clk: std_logic;
    signal sensor_l_in: std_logic;
    signal sensor_m_in: std_logic;
    signal sensor_r_in: std_logic;

begin

    uut: inputbuffer port map(
        clk => clk,

        sensor_l_in => sensor_l_in,
        sensor_m_in => sensor_m_in,
        sensor_r_in => sensor_r_in,

        sensor_l_out => open,
        sensor_m_out => open,
        sensor_r_out => open
    );

    clk <=  '1' after 0 ns,
            '0' after 10 ns when clk /= '0' else '1' after 10 ns;

    sensor_l_in <= '0' after 0 ns;
    sensor_l_in <= '1' after 6 ns;
    sensor_l_in <= '0' after 18 ns;

    sensor_m_in <= '0' after 0 ns;
    sensor_m_in <= '1' after 38 ns;
    sensor_m_in <= '0' after 90 ns;

    sensor_r_in <= '0' after 0 ns;
    sensor_r_in <= '1' after 20 ns;
    sensor_r_in <= '0' after 50 ns;
    sensor_r_in <= '1' after 100 ns;

end testbench;