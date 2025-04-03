library ieee;
use ieee.std_logic_1164.all;

entity StateMachineProject is
port
(

	clk : in std_logic;
	
	sw1 : in std_logic;
	sw2 : in std_logic;
	sw3 : in std_logic;
	
	led1 : out std_logic;
	led2 : out std_logic;
	led3 : out std_logic
);

end entity;

architecture rtl of StateMachineProject is

type SMData is (STATE1, STATE2, STATE3);
signal Var_State : SMData; 

begin

	process1:process(clk)
	
	begin
	
		if rising_edge(clk) then
			case Var_State is
				when STATE1 =>
					led1 <= '1';
					led2 <= '0';
					led3 <= '0';
					if sw1 = '1' then
						Var_State <= STATE2; 
               end if;
				when STATE2 =>
					led1 <= '0';
					led2 <= '1';
					led3 <= '0';	
					if sw2 = '1' then
						Var_State <= STATE3; 
               end if;				
				when STATE3 =>
					led1 <= '0';
					led2 <= '0';
					led3 <= '1';
					if sw3 = '1' then
						Var_State <= STATE1; 
               end if;
				when others => 
					Var_State <= State1;
			end case;
		end if;
	end process;
end rtl;