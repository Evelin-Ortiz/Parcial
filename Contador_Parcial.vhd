LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

entity Contador_Parcial is 



port (clk : in std_logic;
		reset : in std_logic;
		enable: in std_logic;
		c1,c2 : out std_logic_vector(6 DOWNTO 0);
		out1,out2 :  buffer std_logic);
end Contador_Parcial;

architecture arch1 of Contador_Parcial is 

signal cnt : unsigned (4 downto 0);
signal UNIT : unsigned (4 downto 0);
signal DEC : unsigned (4 downto 0);
SIGNAL count1: INTEGER RANGE 0 TO 7;

begin 
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
  
process (cnt) begin
UNIT <= cnt mod 10;
case UNIT is 
when "00000" =>c1<= "0000001";
when "00001" =>c1<= "1001111";
when "00010" =>c1<= "0010010";
when "00011" =>c1<= "0000110";
when "00100" =>c1<= "1001100";
when "00101" =>c1<= "0100100";
when "00110" =>c1<= "0100000";
when "00111" =>c1<= "0001111";
when "01000" =>c1<= "0000000";
when "01001" =>c1<= "0000100";
when others  =>c1<= "1111111";
end case;
end process;

process (cnt) begin
DEC <= cnt / 10;
case DEC is
when "00001" =>c2<= "1001111";
when "00010" =>c2<= "0010010";
when "00011" =>c2<= "0000110";
when others  =>c2<= "1111111";
end case;
end process;


pSeq : process (clk,reset)is
begin

if reset = '1' then
cnt<=(others =>'0');
elsif clk'event and clk='1' then 
if enable= '1' then 
cnt <= cnt + 1;
End if;
End if;
End process;



end arch1;