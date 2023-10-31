----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2023 19:59:04
-- Design Name: 
-- Module Name: speed_selector - Behavioral
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

entity speed_selector is
    Port ( 
        SPEED : in STD_LOGIC_VECTOR (1 downto 0);
        DIV: out integer
    );
end speed_selector;

architecture Behavioral of speed_selector is

begin

process(SPEED)
begin
    case SPEED is
        when "00" =>
            DIV<=1000; 
        when "01" =>
            DIV<=750; 
        when "10" =>
            DIV<=500; 
        when "11" =>
            DIV<=250; 
        when others =>
            null;
    end case;
end process;

end Behavioral;
