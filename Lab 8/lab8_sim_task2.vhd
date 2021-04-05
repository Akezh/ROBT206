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
	variable SUM: std_logic_vector(0 to 4);
	variable CO: std_logic_vector(0 to 5);
	variable SWA: std_logic_vector(0 to 4);
	variable SWB: std_logic_vector(0 to 4);
begin

	SUM := "00000";
	CO := "000000";
	SWA := SW(4 downto 0);
	SWB := SW(9 downto 5);
	
	SUM(4) := SWA(4) xor SWB(4);
	CO(4) := SWA(4) and SWB(4);
	
	for i in 4 downto 0 loop
		SUM(i) := SWA(i) xor SWB(i) xor CO(i+1);
		CO(i) := (SWA(i) and SWB(i)) or (SWA(i) and CO(i+1)) or(SWB(i) and CO(i+1));
	end loop;
	
	case SUM(4) is
		when '1' => HEX0 <= "1111001"; -- 1
		when '0' => HEX0 <= "1000000"; -- 0
		when others => null;
	end case;
	
	case SUM(3) is
		when '1' => HEX1 <= "1111001"; -- 1
		when '0' => HEX1 <= "1000000"; -- 0
		when others => null;
	end case;
	
	case SUM(2) is
		when '1' => HEX2 <= "1111001"; -- 1
		when '0' => HEX2 <= "1000000"; -- 0
		when others => null;
	end case;
	
	case SUM(1) is
		when '1' => HEX3 <= "1111001"; -- 1
		when '0' => HEX3 <= "1000000"; -- 0
		when others => null;
	end case;
	
	case SUM(0) is
		when '1' => HEX4 <= "1111001"; -- 1
		when '0' => HEX4 <= "1000000"; -- 0
		when others => null;
	end case;
	
	case CO(0) is
		when '1' => HEX5 <= "1111001"; -- 1
		when '0' => HEX5 <= "1000000"; -- 0
		when others => null;
	end case;
	
	
end process;
end MAIN;