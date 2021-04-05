library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

PACKAGE bitAdder5 is
	FUNCTION FiveBitAdder(A, B: std_logic_vector) RETURN STD_LOGIC_VECTOR;
end bitAdder5;

PACKAGE BODY bitAdder5 IS
	FUNCTION FiveBitAdder(a, b: std_logic_vector) RETURN std_logic_vector is
	variable SUM: unsigned(0 to 4);
	variable CO: unsigned(0 to 5);
	variable FIN: std_logic_vector(0 to 5);
	begin
	
	SUM := "00000";
	CO := "000000";
	SUM(4) := a(4) xor b(4);
	CO(4) := a(4) and b(4);
	
	for i in 4 downto 0 loop
		SUM(i) := a(i) xor b(i) xor CO(i+1);
		CO(i) := (a(i) and b(i)) or (a(i) and CO(i+1)) or (b(i) and CO(i+1));
	end loop;
	
	for n in 4 downto 0 loop
		FIN(n) := SUM(n);
	end loop;
	
	FIN(5) := CO(0);
	
	return FIN;
end function FiveBitAdder;
end bitAdder5;