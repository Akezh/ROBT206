library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.segment.all;
use work.bitAdder5.all;

entity lab8_sim is
  port (
	 clk_50: in std_logic := '0';
    SW: in std_logic_vector(9 downto 0);
    LEDR: out std_logic_vector(9 downto 0);
    HEX0: out std_logic_vector(6 downto 0);
    HEX1: out std_logic_vector(6 downto 0);
    HEX2: out std_logic_vector(6 downto 0);
    HEX3: out std_logic_vector(6 downto 0);
    HEX4: out std_logic_vector(6 downto 0);
    HEX5: out std_logic_vector(6 downto 0)
  );
end entity lab8_sim;

ARCHITECTURE MAIN OF lab8_sim IS
begin

process(SW)
	variable SUM: std_logic := '0';
	variable CO: std_logic := '0';
begin

	SUM := '0';
	CO := '0';
	SUM := sw(2) xor sw(1) xor sw(0);
	CO := (sw(2) and sw(1)) or (sw(2) and sw(0)) or (sw(1) and sw(0));
	
	case SUM is
		when '1' => HEX0 <= "1111001"; -- 1
		when '0' => HEX0 <= "1000000"; -- 0
		when others => null;
	end case;
	
	case CO is
		when '1' => HEX1 <= "1111001"; -- 1
		when '0' => HEX1 <= "1000000"; -- 0
		when others => null;
	end case;
	
	
end process;
end MAIN;