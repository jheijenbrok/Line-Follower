library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity three_bit_registry is
    port (
        clk : in std_logic;

        sensor_l_in : in std_logic;
        sensor_m_in : in std_logic;
        sensor_r_in : in std_logic;

        sensor_l_out : out std_logic;
        sensor_m_out : out std_logic;
        sensor_r_out : out std_logic
    );
end entity three_bit_registry;

architecture arch of three_bit_registry is
    signal sensor_l_reg : std_logic_vector(2 downto 0);
    signal sensor_m_reg : std_logic_vector(2 downto 0);
    signal sensor_r_reg : std_logic_vector(2 downto 0);
begin

    process (clk)
    begin
        if (clk'event and clk = '1') then
            sensor_l_reg <= sensor_l_in & sensor_l_reg(1 downto 0);
            sensor_m_reg <= sensor_m_in & sensor_m_reg(1 downto 0);
            sensor_r_reg <= sensor_r_in & sensor_r_reg(1 downto 0);
        end if;
    end process;

    sensor_l_out <= sensor_l_reg(2);
    sensor_m_out <= sensor_m_reg(2);
    sensor_r_out <= sensor_r_reg(2);

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
            clk : in std_logic;

            sensor_l_in : in std_logic;
            sensor_m_in : in std_logic;
            sensor_r_in : in std_logic;

            sensor_l_out : out std_logic;
            sensor_m_out : out std_logic;
            sensor_r_out : out std_logic
        );
    end component three_bit_registry;

    signal sensor_l_reg : std_logic;
    signal sensor_m_reg : std_logic;
    signal sensor_r_reg : std_logic;
    
    begin

        LB1 : three_bit_registry port map(
            clk => clk,
            sensor_l_in => sensor_l_in,
            sensor_m_in => sensor_m_in,
            sensor_r_in => sensor_r_in,
            sensor_l_out => sensor_l_reg,
            sensor_m_out => sensor_m_reg,
            sensor_r_out => sensor_r_reg
        );

        LB2 : three_bit_registry port map(
            clk => clk,
            sensor_l_in => sensor_l_reg,
            sensor_m_in => sensor_m_reg,
            sensor_r_in => sensor_r_reg,
            sensor_l_out => sensor_l_out,
            sensor_m_out => sensor_m_out,
            sensor_r_out => sensor_r_out
        );
        
end architecture arch;