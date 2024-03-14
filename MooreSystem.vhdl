library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity StateMachine_MOORE is
port (x, rst, clk: in std_logic;
y: out std_logic);
end StateMachine_MOORE;

architecture behavioral of StateMachine_MOORE is

Type state is (st0, st1, st2, st3);
signal PST, NST: state; 

begin 

process (clk, rst)
begin

if rst = '1' then PST <=st0;
elsif rising_edge (clk) then PST <= NST;
end if;
end process;

process (X, PST)
begin

case PST is 
when st0 => y <= '0';
if x= '0' then 
NST<= st1;
else
NST<= st0;
end if; 

when st1 => y <= '0';  
if x= '0' then 
NST<= st2;
else
NST<= st1;
end if; 

when st2=>y<='0';
if x='1' then 
NST<=st0;
else 
NST<=st3;
end if;

when st3=>y<='1';
if x ='0' then
NST<=ST1;
else
NST<=ST2;
end if;

end case;
end process; 

end behavioral; 
