-- test bench for jk ff inputs 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.env.finish;
use std.textio.all;

library SEG_CTR;
use SEG_CTR.JK_FF;

entity JK_FF is
end JK_FF;

architecture sim of JK_FF_TB is

    -- Component instantiation 
  component JK_FF is
    port (
      i_clk : in std_logic;
      i_j : in std_logic;
      i_k : in std_logic;
      o_Q : out std_logic;
      o_QBar : out std_logic
    );
  end component;

  constant clk_hz : integer := 100e6;
  constant clk_period : time := 1 sec / clk_hz;

  -- DUT signals 
  signal i_clk : std_logic := '1';
  signal i_j, i_k: std_logic;
  signal o_Q, o_QBar : std_logic;
  

begin

  i_clk <= not i_clk after clk_period / 2;

  DUT : entity SEG_CTR.JK_FF(rtl)
  port map (
    i_clk => i_clk,
    i_j => i_j,
    i_k => i_k,
    o_Q => o_Q,
    o_QBar => o_QBar 
    
  );

  SEQUENCER_PROC : process
  begin
    wait for clk_period * 2;

    i_j <= '0';
    i_k <= '0';
    wait for clk_period * 2;

    i_j <= '0';
    i_k <= '1';
    wait for clk_period * 2;

    i_j <= '1';
    i_k <= '0';
    wait for clk_period * 2;

    i_j <= '1';
    i_k <= '1';
    wait for clk_period * 2;

    i_j <= '1';
    i_k <= '1';
    wait for clk_period * 2;

    wait for clk_period * 5;
    

   
    

    finish;
  end process;

end architecture;