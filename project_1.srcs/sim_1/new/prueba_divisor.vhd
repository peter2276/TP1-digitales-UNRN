----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2023 18:58:44
-- Design Name: 
-- Module Name: prueba_divisor - Behavioral
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

entity prueba_divisor is
--  Port ( );
end prueba_divisor;

architecture Behavioral of prueba_divisor is
component Divider is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SPEED : in STD_LOGIC_VECTOR (1 downto 0);
           CLK_DIV : out STD_LOGIC
           );
end component;

signal clk, rst, clk_out : std_logic;
signal speed : std_logic_vector(1 downto 0);
signal stop: BOOLEAN := false;

begin

divisor: Divider port map (
    CLK => clk,
    RST => rst,
    CLK_div => clk_out,
    speed=> speed
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
    speed <= "00";
    wait for 3ms;
    rst <= '0';
    wait for 5sec;
    speed <= "01";
    wait for 5sec;
    speed <= "10";
    wait for 5sec;
    speed <= "11";
    wait for 5sec;
    speed <= "00";
    wait for 5sec;
    stop<=true;
end process;



end Behavioral;
