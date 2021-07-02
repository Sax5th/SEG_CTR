-- CODE FOR BASIC JK FF

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JK_FF is
  port (
    i_clk : in std_logic;
    i_j : in std_logic;
    i_k : in std_logic;
    o_Q : out std_logic;
    o_QBar : out std_logic
    
  );
end JK_FF;

architecture rtl of JK_FF is


begin
  JK_PROC : process(i_clk)

  --declerative region of process 
  variable qn :std_logic; -- placeholder for signal
  begin
    if rising_edge (i_clk) then
      if (i_j = '0' and i_k = '0') then
        qn := qn;

      elsif (i_j = '1' and i_k = '0') then
        qn := '1';

      elsif (i_j = '0' and i_k = '1') then
        qn := '0';

      elsif (i_j = '1' and i_k = '1') then
        qn := not qn;

      else
        null; 
      end if;
      
    end if;
    o_Q <= qn;
    o_QBar <= not qn; 
  end process;

end architecture;