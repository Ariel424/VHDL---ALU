library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1X8_TB is
end Demux_1X8_TB;

architecture behavioral of Demux_1X8_TB is
component Demux1X8_TB
port (I8: in std_logic;
sel8: in std_logic_vector (2 downto 0);
Y8: out std_logic_vector (7 downto 0));
end component;

signal I8_sim: std_logic; 
signal sel8_sim: std_logic_vector (2 downto 0);
signal Y8_sim: std_logic_vector (7 downto 0);

begin 
Demux1X8: Demux1X8_TB port map (I8=>I8_sim, sel8=>sel8_sim, Y8=>Y8_sim);

process
begin

sel8_sim<="000"; wait for 20ns;
sel8_sim<="001"; wait for 20ns;
sel8_sim<="010"; wait for 20ns;
sel8_sim<="011"; wait for 20ns;
sel8_sim<="100"; wait for 20ns;
sel8_sim<="101"; wait for 20ns;
sel8_sim<="110"; wait for 20ns;
sel8_sim<="111"; wait for 20ns;

wait;
end process;
end behavioral; 
