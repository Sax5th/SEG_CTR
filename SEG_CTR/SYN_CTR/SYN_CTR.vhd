-- VHDL FILE FOR SEQ. UP COUNTER USING JK FF
-- TODO: WIRE UP ALL JKFF 
-- INSPO: https://www.electronics-tutorials.ws/counter/count_3.html  https://allaboutfpga.com/vhdl-component-port-map-tutorial/
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library SEG_CTR;
--library JK_FF;

entity SYN_CTR is
  port (
    i_clk : in std_logic;
    i_jk : in std_logic;
    
    o_ZA : out std_logic;
    o_ZB : out std_logic;
    o_ZC : out std_logic;
    o_ZD : out std_logic
    
  );
end SYN_CTR;

architecture rtl of SYN_CTR is

  component JK_FF 
  port(
    i_clk : in std_logic;
    i_j : in std_logic;
    i_k : in std_logic;
    o_Q : out std_logic;
    o_QBar : out std_logic
  );
  end component;
  
  -- INTERMEDIATE SIGNAL DEFINITION 
  signal QA : std_logic;
  signal QB : std_logic;
  signal QC : std_logic;
 

begin
  JK1: JK_FF port map(
    i_clk => i_clk,
    i_j => i_jk,
    i_k => i_jk,
    --o/p 
    o_Q => o_ZA   
  );

    QA <= (o_ZA);

  JK2: JK_FF port map(
    i_clk => i_clk,
    i_j => QA,
    i_k => QA,
    --o/p
    o_Q => o_ZB
  );

    QB <= (o_ZB and QA);

  JK3: JK_FF port map(
    i_clk => i_clk,
    i_j => QB,
    i_k => QB,
    o_Q => o_ZC
  );

    QC <= (QB and o_ZC);

  JK4: JK_FF port map(
    i_clk => i_clk,
    i_j => QC,
    i_k => QC,
    o_Q => o_ZD
  );
end architecture;