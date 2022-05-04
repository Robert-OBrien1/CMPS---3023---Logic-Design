-- Robert O'Brien
-- Alex Ryan
-- Aodhan Shaw

-- CMPS 3023
-- Dr. Passos
-- April 25, 2022to



---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START rs_subaddmux ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
Library IEEE;
use IEEE.std_Logic_1164.all;
entity rs_subaddmux is
 port(    	R0: in STD_LOGIC_Vector (7 downto 0);
            R1: in STD_LOGIC_Vector (7 downto 0);
				R2: in STD_LOGIC_Vector (7 downto 0);
				R3: in STD_LOGIC_Vector (7 downto 0);
            switch: in STD_LOGIC_Vector(7 downto 0);
            rs_out: out STD_LOGIC_Vector(7 down 0)
);
end entity;

architecture description of rs_subaddmux is
		signal x: std_logic_vector (7 downto 0);
BEGIN 
		

 process(switch,R0,R1,R2,R3,x) 
 begin
			x <= switch;
			
			if x (7 downto 0) = "00000000" then
				x <= "11111111";
			end if;
			
			if x (2 downto 0) = "000" then
				rs_out <= R0;
			elsif x (2 downto 0) = "001" then
				rs_out <= R1;
			elsif x (2 downto 0) = "010" then
				rs_out <= R2;
			else 	
				rs_out <= R3;
			end if;
			
 end process;
END description;

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END rs_subaddmux ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦


---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START rd_subaddmux ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
Library IEEE;
use IEEE.std_Logic_1164.all;
entity rd_subaddmux is
 port(    	R0: in STD_LOGIC_Vector (7 downto 0);
            R1: in STD_LOGIC_Vector (7 downto 0);
				R2: in STD_LOGIC_Vector (7 downto 0);
				R3: in STD_LOGIC_Vector (7 downto 0);
            switch: in STD_LOGIC_Vector(7 downto 0);
            rd_out: out STD_LOGIC_Vector(7 downto 0)
);
end entity;

architecture description of rd_subaddmux is
		signal x: std_logic_vector (7 downto 0);
BEGIN 
		

 process(switch,R0,R1,R2,R3,x) 
 begin
		
		x <= switch;
		if x (7 downto 0) = "00000000" then
			x <= "11111111";
		end if;
			
		if x (5 downto 3) = "000" then
			rd_out <= R0;
		elsif x (5 downto 3) = "001" then
			rd_out <= R1;
		elsif x (5 downto 3) = "010" then
			rd_out <= R2;
		else 	
			rd_out <= R3;
		end if;
		
 end process;
END description;

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END rd_subaddmux ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START REGISTER ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
Library IEEE;
use IEEE.std_Logic_1164.all;
entity Rgstr is
 port(    	EXE: in STD_LOGIC;
            UPD: in STD_LOGIC;
            d: in STD_LOGIC_Vector(7 downto 0);
            q: out STD_LOGIC_Vector(7 downto 0));
end entity;

architecture description of Rgstr is
BEGIN 

    process(EXE) 
    begin
            if (rising_edge(EXE)) then
            if (UPD = '1') then
            q <= d;
				end if;
				end if;
    end process;
END description;

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END REGISTER ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START DECODER ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
Library IEEE;
use IEEE.std_Logic_1164.all;
entity Decoder is

 port
 (     
		UPD: in STD_LOGIC;
		inst: in STD_LOGIC_Vector(15 downto 0);
		R0: out STD_LOGIC_Vector(7 downto 0);
		R1: out STD_LOGIC_Vector(7 downto 0);
		R2: out STD_LOGIC_Vector(7 downto 0);
		R3: out STD_LOGIC_Vector(7 downto 0);
		andout: out STD_LOGIC_Vector(8 downto 0);
		SUB_ADD: out STD_LOGIC_Vector(7 downto 0);
		MOV: out STD_LOGIC_Vector(9 downto 0);
		or_out: out STD_LOGIC_Vector(5 downto 0);
		display: out STD_LOGIC_Vector(4 downto 0)
);
				
				
				
end entity;

architecture dec of Decoder is
		signal x: std_logic_vector (4 downto 0);
		signal rd: std_logic_vector (2 downto 0);
		signal rs: std_logic_vector (2 downto 0);
		signal y: std_logic;
		signal b: std_logic_vector (1 downto 0);
		signal addsub: std_logic_vector (1 downto 0);
		signal imm: std_logic_vector (7 downto 0);
		signal imm2: std_logic_vector (8 downto 0);
		signal rd_rs: std_logic_vector (5 downto 0);

