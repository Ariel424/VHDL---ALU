library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_8X3 is
port (Decoder_in: in std_logic_vector (2 downto 0);
Decoder_out: out std_logic_vector (7 downto 0));
end Decoder_8X3;

architecture behavioral of Decoder_8X3 is

constant Decoder_delay: time:= 10ns;

begin 
with Decoder_in select
Decoder_out <= "00000001" after Decoder_delay when "000",
               "00000010" after Decoder_delay when "001",
               "00000100" after Decoder_delay when "010",
               "00001000" after Decoder_delay when "011",
               "00010000" after Decoder_delay when "100",
               "00100000" after Decoder_delay when "101",
               "01000000" after Decoder_delay when "110",
               "10000000" after Decoder_delay when "111",
               "00000000" when others; 
end behavioral;
               
entity Or_4_inputs is 
port(or_in: in std_logic_vector (3 downto 0);
or_out: out std_logic);
end Or_4_inputs;

architecture behavioral of Or_4_inputs is 
constant or_delay: time:=10ns; 

begin
or_out<= (or_in(0) or or_in(1) or or_in(2) or or_in(3)) after or_delay;

end behavioral;          
