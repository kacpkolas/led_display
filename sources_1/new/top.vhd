
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top is 
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
    component display is
    Port ( rst_i : in STD_LOGIC;
           clk_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR (31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component encoder_memory is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           digit_o : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal rst_i : std_logic:='0';
    signal digit_i : std_logic_vector(31 downto 0);
    
begin
    disp: display port map(
    rst_i => rst_i,
    digit_i=>digit_i,
    clk_i => clk_i,
    led7_an_o => led7_an_o,
    led7_seg_o=>led7_seg_o
    );
    
    encod: encoder_memory port map(
    clk_i => clk_i,
    btn_i => btn_i,
    sw_i => sw_i,
    digit_o => digit_i
    );
    


end Behavioral;
