----------------------------------------------------------------------------------
-- Company: Grupo ADDPT - UNRN - Laboratorio de Electrónica Analógica - TP1
-- Engineers: ABBATE, THEO
--            DAL FARRA, FRANCO
--            DE LA CRUZ, PEDRO
--            POJMAEVICH, MIRKO 
--            TORLETTI, LARA                          
-- 
-- Create Date: 25.09.2023 21:00:34
-- Design Name: 
-- Module Name: Multisw_dbcr - Behavioral
-- Project Name: lAB 1
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multisw_dbcr is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           SWITCHES : in STD_LOGIC_VECTOR (1 downto 0);
           MODE : out STD_LOGIC_VECTOR (1 downto 0)
           );
end Multisw_dbcr;

architecture Behavioral of Multisw_dbcr is
component Debouncer is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           BTN : in STD_LOGIC;
           DB_BTN : out STD_LOGIC);
end component;
begin
deb0: Debouncer port map(
    clk=>clk,
    rst=>rst,
    btn=>switches(1),
    db_btn=>mode(0)
);
deb1: Debouncer port map(
    clk=>clk,
    rst=>rst,
    btn=>switches(0),
    db_btn=>mode(1)
);

end Behavioral;