BEGIN 
    process(UPD,inst,b,y,x) 
    begin
				b <= "00";
				y <= inst (12);			-- getting imm
				x <= inst (6 downto 2);  
				imm <= b & y & x;
				
				if (rising_edge(UPD)) then
-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ LOAD INSTRUCTION ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

					if inst (15 downto 13)  = "010" then
						if inst ( 11 downto 7) = "00000" then
							R0 <= imm;
						elsif inst ( 11 downto 7) = "00001" then
							R1 <= imm;
						elsif inst ( 11 downto 7) = "00010" then
							R2 <= imm;
						elsif inst ( 11 downto 7) = "00011" then
							R3 <= imm;
						end if;
							
-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ LOAD INSTRUCTION ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦						
					
-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ AND INSTRUCTION ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
	
					elsif (inst (15)  = '1') and (inst ( 11 downto 10) = "10") and (inst (1 downto 0) = "01") then
						rd <= inst (9 downto 7);
						andout <= rd & y & x;
--						
-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ AND INSTRUCTION ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ SUB/ADD INSTRUCTION ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦	

					elsif (inst (15)  = '1') and (inst (12) = '1') and (inst (11 downto 10) = "11") then
						rd <= inst (9 downto 7);			
						rs <= inst (4 downto 2);
						addsub <= inst (6 downto 5);		
						SUB_ADD <= addsub & rd & rs;
						
-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ SUB/ADD INSTRUCTION ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦							
	
-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ OR INSTRUCTION ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
	
					elsif inst(15 downto 10) = "100011" then
							rd <= inst (9 downto 7);			
							rs <= inst (4 downto 2);
						   or_out <= rd & rs; 

							
-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ OR INSTRUCTION ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦					
	
-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ MOVE INSTRUCTION ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
					elsif inst(1 downto 0) = "10" then
				
				------------------ R0 Destination ------------
						if inst ( 11 downto 7) = "00000" then -- rd = r0
							if inst(6 downto 2) = "00001" then -- rs = r1
								MOV <= "0000000001";
							elsif inst(6 downto 2) = "00010" then -- rs = r2
								MOV <= "0000000010";
							elsif inst(6 downto 2) = "00011" then -- rs = r3
								MOV <= "0000000011";
							end if;
				
				------------------ R1 Destination ------------

						elsif inst ( 11 downto 7) = "00001" then -- rd = r1
							if inst(6 downto 2) = "00000" then -- rs = r0
								MOV <= "0000100000";
							elsif inst(6 downto 2) = "00010" then -- rs = r2
								MOV <= "0000100010";
							elsif inst(6 downto 2) = "00011" then -- rs = r3
								MOV <= "0000100011";
							end if;
								
				------------------ R2 Destination ------------
						elsif inst ( 11 downto 7) = "00010" then -- rd = r2
							if inst(6 downto 2) = "00000" then -- rs = r0
								MOV <= "0001000000";
							elsif inst(6 downto 2) = "00001" then -- rs = r1
								MOV <= "0001000001";
							elsif inst(6 downto 2) = "00011" then -- rs = r3
								MOV <= "0001000011";
							end if;
								
				------------------ R3 Destination ------------
						elsif inst ( 11 downto 7) = "00011" then -- rd = r3
							if inst(6 downto 2) = "00000" then -- rs = r0
								MOV <= "0001100000";
							elsif inst(6 downto 2) = "00001" then -- rs = r1
								MOV <= "0001100001";
							elsif inst(6 downto 2) = "00010" then -- rs = r2
								MOV <= "0001100010";
							end if;
						end if;
								
---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ MOVE INSTRUCTION ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ Display INSTRUCTION ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

					elsif inst(1 downto 0) = "11" then
						display <= inst(6 downto 2);

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ Display INSTRUCTION ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

		end if; -- inst (15 downto 13)
		end if; --(rising_edge(UPD)) then
    end process;
END dec;

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END DECODER ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦



---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START and_device ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

Library IEEE;
use IEEE.std_Logic_1164.all;
entity and_device is
 port(    
		data: in STD_LOGIC_Vector(8 downto 0);
		R0: in STD_LOGIC_Vector(7 downto 0);
		R1: in STD_LOGIC_Vector(7 downto 0);
		R2: in STD_LOGIC_Vector(7 downto 0);
		R3: in STD_LOGIC_Vector(7 downto 0);
		andout: out STD_LOGIC_Vector(7 downto 0)
);
end entity;

architecture description of and_device is
	signal imm: std_logic_vector (5 downto 0);
	signal temp: std_logic_vector (13 downto 0);
	

