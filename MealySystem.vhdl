
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tirgule_10_StateMachine_MEALY is
    Port (  x, rst, clk : in std_logic;
            y : out std_logic);
end tirgule_10_StateMachine_MEALY;

architecture Behavioral of tirgule_10_StateMachine_MEALY is
    Type state is (st0, st1, st2);
    signal PST, NST : state;
begin

process (clk, rst)
begin
    if (rst = '1') then
        PST <= st0;
    elsif (rising_edge(clk)) then
        PST <= NST;
    end if;
end process;

process (x, PST)
begin
    case PST is 
        when st0 => 
            if x = '0' then
                NST <= st1;
                Y<='0';
            else
                NST <= st0;
                Y<='0';
            end if;
         when st1 => 
            if x = '0' then
                NST <= st1;
                Y<='0';
            else
                NST <= st2;
                Y<='0';
            end if;
        when st2 => 
            if x = '0' then
                NST <= st1;
                Y<='1';
            else
                NST <= st0;
                Y<='0';
            end if;
            
    end case;         
end process;
end Behavioral;

entity tirgule_10_StateMachine_MEALY_TB is
end tirgule_10_StateMachine_MEALY_TB;

architecture Behavioral of tirgule_10_StateMachine_MEALY_TB is
    component tirgule_10_StateMachine_MEALY is
        Port (  x, rst, clk : in std_logic;
                y : out std_logic);
    end component;
    
    signal x, y, clk, rst : std_logic := '0';

begin
    U1: tirgule_10_StateMachine_MEALY port map(clk => clk, rst => rst, x => x, y => y);

process
begin
    clk <= not(clk); wait for 10ns;
end process;

process
begin
    rst <= '1'; wait for 100ns;
    rst <= '0'; wait for 100ns;
    x <= '0'; wait for 20ns;
    x <= '0'; wait for 20ns;
    x <= '0'; wait for 17ns;
    x <= '1'; wait for 17ns;
    x <= '0'; wait for 20ns;
    x <= '0'; wait for 20ns;
    rst <= '1'; wait for 100ns;
    rst <= '0'; wait for 100ns;
    x <= '1'; wait for 20ns;
    x <= '1'; wait for 20ns;
    x <= '0'; wait for 20ns;
    x <= '0'; wait for 20ns;
    x <= '1'; wait for 20ns;
    x <= '0'; wait for 20ns;    
    wait;
end process;
end Behavioral;
