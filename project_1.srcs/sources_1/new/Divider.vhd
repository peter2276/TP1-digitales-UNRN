----------------------------------------------------------------------------------
-- Company: Grupo ADDPT - UNRN - Laboratorio de Electrónica Analógica - TP1
-- Engineers: ABBATE, THEO
--            DAL FARRA, FRANCO
--            DE LA CRUZ, PEDRO
--            POJMAEVICH, MIRKO 
--            TORLETTI, LARA                          
-- 
-- Create Date: 25.09.2023 20:42:03
-- Design Name:  
-- Module Name: Divider - Behavioral
-- Project Name: LAB 1
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 0.01
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divider is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK_DIV : out STD_LOGIC;
           DIV: in integer
           );
end Divider;

architecture Behavioral of Divider is
    signal count: integer;
    signal a: std_logic;
begin
    CLK_250 : process (CLK,RST,DIV)
        begin
            if RST = '1' then
                count<=0;
                a<='0';
            elsif rising_edge(CLK) then
                if (count>=(DIV/2)) then
                    count <= 0;
                    a<=not a;
                else 
                    count <= count+1;
                end if;
           end if;
      clk_div<=a;
      end process;
  
end Behavioral;
