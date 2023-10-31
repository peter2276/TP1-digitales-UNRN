----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2023 22:13:13
-- Design Name: 
-- Module Name: prueba_userlogic - Behavioral
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

entity prueba_userlogic is
--  Port ( );
end prueba_userlogic;

architecture Behavioral of prueba_userlogic is

component User_Logic is
    Port ( MODE : in STD_LOGIC_VECTOR (1 downto 0);
           CLK : in STD_LOGIC;
           clk_div: in std_logic;
           RST : in STD_LOGIC;
           LEDS : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal clk,clk_div,rst: std_logic;
signal leds: std_logic_vector(3 downto 0);
signal mode: std_logic_vector(1 downto 0);
signal stop: BOOLEAN := false;
begin
logica: User_Logic port map(
    clk=>clk,
    clk_div=>clk_div,
    mode=>mode,
    leds=>leds,
    rst=>rst
);

reloj1: process
begin
    while not stop loop
        clk<='0';
        wait for 500us;
        clk<='1';
        wait for 500us;
    end loop;
    wait;
end process;

reloj2: process
begin
    while not stop loop
        clk_div<='0';
        wait for 250ms;
        clk_div<='1';
        wait for 250ms;
    end loop;
    wait;
end process;

parada: process
begin
    rst <= '1';
    mode <= "00";
    wait for 3ms;
    rst <= '0';
    wait for 5ms;
    mode <= "01";
    wait for 5sec;
    mode <= "10";
    wait for 5sec;
    mode <= "11";
    wait for 5sec;
    mode <= "00";
    wait for 5sec;
    stop<=true;
end process;

end Behavioral;
