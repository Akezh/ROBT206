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

HEX0 <= "1000000";
HEX1 <= "1111001";
HEX2 <= "0100100";
HEX3 <= "0110000";

end process;
end MAIN;