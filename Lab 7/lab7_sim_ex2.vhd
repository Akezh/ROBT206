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

HEX0(0) <= (SW(0) AND (NOT SW(1)) AND (NOT SW(2)) AND (NOT SW(3))) 
OR (SW(2) AND (NOT SW(3)) AND (NOT SW(0)) AND (NOT SW(1))) 
OR (SW(0) AND (NOT SW(1)) AND SW(2) AND (SW(3))) 
OR (SW(1) AND SW(0) AND SW(3) AND (NOT SW(2)));
 
HEX0(1) <= ((NOT SW(3)) AND SW(2) AND (NOT SW(1)) AND SW(0)) 
OR (SW(3) AND SW(1) AND SW(0)) 
OR (SW(3) AND SW(2) AND (NOT SW(0))) 
OR (SW(2) AND SW(1) AND (NOT SW(0)));
 
HEX0(2) <= ((NOT SW(3)) AND (NOT SW(2)) AND SW(1) AND (NOT SW(0))) 
OR (SW(3) AND SW(2) AND (NOT SW(0))) 
OR (SW(3) AND SW(2) AND SW(1));
 
HEX0(3) <= ((NOT SW(3)) AND (NOT SW(2)) AND (NOT SW(1)) AND SW(0)) 
OR ((NOT SW(3)) AND SW(2) AND (NOT SW(1)) AND (NOT SW(0))) 
OR (SW(2) AND SW(1) AND SW(0)) 
OR (SW(3) AND (NOT SW(2)) AND SW(1) AND (NOT SW(0)));
 
HEX0(4) <= ((NOT SW(3)) AND SW(0)) 
OR ((NOT SW(3)) AND SW(2) AND (NOT SW(1))) 
OR ((NOT SW(2)) AND (NOT SW(1)) AND SW(0));
 
HEX0(5) <= (SW(3) AND SW(2) AND (NOT SW(1)) AND SW(0)) 
OR ((NOT SW(3)) AND (NOT SW(2)) AND SW(0)) 
OR ((NOT SW(3)) AND SW(1) AND SW(0)) 
OR ((NOT SW(3)) AND (NOT SW(2)) AND SW(1));
 
HEX0(6) <= ((NOT SW(3)) AND (NOT SW(2)) AND (NOT SW(1))) 
OR (SW(3) AND SW(2) AND (NOT SW(1)) AND (NOT SW(0))) 
OR ((NOT SW(3)) AND SW(2) AND SW(1) AND SW(0));

end process;
end MAIN;