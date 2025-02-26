--
-- VHDL Architecture Wasmachine.wasmachien_block_tester.logic
--
-- Created:
--          by - Perij.UNKNOWN (LAPTOP-Q0P13GKH)
--          at - 00:18:47 26/02/2025
--
-- using Mentor Graphics HDL Designer(TM) 2022.1 Built on 21 Jan 2022 at 13:00:30
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY wasmachien_block_tester IS
   PORT( 
      deur_grendel      : IN     std_logic;
      klep_open         : IN     std_logic;
      led_aan           : IN     std_logic;
      led_start         : IN     std_logic;
      led_status        : IN     std_logic_vector (2 DOWNTO 0);
      led_vuldeur       : IN     std_logic;
      motor             : IN     std_logic_vector (2 DOWNTO 0);
      pomp_aan          : IN     std_logic;
      verwarmen         : IN     std_logic;
      aan_uit           : OUT    std_logic;
      centrifugeerkeuze : OUT    std_logic_vector (1 DOWNTO 0);
      clk               : OUT    std_logic;
      deur_dicht        : OUT    std_logic;
      kuip_leeg         : OUT    std_logic;
      programmakeuze    : OUT    std_logic_vector (1 DOWNTO 0);
      start             : OUT    std_logic;
      t_hoog            : OUT    std_logic;
      t_laag            : OUT    std_logic;
      w_hoog            : OUT    std_logic;
      w_laag            : OUT    std_logic
   );

-- Declarations

END wasmachien_block_tester ;

--
ARCHITECTURE logic OF wasmachien_block_tester IS
BEGIN
  
  aan_uit <= '0', '1' after 100 ns;
  start <= '0', '1' after 500 ns;
  
  clk_signal:
  process
    variable clk_period : time := 10 ns;
    variable clk_state : std_logic := '0'; -- Create a state buffer
  Begin
    -- Because ouputs can't be read (only in hdl 2008 or higher) 
    -- a buffer needs to be utilized for driving the output.
    clk_state := not clk_state;
    clk <= clk_state;
    
    wait for clk_period/2;
  end process;
  
   
  
  
END ARCHITECTURE logic;

