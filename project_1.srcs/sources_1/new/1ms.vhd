----------------------------------------------------------------------------------
-- Company: Grupo ADDPT - UNRN - Laboratorio de Electrónica Analógica - TP1
-- Engineers: ABBATE, THEO
--            DAL FARRA, FRANCO
--            DE LA CRUZ, PEDRO
--            POJMAEVICH, MIRKO 
--            TORLETTI, LARA                          
-- 
-- 
-- Create Date: 25.09.2023 21:00:34
-- Design Name: 
-- Module Name: onems - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ones is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK_1mS : out STD_LOGIC);
end Ones;

architecture Behavioral of Ones is
    component Divider is
        Port ( CLK : in STD_LOGIC;
               RST : in STD_LOGIC;
               CLK_DIV : out STD_LOGIC;
               DIV: in integer
               );
    end component;
begin
divisor: Divider port map (
    CLK => CLK,
    RST => RST,
    CLK_div => CLK_1ms,
    DIV=> 100000000
);
end Behavioral;

