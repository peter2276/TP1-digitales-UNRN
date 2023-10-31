----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2023 19:47:08
-- Design Name: 
-- Module Name: Prueba - Behavioral
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

entity Prueba is
--  Port ( );
end Prueba;

architecture Behavioral of Prueba is
component Onems is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK_1mS : out STD_LOGIC);
end component;

signal clk, rst, clk_out : std_logic;
signal stop: BOOLEAN := false;

begin

un_milli: Onems port map (
    CLK => clk,
    RST => rst,
    CLK_1ms => clk_out
);

reloj: process
begin
    while not stop loop
        clk<='0';
        wait for 5ns;
        clk<='1';
        wait for 5ns;
    end loop;
    wait;
end process;

parada: process
begin
    rst <= '1';
    wait for 15ns;
    rst <= '0';
    wait for 10ms;
    stop<=true;
end process;



end Behavioral;
