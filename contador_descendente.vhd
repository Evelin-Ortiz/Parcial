library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity contador_descendente is
    port (
        clk: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        stop: in std_logic;
        d,e : OUT std_logic_vector(6 downto 0)
    );
end entity contador_descendente;
architecture behave of contador_descendente is
    signal count: unsigned range 0 to 35;
    signal cnt : unsigned (4 downto 0);
    signal unid : unsigned (4 downto 0);
    signal dece : unsigned (4 downto 0);


    begin
    -- Proceso para el decremento del contador
    process (clk, reset)
    begin
        if reset = '1' then
            count <= 35;
        elsif rising_edge(clk) then
            if enable = '1' and stop = '0' then
                count <= count - 1;
            end if;
        end if;
		  
    end process;
	 
	 
	 
	 


process (count) begin
unid <= count mod 10;
case unid is 
when "00000" =>d<= "0000001";
when "00001" =>d<= "1001111";
when "00010" =>d<= "0010010";
when "00011" =>d<= "0000110";
when "00100" =>d<= "1001100";
when "00101" =>d<= "0100100";
when "00110" =>d<= "0100000";
when "00111" =>d<= "0001111";
when "01000" =>d<= "0000000";
when "01001" =>d<= "0000100";
when others  =>d<= "1111111";
end case;
end process;




process (count) begin
dece <= count / 10;
case dece is
when "00001" =>e<= "1001111";
when "00010" =>e<= "0010010";
when "00011" =>e<= "0000110";
when "00100" =>e<= "1001100";
when "00101" =>e<= "0100100";
when others  =>e<= "1111111";
end case;
end process;



   

end architecture behave;