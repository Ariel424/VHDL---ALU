library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is 
port (x, y, Cin: in std_logic;
OPC: in std_logic_vector (1 downto 0);
result, cout: out std_logic);
end ALU; 

architecture Behavioral of ALU is 

signal and_gate, or_gate, sum: std_logic;
constant and_delay: time:= 2ns;
constant or_delay: time:= 2ns;
constant Full_Adder_delay: time:= 5ns;
constant Mux_Delay: time:= 5ns;
constant System_delay: time:= 5ns;

begin

and_gate <= x and y after and_delay;
or_gate <= x or y  after or_delay;
sum <= x xor y xor cin after Full_Adder_delay;
cout <= (x and y) or (x and cin) or (y and cin) after Full_Adder_delay;
with OPC select 
result <= and_gate after Mux_Delay when "00",
and_gate after Mux_Delay when "01",
and_gate after Mux_Delay when "10",

'X' after System_delay when others;

end Behavioral; 
