library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity lab6_sim is 
  port (
      SW :in std_logic_vector(9 downto 0);
      LEDR: out std_logic_vector(9 downto 0)
  );
end entity lab6_sim;

ARCHITECTURE MAIN OF lab6_sim IS 
begin
process(SW)
begin
LEDR(0)<=(SW(0) and SW(1)) or(SW(2) and SW(3)); -- A = (B AND C) OR (D AND E)

LEDR(1)<=SW(0) xor SW(1) xor SW(2); -- A = B xor C xor D
 
LEDR(2)<=(SW(0) xor SW(1)) or SW(2); -- A = (B xor C) OR D


end process;
end MAIN;