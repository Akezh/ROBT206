library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

PACKAGE SEGMENT is
	FUNCTION Digit2SevenSegment(D: std_logic_vector) RETURN STD_LOGIC_VECTOR;
end SEGMENT;

PACKAGE BODY SEGMENT IS
	FUNCTION Digit2SevenSegment(d: std_logic_vector) RETURN std_logic_vector is
	variable sevenSegment : std_logic_vector(6 downto 0);
	begin
	if d = "0000" then
	  sevenSegment:="1000000";
	elsif d = "0001" then
	  sevenSegment:="1111001";
	elsif d = "0010" then
	  sevenSegment:="0100100";
	elsif d = "0011" then
	  sevenSegment:="0110000";
	elsif d = "0100" then
	  sevenSegment:="0011001";
	elsif d = "0101" then
	  sevenSegment:="0010010";
	elsif d = "0110" then
	  sevenSegment:="0000010";
	elsif d = "0111" then
	  sevenSegment:="1111000";
	elsif d = "1000" then
	  sevenSegment:="0000000";
	elsif d = "1001" then
	  sevenSegment:="0010000";
	elsif d = "1010" then
	  sevenSegment:="0001000";
	elsif d = "1011" then
	  sevenSegment:="0000011";
	elsif d = "1100" then
	  sevenSegment:="1000110";
	elsif d = "1101" then
	  sevenSegment:="0100001";
	elsif d = "1110" then
	  sevenSegment:="0000110";
	else
	  sevenSegment:="0111000";  
	end if;
	
	return sevenSegment;
end function Digit2SevenSegment;
end SEGMENT;