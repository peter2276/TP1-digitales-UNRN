----------------------------------------------------------------------------------
-- Company: Grupo ADDPT - UNRN - Laboratorio de Electrónica Analógica - TP1
-- Engineers: ABBATE, THEO
--            DAL FARRA, FRANCO
--            DE LA CRUZ, PEDRO
--            POJMAEVICH, MIRKO 
--            TORLETTI, LARA                          
-- 
-- Create Date: 25.09.2023 20:33:09
-- Design Name: 
-- Module Name: TOP - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
        Port ( 
           SWITCH : in STD_LOGIC_VECTOR (1 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           CA: out STD_LOGIC;
           CB: out STD_LOGIC;
           CC: out STD_LOGIC;
           CD: out STD_LOGIC;
           CE: out STD_LOGIC;
           CF: out STD_LOGIC;
           CG: out STD_LOGIC;
           DP: out STD_LOGIC;
           TMP_SDA: inout std_logic;
           TMP_SCL: out std_logic
           );
end TOP;

architecture Behavioral of TOP is

signal clk_1s: std_logic;
signal mode: std_logic_vector(1 downto 0);
signal clk_div: std_logic;
signal clk_200k: std_logic;
signal sda_dir: std_logic;
signal numero_s: integer;
signal temp_s: std_logic_vector(7 downto 0);

component User_Logic is
    Port ( MODE : in STD_LOGIC_VECTOR (1 downto 0);
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           TO_DISPLAY : out integer;
           CLK_DIV : in STD_LOGIC;
           TEMP: in STD_LOGIC_VECTOR(7 downto 0));
end component;

component i2c_master is
    Port (
    clk_200kHz : in std_logic;               -- i_clk
    reset: in std_logic;                    -- btnC on nexys
    SDA: inout std_logic;                      -- i2c standard interface signal
    temp_data: out std_logic_vector(7 downto 0);         -- 8 bits binary representation of deg C
    SDA_dir: out std_logic;                 -- direction of inout signal on SDA - to/from master 
    SCL: out std_logic                      -- i2c standard interface signal - 10KHZ
    );
end component;

component Multisw_dbcr is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           SWITCHES : in STD_LOGIC_VECTOR (1 downto 0);
           MODE : out STD_LOGIC_VECTOR (1 downto 0)
           );
end component;

component Divider is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK_DIV : out STD_LOGIC;
           DIV: in integer
           );
end component;

component Ones is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK_1S : out STD_LOGIC);
end component;

component Display is
    Port ( 
        CLK: in STD_LOGIC;
        NUMERO: in integer;
        PUNTO: in integer;
        a7segmentos: out STD_LOGIC_VECTOR(7 downto 0);
        indice: out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

begin
un_sec: Ones port map (
    CLK => clk,
    RST => rst,
    CLK_1s => clk_1s
);

logica: User_Logic port map(
    clk=>clk,
    clk_div=>clk_1s,
    mode=>mode,
    to_display=> numero_s,
    rst=>rst,
    temp=>temp_s
);

disp: Display port map (
    clk => clk_div,
    NUMERO => numero_s,
    PUNTO => 0,
    a7segmentos(7) => CA,
    a7segmentos(6) => CB, 
    a7segmentos(5) => CC, 
    a7segmentos(4) => CD,
    a7segmentos(3) => CE, 
    a7segmentos(2) => CF, 
    a7segmentos(1) => CG, 
    a7segmentos(0) => DP,
    indice => AN
);

deb: Multisw_dbcr port map(
    clk=>clk,
    rst=>rst,
    mode=>mode,
    switches=>switch
);

divisor: Divider port map (
    CLK => CLK,
    RST => RST,
    CLK_div => clk_div,
    DIV=> 100000
);

divisor200: Divider port map (
    CLK => CLK,
    RST => RST,
    CLK_div => clk_200k,
    DIV=> 500
);

temp: i2c_master port map(
    clk_200kHz => clk_200k,              -- i_clk
    reset => RST,                    -- btnC on nexys
    SDA =>  TMP_SDA,                    -- i2c standard interface signal
    temp_data => temp_s,        -- 8 bits binary representation of deg C
    SDA_dir =>  sda_dir,               -- direction of inout signal on SDA - to/from master 
    SCL => TMP_SCL
);

end Behavioral;
