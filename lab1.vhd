	-- Insert library and use clauses
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

	-- Begin entity declaration
	ENTITY lab1 IS
		-- Begin port declaration
		GENERIC (
			a0  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "00111111";
			a1  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000110";
			a2  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "01011011";
			a3  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "01001111";
			a4  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "01100110";
			a5  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "01101101";
			a6  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "01111101";
			a7  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000111";
			a8  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "01111111";
			a9  : STD_LOGIC_VECTOR(7 DOWNTO 0):= "01101111";
			err : STD_LOGIC_VECTOR(7 DOWNTO 0):= "10000000"
		);
		
		PORT (  
			-- Declare data inputs and outputs
			CLOCK_50MHz : IN STD_LOGIC;
			LEDM_C      : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
			LEDM_R      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			SW          : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			GPIO_0		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
			KEY         : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
			DISP0_D		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			DISP1_D		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	-- End entity 
	END;

	-- Begin architecture 
	ARCHITECTURE rtl OF lab1 IS
	-- Declare signals
		CONSTANT TRAV : STD_LOGIC_VECTOR (5 DOWNTO 0) := "000000";
		CONSTANT ENCH : STD_LOGIC_VECTOR (5 DOWNTO 0) := "000001";
		CONSTANT AG_ML : STD_LOGIC_VECTOR (5 DOWNTO 0) := "000010";
		CONSTANT SB : STD_LOGIC_VECTOR (5 DOWNTO 0) := "000011";
		CONSTANT DREN_1: STD_LOGIC_VECTOR (5 DOWNTO 0) := "000100";
		CONSTANT R9_LIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "000101";
		CONSTANT R9_DESLIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "000110";
		CONSTANT R1 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "000111";
		CONSTANT R4_LIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "001000";
		CONSTANT R4_DESLIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "001001";
		CONSTANT AM : STD_LOGIC_VECTOR (5 DOWNTO 0) := "001010";
		CONSTANT AG : STD_LOGIC_VECTOR (5 DOWNTO 0) := "001011";
		CONSTANT R3_LIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "001100";
		CONSTANT R3_DESLIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "001101";
		CONSTANT CT : STD_LOGIC_VECTOR (5 DOWNTO 0) := "001110";
		CONSTANT R7_1 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "001111";
		CONSTANT R2_1 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "010000";
		CONSTANT R8_1 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "010001";
		CONSTANT R5_LIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "010010";
		CONSTANT R5_DESLIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "010011";
		CONSTANT R6_1 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "010100";
		CONSTANT TRAV2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "010101";
		CONSTANT ENCH2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "010110";
		CONSTANT AG_2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "010111";
		CONSTANT SB_2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "011000";
		CONSTANT DREN2_1 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "011001";
		CONSTANT R9_2LIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "011010";
		CONSTANT R9_2DESLIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "011011";
		CONSTANT PAUSE 	: STD_LOGIC_VECTOR (5 DOWNTO 0) := "011100";
		CONSTANT DREN_2: STD_LOGIC_VECTOR (5 DOWNTO 0) := "011101";
		CONSTANT DREN2_2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "011110";
		CONSTANT SB2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "011111";
		CONSTANT R2_2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "100000";
		CONSTANT R2_3 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "100001";
		CONSTANT R2_4 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "100010";
		CONSTANT R7_2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "100011";
		CONSTANT R8_2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "100100";
		CONSTANT R6_2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "100101";
		CONSTANT R6_3 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "100110";
		CONSTANT R6_4 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "100111";
		CONSTANT R6_5 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "101000";
		CONSTANT R6_6 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "101001";
		CONSTANT R6_7 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "101010";
		CONSTANT R6_8 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "101011";
		CONSTANT R6_9 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "101100";
		CONSTANT R6_10 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "101101";
		CONSTANT R6_11 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "101110";
		CONSTANT R6_12 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "101111";
		CONSTANT R9_3LIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "110000";
		CONSTANT R9_3DESLIGA : STD_LOGIC_VECTOR (5 DOWNTO 0) := "110001";
		CONSTANT AG_3 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "110010";
		CONSTANT R1_2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "110011";
		CONSTANT AG2 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "110100";
		CONSTANT ENCH3 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "110101";
		CONSTANT SB_3 : STD_LOGIC_VECTOR (5 DOWNTO 0) := "110110";
		
		
		-- ESTADOS AGITACAO
		CONSTANT PAUSE_AGITACAO : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
		CONSTANT MAH: STD_LOGIC_VECTOR (2 DOWNTO 0) := "001";
		CONSTANT PAUSA_MAH : STD_LOGIC_VECTOR (2 DOWNTO 0) := "010";
		CONSTANT MH : STD_LOGIC_VECTOR (2 DOWNTO 0) := "011";
		CONSTANT PAUSA_MH : STD_LOGIC_VECTOR (2 DOWNTO 0) := "100";
		
		-- ESTADOS R1
		CONSTANT R1C_1 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
		CONSTANT R1C_2: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0001";
		CONSTANT R1C_3 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0010";
		CONSTANT R1C_4 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0011";
		CONSTANT R1C_5 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0100";
		CONSTANT R1C_6 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0101";
		CONSTANT R1C_7: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0110";
		CONSTANT R1C_8 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0111";
		CONSTANT R1C_9 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1000";
		CONSTANT R1C_10 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1001";
		CONSTANT R1C_11 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1010";
		CONSTANT R1C_12 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1011";
		CONSTANT R1C_PAUSE: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1100";
		
		CONSTANT R1V_LIGA : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
		CONSTANT R1V_DESLIGA: STD_LOGIC_VECTOR (1 DOWNTO 0) := "01";
		CONSTANT R1V_PAUSE: STD_LOGIC_VECTOR (1 DOWNTO 0) := "10";
		
		-- ESTADOS AG_ML
		CONSTANT AG_ML_PAUSE: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
		CONSTANT AG_ML_1: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0001";
		CONSTANT AG_ML_2: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0010";
		CONSTANT AG_ML_3: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0011";
		CONSTANT AG_ML_4: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0100";
		CONSTANT AG_ML_5: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0101";
		CONSTANT AG_ML_6: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0110";
		CONSTANT AG_ML_7: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0111";
		CONSTANT AG_ML_8: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1000";
		CONSTANT AG_ML_9: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1001";
		CONSTANT AG_ML_10: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1010";
		
		-- PROGRAMAS
		CONSTANT PROGRAMA_PAUSE : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
		CONSTANT TIRA_MANCHAS : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0001";
		CONSTANT JEANS : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0010";
		CONSTANT PESADO : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0011";
		CONSTANT EDREDON : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0101";
		CONSTANT DELICADO: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0110";
		CONSTANT RAPIDO : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0111";
		CONSTANT ENXAGUES : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1000";
		CONSTANT NORMAL : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1001";
		CONSTANT NORMAL_SEM_MOLHO : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1010";
		CONSTANT MOLHO_DINAMICO : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1011";
		CONSTANT ENXAGUE : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1100";
		CONSTANT CENTRIFUGACAO : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1101";
		
		SIGNAL ESTADO : STD_LOGIC_VECTOR (5 DOWNTO 0) := "011100";
		SIGNAL COUNTER : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL COUNTER_SECONDS : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		
		-- AGITACAO
		SIGNAL COUNTER_AGITACAO : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL COUNTER_CENTISECONDS_AGITACAO : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL ESTADO_AGITACAO : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
		SIGNAL AGIT : STD_LOGIC := '0';
		
		-- R1
		SIGNAL COUNTER_R1 : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL COUNTER_SECONDS_R1 : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL COUNTER_R1_V : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL COUNTER_SECONDS_R1_V : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL COUNTER_SECONDS_R1_V_TOTAL : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL ESTADO_R1C : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
		SIGNAL ESTADO_R1V : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
		SIGNAL R1_SIGNAL : STD_LOGIC := '0';
		
		-- AG/ML
		SIGNAL COUNTER_AG_ML : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL COUNTER_SECONDS_AG_ML : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
		SIGNAL ESTADO_AG_ML : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
		SIGNAL AG_ML_SIGNAL : STD_LOGIC := '0';
		
		SIGNAL PRESSOSTATO : STD_LOGIC;
		SIGNAL START : STD_LOGIC;
		SIGNAL PROGRAMA_ESCOLHIDO : STD_LOGIC_VECTOR (3 DOWNTO 0);
		SIGNAL PROGRAMA : STD_LOGIC_VECTOR (3 DOWNTO 0);
		
	BEGIN
		LEDM_C <= "11110";
		PRESSOSTATO <= KEY(0);
		START <= KEY(1);
		PROGRAMA_ESCOLHIDO <= SW;

		WITH ESTADO SELECT
			DISP0_D <=  a0  WHEN TRAV,
						   a1  WHEN ENCH,
						   a2  WHEN AG_ML,
						   a3  WHEN SB,
						   a4  WHEN DREN_1,
							a5  WHEN DREN_2,
						   a6  WHEN R9_LIGA,
							a7  WHEN R9_DESLIGA,
						   a8  WHEN R1,
					      a9  WHEN R4_LIGA,
							a0 WHEN R4_DESLIGA,
						   a1 WHEN TRAV2,
						   a2 WHEN ENCH2,
			   			a3 WHEN AG,
			    		   a4 WHEN AM,
			     		   a5 WHEN AG_2,
			      		a6 WHEN SB_2,
			      		a7 WHEN DREN2_1,
							a8 WHEN DREN2_2,
			      		a9  WHEN R9_2LIGA,
							a0	 WHEN R9_2DESLIGA,
							a1  WHEN R3_LIGA,
							a2  WHEN R3_DESLIGA,
							a3  WHEN CT,
							a4  WHEN R5_DESLIGA,
							a5  WHEN R5_LIGA,
			      		err WHEN OTHERS;
			
		
		WITH ESTADO SELECT
			DISP1_D <=  a0  WHEN TRAV,
						   a0  WHEN ENCH,
						   a0  WHEN AG_ML,
						   a0  WHEN SB,
						   a0  WHEN DREN_1,
							a0  WHEN DREN_2,
						   a0  WHEN R9_LIGA,
							a0  WHEN R9_DESLIGA,
						   a0  WHEN R1,
					      a0  WHEN R4_LIGA,
							a1  WHEN R4_DESLIGA,
						   a1  WHEN TRAV2,
						   a1  WHEN ENCH2,
			   			a1 WHEN AG,
			    		   a1 WHEN AM,
			     		   a1 WHEN AG_2,
			      		a1 WHEN SB_2,
			      		a1 WHEN DREN2_1,
							a1 WHEN DREN2_2,
			      		a1 WHEN R9_2LIGA,
							a2 WHEN R9_2DESLIGA,          
							a2 WHEN R3_LIGA,
							a2 WHEN R3_DESLIGA,
							a2 WHEN CT,
							a2 WHEN R5_DESLIGA,
							a2 WHEN R5_LIGA,
							err WHEN OTHERS;
		
		
		AGIT_SIGNAL : PROCESS (ESTADO, ESTADO_AG_ML)
		BEGIN
			IF (ESTADO = AG OR ESTADO = AG_2 OR ESTADO = AG_3 OR ESTADO = AG2 OR ESTADO_AG_ML = AG_ML_1 OR ESTADO_AG_ML = AG_ML_3 OR ESTADO_AG_ML = AG_ML_5
				 OR ESTADO_AG_ML = AG_ML_7 OR ESTADO_AG_ML = AG_ML_9) THEN
				AGIT <= '1';
			ELSE
				AGIT <= '0';
			END IF;	 
		END PROCESS;
		
		ESCOLHE_PROGRAMA: PROCESS (START, PROGRAMA_ESCOLHIDO)
		BEGIN
			IF (START = '1') THEN
				IF (PROGRAMA_ESCOLHIDO = TIRA_MANCHAS) THEN
					PROGRAMA <= TIRA_MANCHAS;
				ELSIF (PROGRAMA_ESCOLHIDO = JEANS) THEN
					PROGRAMA <= JEANS;
				ELSIF (PROGRAMA_ESCOLHIDO = PESADO) THEN
					PROGRAMA <= PESADO;
				ELSIF (PROGRAMA_ESCOLHIDO = EDREDON) THEN
					PROGRAMA <= EDREDON;
				ELSIF (PROGRAMA_ESCOLHIDO = DELICADO) THEN
					PROGRAMA <= DELICADO;
				ELSIF (PROGRAMA_ESCOLHIDO = RAPIDO) THEN
					PROGRAMA <= RAPIDO;
				ELSIF (PROGRAMA_ESCOLHIDO = ENXAGUES) THEN
					PROGRAMA <= ENXAGUES;
				ELSIF (PROGRAMA_ESCOLHIDO = NORMAL) THEN
					PROGRAMA <= NORMAL;
				ELSIF (PROGRAMA_ESCOLHIDO = NORMAL_SEM_MOLHO) THEN
					PROGRAMA <= NORMAL_SEM_MOLHO;
				ELSIF (PROGRAMA_ESCOLHIDO = MOLHO_DINAMICO) THEN
					PROGRAMA <= MOLHO_DINAMICO;
				ELSIF (PROGRAMA_ESCOLHIDO = ENXAGUE) THEN
					PROGRAMA <= ENXAGUE;
				ELSIF (PROGRAMA_ESCOLHIDO = CENTRIFUGACAO) THEN
					PROGRAMA <= CENTRIFUGACAO;
				ELSE
					PROGRAMA <= PROGRAMA_PAUSE;
				END IF;
			END IF;	 
		END PROCESS;
						
		WITH ESTADO SELECT
			R1_SIGNAL <= '1' WHEN R1,
							 '1' WHEN R1_2,
							 '0' WHEN OTHERS;
			
		WITH ESTADO SELECT
			AG_ML_SIGNAL <= '1' WHEN AG_ML,
						'0' WHEN OTHERS;			
						
		LEDM_R(6) <= '1';
		LEDM_R(7) <= '1';	
		
		
		-- LEDM_R(0) REPRESENTA O MOTOR HORÁRIO
		MOTOR_HORARIO: PROCESS (ESTADO, ESTADO_AGITACAO)
		BEGIN
			IF (ESTADO = R9_LIGA OR ESTADO = R9_2LIGA OR ESTADO = R9_3LIGA OR ESTADO = R8_2 
				OR ESTADO = R7_1 OR ESTADO = R2_1 OR ESTADO = R2_3 
				OR ESTADO = R4_LIGA OR ESTADO = R5_LIGA OR ESTADO = R3_LIGA OR ESTADO = CT
				OR ESTADO = R6_1 OR ESTADO = R6_3 OR ESTADO = R6_5 OR ESTADO = R6_7 OR ESTADO = R6_9 OR ESTADO = R6_11
				OR ESTADO_R1C = R1C_1 OR ESTADO_R1C = R1C_3 OR ESTADO_R1C = R1C_5 OR ESTADO_R1C = R1C_7 OR ESTADO_R1C = R1C_9
				OR ESTADO_R1C = R1C_11 OR ESTADO_AGITACAO = MH) THEN
				LEDM_R(0) <= '0';
			ELSE
				LEDM_R(0) <= '1';
			END IF;
		END PROCESS;
						
		FREIO: PROCESS (ESTADO, ESTADO_AGITACAO)
		BEGIN
			IF (ESTADO = R9_LIGA OR ESTADO = R9_2LIGA OR ESTADO = R9_3LIGA OR ESTADO = R8_2
				OR ESTADO = R7_1 OR ESTADO = R2_1 OR ESTADO = R2_3 
				OR ESTADO = R4_LIGA OR ESTADO = R5_LIGA OR ESTADO = R3_LIGA OR ESTADO = CT
				OR ESTADO = R6_1 OR ESTADO = R6_3 OR ESTADO = R6_5 OR ESTADO = R6_7 OR ESTADO = R6_9 OR ESTADO = R6_11
				OR ESTADO_R1C = R1C_1 OR ESTADO_R1C = R1C_3 OR ESTADO_R1C = R1C_5 OR ESTADO_R1C = R1C_7 OR ESTADO_R1C = R1C_9
				OR ESTADO_R1C = R1C_11 OR ESTADO_AGITACAO = MH OR ESTADO_AGITACAO = MAH) THEN
				LEDM_R(1) <= '1';
			ELSE
				LEDM_R(1) <= '0';
			END IF;
		END PROCESS;				 
							 
		WITH ESTADO SELECT
			-- LEDM_R(2) REPRESENTA BOMBA DE DRENAGEM
			LEDM_R(2) <=   '0' WHEN DREN_1,
								'0' WHEN DREN_2,
								'0' WHEN DREN2_1,
								'0' WHEN DREN2_2,
								'1' WHEN  OTHERS;
		
		WITH ESTADO SELECT
			-- LEDM_R(3) REPRESENTA A VALVULA DE AMACIANTE
			LEDM_R(3) <= '0' WHEN AM,
								'1' WHEN OTHERS;
								
		-- LEDM_R(4) REPRESENTA A VALVULA PRINCIPAL
		VALVULA: PROCESS (ESTADO, ESTADO_R1V)
		BEGIN
			IF (ESTADO = ENCH OR ESTADO = ENCH2 OR ESTADO = ENCH3 OR ESTADO_R1V = R1V_LIGA) THEN
				LEDM_R(4) <= '0';
			ELSE
				LEDM_R(4) <= '1';
			END IF;
		END PROCESS;
								
		WITH ESTADO_AGITACAO SELECT
			-- LEDM_R(5) REPRESENTA MOTOR ANTI HORARIO
			LEDM_R(5) <= '0' WHEN MAH,
								'1' WHEN OTHERS;
							
		PRINCIPAL: PROCESS(KEY, CLOCK_50MHz)
		BEGIN
			IF (RISING_EDGE(CLOCK_50MHz)) THEN
					IF (ESTADO = PAUSE AND KEY(1) = '1') THEN
						
						IF (PROGRAMA = CENTRIFUGACAO) THEN
							ESTADO <= DREN_1;
						ELSE
							ESTADO <= TRAV;
						END IF;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = TRAV AND COUNTER_SECONDS = 2) THEN
					
						ESTADO <= ENCH;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
					
					ELSIF (ESTADO = ENCH AND PRESSOSTATO = '1') THEN
					
						IF (PROGRAMA = RAPIDO OR PROGRAMA = NORMAL_SEM_MOLHO) THEN
							ESTADO <= AG;
						ELSIF (PROGRAMA = ENXAGUE) THEN
							ESTADO <= R9_LIGA;
						ELSE
							ESTADO <= AG_ML;
						END IF;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
					
					ELSIF (ESTADO = AG_ML) THEN
						IF (PROGRAMA = MOLHO_DINAMICO AND COUNTER_SECONDS = 4980) THEN
							ESTADO <= SB2;
						ELSIF (PROGRAMA = NORMAL AND COUNTER_SECONDS = 3000) THEN 	
							ESTADO <= SB; -- SÓ NO MODO ECONOMIA
						ELSIF (PROGRAMA = ENXAGUES AND COUNTER_SECONDS = 2760) THEN
							ESTADO <= SB;
						ELSIF (PROGRAMA = DELICADO AND COUNTER_SECONDS = 1680) THEN
							ESTADO <= SB;
						ELSIF (PROGRAMA = EDREDON AND COUNTER_SECONDS = 2520) THEN
							ESTADO <= SB;
						ELSIF (PROGRAMA = JEANS AND COUNTER_SECONDS = 2280) THEN
							ESTADO <= SB;
						ELSIF (PROGRAMA = PESADO AND COUNTER_SECONDS = 4200) THEN
							ESTADO <= SB;
						ELSIF (PROGRAMA = TIRA_MANCHAS AND COUNTER_SECONDS = 5040) THEN
							ESTADO <= SB;
						END IF;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
							
					ELSIF (ESTADO = SB AND COUNTER_SECONDS = 2) THEN 
						ESTADO <= DREN_1;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = DREN_1 AND PRESSOSTATO = '0') THEN
					
						ESTADO <= DREN_2;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = DREN_2 AND COUNTER_SECONDS = 60) THEN
						
						IF (PROGRAMA = ENXAGUES) THEN
							ESTADO <= ENCH2;
						ELSIF (PROGRAMA = ENXAGUE) THEN
							ESTADO <= R9_2LIGA;
						ELSIF (PROGRAMA = MOLHO_DINAMICO) THEN
							ESTADO <= PAUSE;
						ELSE
							ESTADO <= R9_LIGA;
						END IF;
					
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R9_LIGA AND COUNTER_SECONDS = 2) THEN 
						
						ESTADO <= R9_DESLIGA;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
		
					ELSIF (ESTADO = R9_DESLIGA AND COUNTER_SECONDS = 20) THEN

						IF (PROGRAMA = RAPIDO) THEN
							ESTADO <= R9_2LIGA;
						ELSIF (PROGRAMA = ENXAGUES OR PROGRAMA = CENTRIFUGACAO) THEN
							ESTADO <= R3_LIGA;
						ELSE
							ESTADO <= R1;
						END IF;	
							
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R1 AND COUNTER_SECONDS = 63) THEN
					
						ESTADO <= R4_LIGA;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R4_LIGA AND COUNTER_SECONDS = 30) THEN
					
						ESTADO <= R4_DESLIGA;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R4_DESLIGA AND COUNTER_SECONDS = 100) THEN
					
						IF (PROGRAMA = ENXAGUES) THEN
							ESTADO <= AG2;
						ELSE	
							ESTADO <= TRAV2;
						END IF;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
					
					ELSIF (ESTADO = TRAV2 AND COUNTER_SECONDS = 2) THEN
					
						IF (PROGRAMA = ENXAGUES) THEN
							ESTADO <= ENCH3;
						ELSE	
							ESTADO <= ENCH2;
						END IF;
						
						COUNTER <= (OTHERS =>'0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = ENCH2 AND PRESSOSTATO = '1') THEN
						
						IF (PROGRAMA = NORMAL_SEM_MOLHO OR PROGRAMA = RAPIDO) THEN
							ESTADO <= AG_2;
						ELSE	
							ESTADO <= AG;
						END IF;	
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = AG) THEN
					
						IF ((PROGRAMA = NORMAL OR PROGRAMA = TIRA_MANCHAS OR PROGRAMA = JEANS OR PROGRAMA = PESADO OR PROGRAMA = EDREDON OR PROGRAMA = DELICADO OR PROGRAMA = ENXAGUES OR PROGRAMA = ENXAGUE)  AND COUNTER_SECONDS = 120) THEN
							ESTADO <= AM;
						ELSIF (PROGRAMA = RAPIDO AND COUNTER_SECONDS = 60) THEN		
							ESTADO <= SB;
						ELSIF (PROGRAMA = NORMAL_SEM_MOLHO AND COUNTER_SECONDS = 600) THEN
							ESTADO <= SB;
						END IF;	
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = AM AND COUNTER_SECONDS = 15) THEN
					
						IF (PROGRAMA = RAPIDO) THEN
							ESTADO <= TRAV2;
						ELSIF (PROGRAMA = NORMAL_SEM_MOLHO) THEN
							ESTADO <= AG_3;
						ELSE
							ESTADO <= AG_2;
						END IF;	
							
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = AG_2 AND COUNTER_SECONDS = 120) THEN
					
						IF (PROGRAMA = NORMAL_SEM_MOLHO) THEN
							ESTADO <= AM;
						ELSIF (PROGRAMA = ENXAGUES) THEN
							ESTADO <= SB_3;
						ELSE	
							ESTADO <= SB_2; -- SÓ EM MODO ECONOMIA
						END IF;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = SB_2 AND COUNTER_SECONDS = 2) THEN
					
						ESTADO <= DREN2_1;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = DREN2_1 AND PRESSOSTATO = '0') THEN
						ESTADO <= DREN2_2;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
					ELSIF (ESTADO = DREN2_2 AND COUNTER_SECONDS = 160) THEN
					
						IF (PROGRAMA = ENXAGUES) THEN
							ESTADO <= R2_1;
						ELSIF (PROGRAMA = RAPIDO) THEN
							ESTADO <= R9_3LIGA;
						ELSE	
							ESTADO <= R9_2LIGA;
						END IF;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R9_2LIGA AND COUNTER_SECONDS = 10) THEN
					
						ESTADO <= R9_2DESLIGA;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R9_2DESLIGA AND COUNTER_SECONDS = 20) THEN
					
						IF (PROGRAMA = RAPIDO) THEN
							ESTADO <= AM;
						ELSE	
							ESTADO <= R3_LIGA;
						END IF;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R3_LIGA AND COUNTER_SECONDS = 20) THEN
					
						ESTADO <= R3_DESLIGA;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R3_DESLIGA AND COUNTER_SECONDS = 60) THEN
					
						IF (PROGRAMA = ENXAGUES) THEN
							ESTADO <= R1;
						ELSIF (PROGRAMA = DELICADO) THEN
							ESTADO <= R6_1;
						ELSE					
							ESTADO <= CT;
						END IF;
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = CT) THEN
					
						IF (PROGRAMA = PESADO AND COUNTER_SECONDS = 600) THEN
							ESTADO <= R5_DESLIGA;
						ELSIF (PROGRAMA = RAPIDO AND COUNTER_SECONDS = 240) THEN
							ESTADO <= R8_1;
						ELSIF (PROGRAMA = CENTRIFUGACAO AND COUNTER_SECONDS = 840) THEN
							ESTADO <= R5_DESLIGA;
						ELSIF (PROGRAMA = TIRA_MANCHAS AND COUNTER_SECONDS = 720) THEN
							ESTADO <= PAUSE;
						ELSIF (COUNTER_SECONDS = 720) THEN
							ESTADO <= R5_DESLIGA;
						END IF;	
						
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R5_DESLIGA AND COUNTER_SECONDS = 100) THEN 
					
						ESTADO <= R5_LIGA;
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R5_LIGA AND COUNTER_SECONDS = 5) THEN
					
						ESTADO <= PAUSE; -- ESTADO FINAL
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = AG2 AND COUNTER_SECONDS = 2) THEN
					
						ESTADO <= SB_2; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = SB_3 AND COUNTER_SECONDS = 2) THEN
					
						ESTADO <= DREN2_1; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = SB2 AND COUNTER_SECONDS = 2) THEN
					
						ESTADO <= DREN_1; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R2_1 AND COUNTER_SECONDS = 10) THEN
					
						ESTADO <= R2_2; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R2_2 AND COUNTER_SECONDS = 20) THEN
					
						ESTADO <= R2_3; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R2_3 AND COUNTER_SECONDS = 30) THEN
					
						ESTADO <= R2_4; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R2_4 AND COUNTER_SECONDS = 50) THEN
					
						ESTADO <= CT; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R9_3LIGA AND COUNTER_SECONDS = 10) THEN
					
						ESTADO <= R9_3DESLIGA; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
					
					ELSIF (ESTADO = R9_3DESLIGA AND COUNTER_SECONDS = 20) THEN
					
						ESTADO <= R7_1; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
					ELSIF (ESTADO = R7_1 AND COUNTER_SECONDS = 30) THEN
					
						ESTADO <= R7_2; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');
						
					ELSIF (ESTADO = R7_2 AND COUNTER_SECONDS = 40) THEN
					
						ESTADO <= CT; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
					ELSIF (ESTADO = R8_1 AND COUNTER_SECONDS = 40) THEN
					
						ESTADO <= R8_2; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
					
					ELSIF (ESTADO = R8_2 AND COUNTER_SECONDS = 5) THEN
					
						ESTADO <= PAUSE; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
					
					ELSIF (ESTADO = R6_1 AND COUNTER_SECONDS = 50) THEN
					
						ESTADO <= R6_2; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
					ELSIF (ESTADO = R6_2 AND COUNTER_SECONDS = 70) THEN
					
						ESTADO <= R6_3; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
						ELSIF (ESTADO = R6_3 AND COUNTER_SECONDS = 50) THEN
					
						ESTADO <= R6_4; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
						ELSIF (ESTADO = R6_4 AND COUNTER_SECONDS = 70) THEN
					
						ESTADO <= R6_5; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
						ELSIF (ESTADO = R6_5 AND COUNTER_SECONDS = 50) THEN
					
						ESTADO <= R6_6; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
						ELSIF (ESTADO = R6_6 AND COUNTER_SECONDS = 70) THEN
					
						ESTADO <= R6_7; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
						ELSIF (ESTADO = R6_7 AND COUNTER_SECONDS = 50) THEN
					
						ESTADO <= R6_8; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
						ELSIF (ESTADO = R6_8 AND COUNTER_SECONDS = 70) THEN
					
						ESTADO <= R6_9; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
						ELSIF (ESTADO = R6_9 AND COUNTER_SECONDS = 50) THEN
					
						ESTADO <= R6_10; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
						
						ELSIF (ESTADO = R6_10 AND COUNTER_SECONDS = 70) THEN
					
						ESTADO <= R6_11; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
							
							
					ELSIF (ESTADO = R6_11 AND COUNTER_SECONDS = 50) THEN
					
						ESTADO <= R6_12; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
				
					ELSIF (ESTADO = R6_12 AND COUNTER_SECONDS = 70) THEN
					
						ESTADO <= R5_DESLIGA; 
						COUNTER <= (OTHERS => '0');
						COUNTER_SECONDS <= (OTHERS => '0');	
					
					ELSE
						COUNTER <= COUNTER + 1;
						IF (COUNTER = 50000000) THEN
							COUNTER_SECONDS <= COUNTER_SECONDS + 1;
							COUNTER <= (OTHERS => '0');
						END IF;
				END IF;	
			END IF;	
		END PROCESS;
		
		AGITACAO: PROCESS (CLOCK_50MHZ)
		BEGIN	
			IF (RISING_EDGE(CLOCK_50MHz)) THEN
				IF (ESTADO_AGITACAO = PAUSE_AGITACAO AND AGIT = '1') THEN
					ESTADO_AGITACAO <= MAH;
					COUNTER_AGITACAO <= (OTHERS => '0');
					COUNTER_CENTISECONDS_AGITACAO <= (OTHERS => '0');
				ELSIF (ESTADO_AGITACAO = MAH AND COUNTER_CENTISECONDS_AGITACAO = 25 AND AGIT = '1') THEN
					ESTADO_AGITACAO <= PAUSA_MAH;
					COUNTER_AGITACAO <= (OTHERS => '0');
					COUNTER_CENTISECONDS_AGITACAO <= (OTHERS => '0');
				ELSIF (ESTADO_AGITACAO = PAUSA_MAH AND COUNTER_CENTISECONDS_AGITACAO = 50 AND AGIT = '1') THEN
					ESTADO_AGITACAO <= MH;
					COUNTER_AGITACAO <= (OTHERS => '0');
					COUNTER_CENTISECONDS_AGITACAO <= (OTHERS => '0');
				ELSIF (ESTADO_AGITACAO = MH AND COUNTER_CENTISECONDS_AGITACAO = 30 AND AGIT = '1') THEN
					ESTADO_AGITACAO <= PAUSA_MH;
					COUNTER_AGITACAO <= (OTHERS => '0');
					COUNTER_CENTISECONDS_AGITACAO <= (OTHERS => '0');
					ELSIF (ESTADO_AGITACAO = PAUSA_MH AND COUNTER_CENTISECONDS_AGITACAO = 50 AND AGIT = '1') THEN
					ESTADO_AGITACAO <= MAH;
					COUNTER_AGITACAO <= (OTHERS => '0');
					COUNTER_CENTISECONDS_AGITACAO <= (OTHERS => '0');
				ELSIF (AGIT = '0') THEN
					ESTADO_AGITACAO <= PAUSE_AGITACAO;
				ELSE
					COUNTER_AGITACAO <= COUNTER_AGITACAO + 1;
					IF (COUNTER_AGITACAO = 500000) THEN
						COUNTER_CENTISECONDS_AGITACAO <= COUNTER_CENTISECONDS_AGITACAO + 1;
						COUNTER_AGITACAO <= (OTHERS => '0');
					END IF;
				END IF;
			END IF;	
		END PROCESS;
		
		
		AGIT_ML: PROCESS (CLOCK_50MHZ) -- AGITAÇÃO/MOLHO
		BEGIN	
			IF (RISING_EDGE(CLOCK_50MHz)) THEN
				IF (ESTADO_AG_ML = AG_ML_PAUSE AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_1;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_1 AND COUNTER_SECONDS_AG_ML = 240 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_2;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');	
				ELSIF (ESTADO_AG_ML = AG_ML_2 AND COUNTER_SECONDS_AG_ML = 300 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_3;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_3 AND COUNTER_SECONDS_AG_ML = 180 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_4;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_4 AND COUNTER_SECONDS_AG_ML = 300 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_5;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_5 AND COUNTER_SECONDS_AG_ML = 240 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_6;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_6 AND COUNTER_SECONDS_AG_ML = 300 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_7;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_7 AND COUNTER_SECONDS_AG_ML = 180 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_8;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_8 AND COUNTER_SECONDS_AG_ML = 300 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_9;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_9 AND COUNTER_SECONDS_AG_ML = 180 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_10;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (ESTADO_AG_ML = AG_ML_10 AND COUNTER_SECONDS_AG_ML = 300 AND AG_ML_SIGNAL = '1') THEN
					ESTADO_AG_ML <= AG_ML_1;
					COUNTER_AG_ML <= (OTHERS => '0');
					COUNTER_SECONDS_AG_ML <= (OTHERS => '0');
				ELSIF (AG_ML_SIGNAL = '0') THEN
					ESTADO_AG_ML <= AG_ML_PAUSE;
				ELSE
					COUNTER_AG_ML <= COUNTER_AG_ML + 1;
					IF (COUNTER_AG_ML = 50000000) THEN
						COUNTER_SECONDS_AG_ML <= COUNTER_SECONDS_AG_ML + 1;
						COUNTER_AG_ML <= (OTHERS => '0');
					END IF;
				END IF;
			END IF;	
		END PROCESS;
		
		R1V: PROCESS (CLOCK_50MHZ) -- VALVULA PRINCIPAL R1
		BEGIN	
			IF (RISING_EDGE(CLOCK_50MHz)) THEN
				IF (ESTADO_R1V = R1V_PAUSE AND R1_SIGNAL = '1') THEN
					ESTADO_R1V <= R1V_LIGA;
					COUNTER_R1_V <= (OTHERS => '0');
					COUNTER_SECONDS_R1_V <= (OTHERS => '0');
				ELSIF (ESTADO_R1V = R1V_LIGA AND COUNTER_SECONDS_R1_V = 5 AND R1_SIGNAL = '1') THEN
					ESTADO_R1V <= R1V_DESLIGA;
					COUNTER_R1_V <= (OTHERS => '0');
					COUNTER_SECONDS_R1_V <= (OTHERS => '0');	
				ELSIF (ESTADO_R1V = R1V_DESLIGA AND COUNTER_SECONDS_R1_V = 5 AND COUNTER_SECONDS_R1_V_TOTAL <= 55 AND R1_SIGNAL = '1') THEN
					ESTADO_R1V <= R1V_LIGA;
					COUNTER_R1_V <= (OTHERS => '0');
					COUNTER_SECONDS_R1_V <= (OTHERS => '0');
				ELSIF (ESTADO_R1V = R1V_DESLIGA AND COUNTER_SECONDS_R1_V = 8 AND COUNTER_SECONDS_R1_V_TOTAL > 55 AND R1_SIGNAL = '1') THEN
					ESTADO_R1V <= R1V_PAUSE;
					COUNTER_R1_V <= (OTHERS => '0');
					COUNTER_SECONDS_R1_V <= (OTHERS => '0');
				ELSIF (R1_SIGNAL = '0') THEN
					ESTADO_R1V <= R1V_PAUSE;
				ELSE
					COUNTER_R1_V <= COUNTER_R1_V + 1;
					IF (COUNTER_R1_V = 50000000) THEN
						COUNTER_SECONDS_R1_V <= COUNTER_SECONDS_R1_V + 1;
						COUNTER_SECONDS_R1_V_TOTAL <= COUNTER_SECONDS_R1_V_TOTAL + 1;
						COUNTER_R1_V <= (OTHERS => '0');
					END IF;
				END IF;
			END IF;	
		END PROCESS;
		
		R1C: PROCESS (CLOCK_50MHZ) -- CESTO PRINCIPAL R1
		BEGIN	
			IF (RISING_EDGE(CLOCK_50MHz)) THEN
				IF (ESTADO_R1C = R1C_PAUSE AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_1;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_1 AND COUNTER_SECONDS_R1 = 3 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_2;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_2 AND COUNTER_SECONDS_R1 = 5 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_3;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_3 AND COUNTER_SECONDS_R1 = 3 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_4;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_4 AND COUNTER_SECONDS_R1 = 6 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_5;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_5 AND COUNTER_SECONDS_R1 = 3 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_6;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_6 AND COUNTER_SECONDS_R1 = 7 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_7;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_7 AND COUNTER_SECONDS_R1 = 3 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_8;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_8 AND COUNTER_SECONDS_R1 = 8 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_9;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_9 AND COUNTER_SECONDS_R1 = 3 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_10;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_10 AND COUNTER_SECONDS_R1 = 9 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_11;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (ESTADO_R1C = R1C_11 AND COUNTER_SECONDS_R1 = 3 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_12;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
					ELSIF (ESTADO_R1C = R1C_12 AND COUNTER_SECONDS_R1 = 10 AND R1_SIGNAL = '1') THEN
					ESTADO_R1C <= R1C_PAUSE;
					COUNTER_R1 <= (OTHERS => '0');
					COUNTER_SECONDS_R1 <= (OTHERS => '0');
				ELSIF (R1_SIGNAL = '0') THEN
					ESTADO_R1C <= R1C_PAUSE;
				ELSE
					COUNTER_R1 <= COUNTER_R1 + 1;
					IF (COUNTER_R1 = 50000000) THEN
						COUNTER_SECONDS_R1 <= COUNTER_SECONDS_R1 + 1;
						COUNTER_R1 <= (OTHERS => '0');
					END IF;
				END IF;
			END IF;	
	END PROCESS;
		-- End architecture
	END;