BEGIN 
		
 process(data) 
 begin
			imm <= data(5 downto 0);
			
			if data(8 downto 6) = "000" then	
				temp <= R0 & imm;
				andout <= temp (7 downto 0);
			elsif data(8 downto 6) = "001" then	
				temp <= R1 & imm;
				andout <= temp (7 downto 0);
			elsif data(8 downto 6) = "010" then	
				temp <= R2 & imm;
				andout <= temp (7 downto 0);
			elsif data(8 downto 6) = "011" then	
				temp <= R2 & imm;
				andout <= temp (7 downto 0);
				
			end if;
 end process;
END description;

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END and_device ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START move ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

Library IEEE;
use IEEE.std_Logic_1164.all;
entity move is
 port(    
			data: in std_LOGIC_Vector(9 downto 0);
			R0 : in std_LOGIC_Vector(7 downto 0);
			R1 : in std_LOGIC_Vector(7 downto 0);
			R2 : in std_LOGIC_Vector(7 downto 0);
			R3 : in std_LOGIC_Vector(7 downto 0);
			rd: out std_LOGIC_Vector(9 downto 0)
);
end entity;

architecture description of move is
BEGIN 
		
 process(data,R0,R1,R2,R3) 
 begin
			if data (9 downto 5) = "00000" then -- rd = R0
				if data(4 downto 0) = "00001" then -- rs = R1
					rd <= "00" & R1;
				elsif data(4 downto 0) = "00010" then -- rs = R2
					rd <= "00" & R2;
				else 				-- rs = R3
					rd <= "00" & R3;
				end if;
			elsif data (9 downto 5) = "00001" then -- rd = R1
				if data(4 downto 0) = "00000" then -- rs = R0
					rd <= "01" & R0; 
				elsif data(4 downto 0) = "00010" then -- rs = R2
					rd <= "01" & R2;
				else 				-- rs = R3
					rd <= "01" & R3;
				end if;
			elsif data (9 downto 5) = "00010" then -- rd = R2
				if data(4 downto 0) = "00000" then -- rs = R0
					rd <= "10" & R0;
				elsif data(4 downto 0) = "00001" then -- rs = R1
					rd <= "10" & R1;
				else 			-- rs = R3
					rd <= "10" & R3;
				end if;
			else				-- rd = R3
				if data(4 downto 0) = "00000" then -- rs = R0
					rd <= "11" & R0;
				elsif data(4 downto 0) = "00001" then -- rs = R1
					rd <= "11" & R1;
				else 			 -- rs = R2
					rd <= "11" & R2;
				end if;
			end if;
				
			
 end process;
END description;

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END move ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START or_device ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

Library IEEE;
use IEEE.std_Logic_1164.all;
entity or_device is
 port(    
			data: in std_LOGIC_Vector(5 downto 0);
			R0 : in std_LOGIC_Vector(7 downto 0);
			R1 : in std_LOGIC_Vector(7 downto 0);
			R2 : in std_LOGIC_Vector(7 downto 0);
			R3 : in std_LOGIC_Vector(7 downto 0);
			rd: out std_LOGIC_Vector(7 downto 0)
);
end entity;

architecture description of or_device is
	

BEGIN 
		
 process(data,R0,R1,R2,R3) 
 begin
			if data (5 downto 3) = "000" then -- rd = R0
				if data(2 downto 0) = "001" then -- rs = R1
					rd <= R0 or R1;
				elsif data(2 downto 0) = "010" then -- rs = R2
					rd <= R0 or R2;
				else 				-- rs = R3
					rd <= R0 or R3;
				end if;
			elsif data (5 downto 3) = "001" then -- rd = R1
				if data(2 downto 0) = "000" then -- rs = R0
					rd <= R1 or R0; 
				elsif data(4 downto 0) = "010" then -- rs = R2
					rd <= R1 or R2;
				else 				-- rs = R3
					rd <= R1 or R3;
				end if;
			elsif data (5 downto 3) = "010" then -- rd = R2
				if data(2 downto 0) = "000" then -- rs = R0
					rd <= R2 or R0;
				elsif data(2 downto 0) = "001" then -- rs = R1
					rd <= R2 or R1;
				else 			-- rs = R3
					rd <= R2 or R3;
				end if;
			else				-- rd = R3
				if data(2 downto 0) = "011" then -- rs = R0
					rd <= R3 or R0;
				elsif data(2 downto 0) = "001" then -- rs = R1
					rd <= R3 or R1;
				else 			 -- rs = R2
					rd <= R3 or R2;
				end if;
			end if;
 end process;
