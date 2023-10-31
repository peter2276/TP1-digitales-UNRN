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
-- Module Name: User_Logic - Behavioral
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

entity User_Logic is
    Port ( MODE : in STD_LOGIC_VECTOR (1 downto 0);
           CLK : in STD_LOGIC;
           clk_div: in std_logic;
           RST : in STD_LOGIC;
           TO_DISPLAY : out integer;
           TEMP: in STD_LOGIC_VECTOR(7 downto 0)
           );
end User_Logic;

architecture Behavioral of User_Logic is

type state_type is (STANDBY,COUNTER,ERASE,READ);
signal present_state, next_state: state_type;
signal counter_s: integer;
signal to_display_s: integer;
--signal temp_s: integer;
--signal temp_si: STD_LOGIC_VECTOR (31 to 0);
begin

synch: process (clk,rst)
begin
if rising_edge(clk) then
    if rst='1' then
        present_state<=STANDBY;
    else
        present_state<=next_state;
    end if;
end if;
end process;

comb1: process (mode)
begin
case mode is
    when "00" =>
        next_state<=STANDBY;
    when "01" =>
        next_state<=COUNTER;
    when "10" =>
        next_state<=ERASE;
    when "11" =>
        next_state<=READ;
    when others =>
        null;
    end case;
end process;

comb2: process (present_state,rst,temp)
begin
    if rst='1' then
    else 
       case present_state is
        when STANDBY =>
            null;
        when COUNTER =>
            to_display_s<=counter_s;
        when ERASE =>
            to_display_s<=0;
        when READ =>
          to_display_s <= to_integer(unsigned(temp)); 
        when others =>
            null;
        end case;
        TO_DISPLAY<= to_display_s;
    end if;
    
end process;

--temperatura: process (temp,clk)
--begin
--    temp_si(31 downto 8) <= (others => '0');
--    temp_si(7 downto 0)  <= TEMP;
--    temp_s <= to_integer(unsigned(temp_si));
----    if rising_edge(clk) then
----        for i in TEMP'range loop
----                  if TEMP(i) = '1' then
----                    temp_s <= temp_s + (2 ** i);
----                  end if;
----        end loop;
----    end if;
--end process;

contador: process (present_state,clk_div) 
begin

    if rising_edge(clk_div) and present_state = COUNTER then
        counter_s <= counter_s +1;
    end if;
    
    if present_state = ERASE then 
             counter_s<=0;
    end if;

end process;

end Behavioral;
