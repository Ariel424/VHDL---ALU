library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1X2 is
port (I2: in std_logic;
sel2: in std_logic;
Y2: out std_logic_Vector (1 downto 0));
end Demux_1X2;

architecture behavioral of Demux_1X2 is

begin 
with sel2 select

Y2<= ('0', I2) when '0',
(I2, '0') when '1',
"11" when others;

end behavioral; 

  

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1X8 is
port (I8: in std_logic;
sel8: in std_logic_vector (2 downto 0);
Y8: out std_logic_vector (7 downto 0));
end Demux_1X8;

architecture behavioral of Demux_1X8 is
component Demux_1X2
port (I2: in std_logic;
sel2: in std_logic;
Y2: out std_logic_Vector (1 downto 0));
end component;

component Demux_1X4
port (I4: in std_logic;
sel4: in std_logic_vector (1 downto 0);
Y4: out std_logic_vector (3 downto 0));
end component;

signal Ys2: std_logic_vector (1 downto 0);

begin 

D1x2: Demux_1X2 port map (I2=>I8, sel2=>sel8(2), Y2=>Ys2);
D1x4A: Demux_1X4 port map (I4=>Ys2(1), sel4=>sel8(1 downto 0), Y4=>Y8(7 downto 4));
D1x4B: Demux_1X4 port map (I4=>Ys2(0), sel4=>sel8(1 downto 0), Y4=>Y8(3 downto 0));
end behavioral;
