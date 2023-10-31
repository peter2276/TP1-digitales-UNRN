----------------------------------------------------------------------------------
-- Company: Grupo ADDPT - UNRN - Laboratorio de Electrónica Analógica - TP1
-- Engineers: ABBATE, THEO
--            DAL FARRA, FRANCO
--            DE LA CRUZ, PEDRO
--            POJMAEVICH, MIRKO 
--            TORLETTI, LARA                          
-- 
-- Create Date: 25.09.2023 20:35:08
-- Design Name: 
-- Module Name: Debouncer - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Debouncer is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           BTN : in STD_LOGIC;
           DB_BTN : out STD_LOGIC);
end Debouncer;

architecture Behavioral of Debouncer is
signal cnt: unsigned (3 downto 0);
signal mem: std_logic_vector(1 downto 0);
begin
process (clk,rst,btn)
begin
    if rising_edge(clk) then
        if rst='1' then
        db_btn<='0';
        mem<=(others=>'0');
        else
        mem(1)<=mem(0);
        mem(0)<=btn;
        if ((mem(0) xor mem(1))='1' ) then
            cnt<=(others=>'0');
        elsif (cnt<14) then
                cnt <= cnt+1;
        else
             db_btn<=mem(1);
        end if;
    end if; 
    end if;   
end process;
end Behavioral;
