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
      aan_uit           : OUT    std_logic := '0';
      centrifugeerkeuze : OUT    std_logic_vector (1 DOWNTO 0) := "01";
      clk               : OUT    std_logic := '0' ;
      deur_dicht        : OUT    std_logic := '1';
      kuip_leeg         : OUT    std_logic := '1';
      programmakeuze    : OUT    std_logic_vector (1 DOWNTO 0) := "00" ;
      start             : OUT    std_logic := '0';
      t_hoog            : OUT    std_logic := '0';
      t_laag            : OUT    std_logic := '1';
      w_hoog            : OUT    std_logic := '0';
      w_laag            : OUT    std_logic := '1'
   );

END wasmachien_block_tester;

--
ARCHITECTURE logic OF wasmachien_block_tester IS
BEGIN
  
  aan_uit <= '0', '1' AFTER 10 ns;
  
  process
  begin
      start <= '0';
      wait for 150 ns;
      start <= '1';
      wait for 50 ns;
      start <= '0';
      wait;  -- Zorgt ervoor dat het process stopt (of een klok-event afwachten)
  end process;


  -- Clock process
  clk_signal:
  process
    variable clk_period : time := 10 ns;
    variable clk_state  : std_logic := '0'; -- Create a state buffer
  begin
    while true loop  -- Infinite loop for continuous clock generation
      clk_state := not clk_state;
      clk <= clk_state;
      wait for clk_period / 2;
    end loop;
  end process;

  -- Verwarming process (Fixed Syntax)
  verwarming_process:
process
begin
    wait on verwarmen; -- Ensure process only runs when verwarmen changes
    
    if (verwarmen = '0') then
        wait for 50 ns;
        t_laag <= '1';
        t_hoog <= '0';
    elsif (verwarmen = '1') then
        wait for 50 ns;
        t_laag <= '0';
        t_hoog <= '1';
    end if;
end process;

process
begin
    -- Wacht tot klep_open hoog wordt
    wait until klep_open = '1';  
    
    -- Zodra klep_open hoog is, wordt de actie uitgevoerd
    w_laag <= '0';
    w_hoog <= '1';
    kuip_leeg <= '0';

    -- Voorkomt dat het proces opnieuw wordt uitgevoerd
    wait until pomp_aan = '1';   
    
      -- Zodra klep_open hoog is, wordt de actie uitgevoerd
      w_laag <= '0';
      w_hoog <= '0';
      kuip_leeg <= '1';
  
      -- Voorkomt dat het proces opnieuw wordt uitgevoerd
     wait until klep_open = '1';  
    
    -- Zodra klep_open hoog is, wordt de actie uitgevoerd
    w_laag <= '0';
    w_hoog <= '1';
    kuip_leeg <= '0';
    
     wait until pomp_aan = '1';   
    
      -- Zodra klep_open hoog is, wordt de actie uitgevoerd
      w_laag <= '0';
      w_hoog <= '0';
      kuip_leeg <= '1';
    
    wait;
 
end process;




END ARCHITECTURE logic;
