library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity three_bit_registry is
    port (
        clk        : in std_logic;
        sensor_in  : in std_logic_vector(2 downto 0);
        sensor_out : out std_logic_vector(2 downto 0)
    );
end entity three_bit_registry;

architecture arch of three_bit_registry is
begin

    process (clk)
    begin
        if (rising_edge(clk)) then
            sensor_out <= sensor_in;
        end if;
    end process;

end architecture arch;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inputbuffer is
    port (
        clk : in std_logic;

        sensor_l_in : in std_logic;
        sensor_m_in : in std_logic;
        sensor_r_in : in std_logic;

        sensor_l_out : out std_logic;
        sensor_m_out : out std_logic;
        sensor_r_out : out std_logic
    );
end entity inputbuffer;

architecture arch of inputbuffer is

    component three_bit_registry is
        port (
            clk        : in std_logic;
            sensor_in  : in std_logic_vector(2 downto 0);
            sensor_out : in std_logic_vector(2 downto 0);
        );
    end component three_bit_registry;

    signal sensor_reg, sensor_out : std_logic_vector(2 downto 0);

begin

    sensor_l_out <= sensor_out(2);
    sensor_m_out <= sensor_out(1);
    sensor_r_out <= sensor_out(0);

    LB1 : three_bit_registry port map(
        clk        => clk,
        sensor_in  => sensor_l_in & sensor_m_in & sensor_r_in,
        sensor_out => sensor_reg
    );

    LB2 : three_bit_registry port map(
        clk        => clk,
        sensor_in  => sensor_reg,
        sensor_out => sensor_out
    );

end architecture arch;