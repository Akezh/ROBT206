library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab7_sim is
  port (
    SW: in std_logic_vector(9 downto 0);
	  LEDR: out std_logic_vector(9 downto 0);
    HEX0: out std_logic_vector(6 downto 0);
    HEX1: out std_logic_vector(6 downto 0);
    HEX2: out std_logic_vector(6 downto 0);
    HEX3: out std_logic_vector(6 downto 0)
  );
end entity lab7_sim;

ARCHITECTURE MAIN OF lab7_sim IS
begin

process(SW)
begin

if SW(3 downto 0) = "0000" then
  HEX0<="1000000";
  
elsif SW(3 downto 0) = "0001" then
  HEX0<="1111001";
  
elsif SW(3 downto 0) = "0010" then
  HEX0<="0100100";
  
elsif SW(3 downto 0) = "0011" then
  HEX0<="0110000";
  
elsif SW(3 downto 0) = "0100" then
  HEX0<="0011001";
  
elsif SW(3 downto 0) = "0101" then
  HEX0<="0010010";
  
elsif SW(3 downto 0) = "0110" then
  HEX0<="0000010";
  
elsif SW(3 downto 0) = "0111" then
  HEX0<="1111000";
  
elsif SW(3 downto 0) = "1000" then
  HEX0<="0000000";
  
elsif SW(3 downto 0) = "1001" then
  HEX0<="0010000";
  
elsif SW(3 downto 0) = "1010" then
  HEX0<="0001000";
  
elsif SW(3 downto 0) = "1011" then
  HEX0<="0000011";
  
elsif SW(3 downto 0) = "1100" then
  HEX0<="1000110";
  
elsif SW(3 downto 0) = "1101" then
  HEX0<="0100001";
  
elsif SW(3 downto 0) = "1110" then
  HEX0<="0000110";
  
else
  HEX0<="0001110";  
  
end if;
end process;
end MAIN;