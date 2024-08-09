----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2024 21:36:42
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is
component top is 
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component top;

signal clk_i: std_logic:='0';
signal btn_i: std_logic_vector(3 downto 0);
signal sw_i: std_logic_vector(7 downto 0);
signal led7_an_o: std_logic_vector(3 downto 0);
signal led7_seg_o: std_logic_vector(7 downto 0);

begin

dut: top port map(
clk_i=>clk_i,
btn_i=>btn_i,
sw_i=>sw_i,
led7_an_o=>led7_an_o,
led7_seg_o=>led7_seg_o

);

    clk_i <= not clk_i after 5ns;
    
    stim: process
    begin   
    sw_i <="10001011";
    wait for 2ms;
    btn_i<="1000";
    wait for 1ms;
    btn_i<="0000";
    sw_i<="01000000";
    wait for 2ms;
    btn_i<="0100";
    wait for 1ms;
    btn_i(2)<='0';
    sw_i<="00100001";
    wait for 2ms;
    btn_i<="0010";
    wait for 1ms;
    btn_i<="0000";
    sw_i<="00011111";
    wait for 2ms;
    btn_i<="0001";
    wait for 1ms;
    btn_i(0)<='0';
    wait;
    end process;
    
        


end Behavioral;
