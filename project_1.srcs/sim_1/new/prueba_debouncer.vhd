----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2023 20:32:48
-- Design Name: 
-- Module Name: prueba_debouncer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prueba_debouncer is
--  Port ( );
end prueba_debouncer;

architecture Behavioral of prueba_debouncer is

component Foursw_dbcr is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           SWITCHES : in STD_LOGIC_VECTOR (3 downto 0);
           MODE : out STD_LOGIC_VECTOR (1 downto 0);
           SPEED : out STD_LOGIC_VECTOR (1 downto 0));
end component;
--component Debouncer is
--    Port ( CLK : in STD_LOGIC;
--           RST : in STD_LOGIC;
--           BTN : in STD_LOGIC;
--           DB_BTN : out STD_LOGIC);
--end component;
--signal clk,rst,btn,db_btn: std_logic;
--signal stop: BOOLEAN := false;
--begin
--deb: Debouncer port map(
--    clk=>clk,
--    rst=>rst,
--    btn=>btn,
--    db_btn=>db_btn
--);

signal clk,rst: std_logic;
signal SWITCHES : STD_LOGIC_VECTOR (3 downto 0);
signal mode,speed: STD_LOGIC_VECTOR (1 downto 0);
signal stop: BOOLEAN := false;
begin

deb: Foursw_dbcr port map(
    clk=>clk,
    rst=>rst,
    mode=>mode,
    speed=>speed,
    switches=>switches
);
 
reloj: process
begin
    while not stop loop
        clk<='0';
        wait for 500us;
        clk<='1';
        wait for 500us;
    end loop;
    wait;
end process;

parada: process
begin
    rst <= '1';
    switches<="0000";
    wait for 3ms;
    rst <= '0';
    wait for 3ms;
    switches<="1111";
    wait for 10ms;
    switches<="0101";
    wait for 10ms;
    switches<="1010";
    wait for 20ms;
    stop<=true;
end process;

end Behavioral;
