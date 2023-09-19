--Ariel Gonzalez Diaz 
-- This code execute a substractor of 4 bits 

--Import the libraries 
LIBRARY IEEE; 
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

--Created our ENTITY 
ENTITY substractor is 
	PORT(
		A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Bin : IN STD_LOGIC;
		Bout : OUT STD_LOGIC;
		Dif : OUT STD_LOGIC_VECTOR (3 DOWNTO 0 )
		);
	END substractor;
	
-- create the type of the architecture, in this case is  behavioral because it depends of the input states
ARCHITECTURE Behavioral OF substractor IS
	BEGIN 
	PROCESS(A, B, Bin)
			VARIABLE temp_diff:STD_LOGIC_VECTOR (3 DOWNTO 0); --TEMPORAL VARIABLE 
			VARIABLE temp_borrow : STD_LOGIC;
	BEGIN
	temp_diff := (others => '0');
	temp_borrow := Bin;
	
	for t in 0 to 3 loop 
		temp_diff(t) := (A(t) XOR B(t) XOR Bin);
		temp_borrow := ((NOT A(t) AND B(t)) OR ((not A(t) XOR B(t)) AND Bin));
	END LOOP;
	
	Dif <= temp_diff;
	Bout <= temp_borrow;
	
	END PROCESS;
END Behavioral;
		
		
		
		
		
--https://de-iitr.vlabs.ac.in/exp/half-full-subtractor/theory.html