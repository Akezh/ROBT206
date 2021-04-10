LIBRARY ieee  ; 
LIBRARY std  ; 
LIBRARY work  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
USE work.bitAdder5.all  ; 
USE work.segment.all  ; 
ENTITY lab8_sim_tb  IS 
END ; 
 
ARCHITECTURE lab8_sim_tb_arch OF lab8_sim_tb IS
  SIGNAL SW   :  std_logic_vector (9 downto 0)  ;
  SIGNAL HEX5   :  std_logic_vector (6 downto 0)  ;
  SIGNAL HEX4   :  std_logic_vector (6 downto 0)  ; 
  SIGNAL HEX3   :  std_logic_vector (6 downto 0)  ; 
  SIGNAL HEX2   :  std_logic_vector (6 downto 0)  ;
  SIGNAL HEX1   :  std_logic_vector (6 downto 0)  ; 
  SIGNAL HEX0   :  std_logic_vector (6 downto 0)  ;  
  SIGNAL clk_50   :  STD_LOGIC := '0'  ; 
   
  COMPONENT lab8_sim  
    PORT ( 
	   SW  : in std_logic_vector (9 downto 0) ;
		HEX5  : out std_logic_vector (6 downto 0) ;
      HEX4  : out std_logic_vector (6 downto 0) ; 	
      HEX3  : out std_logic_vector (6 downto 0) ; 
		HEX2  : out std_logic_vector (6 downto 0) ;  
      HEX1  : out std_logic_vector (6 downto 0) ; 
      HEX0  : out std_logic_vector (6 downto 0) ;
      clk_50  : in STD_LOGIC);
      
  END COMPONENT ; 
BEGIN
  DUT  : lab8_sim  
    PORT MAP ( 
      SW   => SW  ,
		HEX5   => HEX5  ,
      HEX4   => HEX4  ,
      HEX3   => HEX3  ,
      HEX2   => HEX2  ,
      HEX1   => HEX1  ,
      HEX0   => HEX0,
      clk_50   => clk_50  
         ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 200 ns, End Time = 1200 ns, Period = 20 ns
  Process
	Begin
	 clk_50  <= '0'  ;
	wait for 210 ns ;
	for Z in 1 to 49
	loop
	    clk_50  <= '1'  ;
	   wait for 10 ns ;
	    clk_50  <= '0'  ;
	   wait for 10 ns ;
-- 1190 ns, repeat pattern in loop.
	end  loop;
	 clk_50  <= '1'  ;
	wait for 10 ns ;
-- dumped values till 1200 ns
	wait;
 End Process;


-- "Repeater Pattern" Repeat 1 times
-- Start Time = 0 ns, End Time = 200 ns, Period = 50 ns
  Process
	Begin
	    sw  <= "0000100001"  ;
	   wait for 50 ns ;
	    sw  <= "0000100110"  ;
	   wait for 50 ns ;
	    sw  <= "0000100111"  ;
	   wait for 50 ns ;
	    sw  <= "1010110101"  ;
	   wait for 50 ns ;
-- 200 ns, repeat pattern in loop.
	wait;
 End Process;
END;