LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Divisor_de_Frecuencia IS
PORT (clk: in std_logic;
		out1,out2 : buffer std_logic);
END Divisor_de_Frecuencia;

ARCHITECTURE ejemplo OF Divisor_de_Frecuencia IS 

SIGNAL count1: INTEGER RANGE 0 TO 7;

BEGIN 

	PROCESS (clk)
	VARIABLE count2: INTEGER RANGE 0 TO 7;
	
BEGIN 

	IF (clk 'EVENT AND clk='1') THEN 
		count1<= count1+1;
		count2:=count2+1;
		
		IF (count1=1 ) THEN 
		out1<= NOT out1;
		count1<=0;
		END IF;
		
		IF (count2=0 ) THEN 
		out2<= NOT out2;
		count2:=0;
		END IF;
	 END IF;
  END PROCESS;
END ejemplo;
	