END description;

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END or_device ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START out ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

Library IEEE;
use IEEE.std_Logic_1164.all;
entity display is
 port(    
			data : in std_LOGIC_Vector(4 downto 0);
			R0: in std_LOGIC_Vector(7 downto 0);
			R1: in std_LOGIC_Vector(7 downto 0);
			R2: in std_LOGIC_Vector(7 downto 0);
			R3: in std_LOGIC_Vector(7 downto 0);
			disp: out std_LOGIC_Vector(7 downto 0)
			
);
end entity;

architecture description of display is

BEGIN 
		
 process(data,R0,R1,R2,R3) 
 begin
		
			if data(4 downto 0) = "00000" then
				disp <= R0;
			elsif data(4 downto 0) = "00001" then
				disp <= R1;
			elsif data(4 downto 0) = "00010" then
				disp <= R2;
			else 
				disp <= R3;
			end if;
 end process;
END description;

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END out ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↓ START add_sub ENTITY ↓ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

Library IEEE;
use IEEE.std_Logic_1164.all;
use ieee.std_logic_unsigned.all;

entity add_sub is
 port(    
			data : in std_LOGIC_Vector(7 downto 0);
			R0: in std_LOGIC_Vector(7 downto 0);
			R1: in std_LOGIC_Vector(7 downto 0);
			R2: in std_LOGIC_Vector(7 downto 0);
			R3: in std_LOGIC_Vector(7 downto 0);
			addorsub: out std_LOGIC_Vector(7 downto 0)
			
);
end entity;

architecture description of add_sub is

BEGIN 
		
 process(data,R0,R1,R2,R3) 
 begin
		
			if data(7 downto 6) = "00" then -- sub
				if data(5 downto 3) = "000" then -- rd = R0
					if data(2 downto 0) = "001" then -- rs = R1
						addorsub <= R0 - R1;
					elsif data(2 downto 0) = "010" then -- rs = R2
						addorsub <= R0 - R2;
					else 	-- rs = R3
						addorsub <= R0 - R3;
					end if;
				elsif data(5 downto 3) = "001" then -- rd = R1
					if data(2 downto 0) = "000" then -- rs = R0
						addorsub <= R1 - R0;
					elsif data(2 downto 0) = "010" then -- rs = R2
						addorsub <= R1 - R2;
					else 	-- rs = R3
						addorsub <= R1 - R3;
					end if;
				elsif data(5 downto 3) = "010" then -- rd = R2
					if data(2 downto 0) = "000" then -- rs = R0
						addorsub <= R2 - R0;
					elsif data(2 downto 0) = "001" then -- rs = R1
						addorsub <= R2 - R1;
					else 	-- rs = R3
						addorsub <= R2 - R3;
					end if;
				else 		 -- rd = R3
					if data(2 downto 0) = "000" then -- rs = R0
						addorsub <= R3 - R0;
					elsif data(2 downto 0) = "001" then -- rs = R1
						addorsub <= R3 - R1;
					else 	-- rs = R2
						addorsub <= R3 - R2;
					end if;
				end if;
					
			
			else -- add
				if data(5 downto 3) = "000" then -- rd = R0
					if data(2 downto 0) = "001" then -- rs = R1
						addorsub <= R0 + R1;
					elsif data(2 downto 0) = "010" then -- rs = R2
						addorsub <= R0 + R2;
					else 	-- rs = R3
						addorsub <= R0 + R3;
					end if;
				elsif data(5 downto 3) = "001" then -- rd = R1
					if data(2 downto 0) = "000" then -- rs = R0
						addorsub <= R1 + R0;
					elsif data(2 downto 0) = "010" then -- rs = R2
						addorsub <= R1 + R2;
					else 	-- rs = R3
						addorsub <= R1 + R3;
					end if;
				elsif data(5 downto 3) = "010" then -- rd = R2
					if data(2 downto 0) = "000" then -- rs = R0
						addorsub <= R2 - R0;
					elsif data(2 downto 0) = "001" then -- rs = R1
						addorsub <= R2 + R1;
					else 	-- rs = R3
						addorsub <= R2 + R3;
					end if;
				else 		 -- rd = R3
					if data(2 downto 0) = "000" then -- rs = R0
						addorsub <= R3 + R0;
					elsif data(2 downto 0) = "001" then -- rs = R1
						addorsub <= R3 + R1;
					else 	-- rs = R2
						addorsub <= R3 + R2;
					end if;
				end if;
			
			end if;
			
 end process;
END description;

---- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦ ↑ END out ENTITY ↑ ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