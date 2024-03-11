library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port (
        INVA, A, ENA, B, ENB, Cin : in STD_LOGIC;
        F : in std_logic_vector(1 downto 0);
        output, Cout : out STD_LOGIC
    );
end ALU;

architecture behavioral of ALU is
    signal a1, b1, sum, c, anb, aob, nb : std_logic;

begin
    process (INVA, A, ENA, B, ENB, Cin)
    begin
        if (ENA = '1') then
            if (INVA = '1') then
                a1 <= not A;
            else 
                a1 <= A; 
            end if; 
        else
            a1 <= '0';
        end if;

        if (ENB = '1') then
            b1 <= not B;
        else 
            b1 <= '0';
        end if; 
    end process;

    sum <= a1 xor b1 xor Cin; 
    c <= (a1 and b1) or (a1 and Cin) or (b1 and Cin);
    anb <= a1 and b1;
    aob <= a1 or b1;
    nb <= not b1;

    process (F, sum, c, anb, aob, nb)
    begin 
        case F is
            when "00" => output <= anb;
            when "01" => output <= aob;
            when "10" => output <= nb;
            when "11" => output <= sum;
            when others => 
                output <= 'X';
        end case;

        Cout <= c;
    end process;
end behavioral;
