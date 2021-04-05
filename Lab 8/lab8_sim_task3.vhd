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
	variable SWA: std_logic_vector(0 to 4);
	variable SWB: std_logic_vector(0 to 4);
	variable F: std_logic_vector(0 to 5);
begin
	
	SWA := SW(4 downto 0);
	SWB := SW(9 downto 5);
	F := FiveBitAdder(SWA, SWB);
	
	case F(5) is
		when '1' => HEX5 <= Digit2SevenSegment("0001");
		when '0' => HEX5 <= Digit2SevenSegment("0000");
		when others => null;
	end case;
	
	case F(4) is
		when '1' => HEX0 <= Digit2SevenSegment("0001");
		when '0' => HEX0 <= Digit2SevenSegment("0000");
		when others => null;
	end case;
	
	case F(3) is
		when '1' => HEX1 <= Digit2SevenSegment("0001");
		when '0' => HEX1 <= Digit2SevenSegment("0000");
		when others => null;
	end case;
	
	case F(2) is
		when '1' => HEX2 <= Digit2SevenSegment("0001");
		when '0' => HEX2 <= Digit2SevenSegment("0000");
		when others => null;
	end case;
	
	case F(1) is
		when '1' => HEX3 <= Digit2SevenSegment("0001");
		when '0' => HEX3 <= Digit2SevenSegment("0000");
		when others => null;
	end case;
	
	case F(0) is
		when '1' => HEX4 <= Digit2SevenSegment("0001");
		when '0' => HEX4 <= Digit2SevenSegment("0000");
		when others => null;
	end case;
	
	
end process;
end MAIN;