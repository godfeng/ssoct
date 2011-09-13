--
-- Brief: Controls the Avalon MM-Master Write Module, which is very similar to a normal FIFO buffer.
--

-- Libraries --
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
--USE my_incl.v;

--  Entity Declaration
ENTITY RAMtoDDR2 IS
	GENERIC(
		ADDRESS_WIDTH : NATURAL := 30;
		ADDRESS_TOTAL : NATURAL := 1073741824;
		BYTES_PER_TRANSFER : NATURAL := 32; --256BITS/8
		NBYTES_PER_ALINE : NATURAL := 2368 --1170*2=2340 (Must be a multiple of 32 bytes)
	);
	
	PORT
	(
		RSTn : IN STD_LOGIC;
		CLK50MHZ : IN STD_LOGIC;
		
		-- Control signals to the Avalon MM-Master.
		control_go : BUFFER STD_LOGIC; -- Empties FIFO data in the DDR2.
		control_write_base : BUFFER UNSIGNED(ADDRESS_WIDTH-1 DOWNTO 0); -- In bytes.									
		control_write_length : BUFFER UNSIGNED(ADDRESS_WIDTH-1 DOWNTO 0); -- In bytes. Don't transfer more data than length, otherwise there will be an overflow.
		control_done : IN STD_LOGIC; -- Only used to make sure the transfer is done before starting a new one.
		
		-- FIFO signals to the Avalon MM-Master.
		user_buffer_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
		user_buffer_full : IN STD_LOGIC;
		user_write_buffer : BUFFER STD_LOGIC;
		
		-- Signals from RAM
		RAM_dataOut : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
		RAM_readAddress : BUFFER UNSIGNED(10 DOWNTO 0);
		acq_done : IN STD_LOGIC
		
	);
	
END RAMtoDDR2;

--  Architecture Body 
ARCHITECTURE RAMtoDDR2_architecture OF RAMtoDDR2 IS

	-- State machine declaration.
	TYPE stateMachine IS (State_CheckAcqDone, State_CheckAcqDone2, State_CheckControllerReady, State_CheckFIFOFull, State_Writing, State_Done);
	SIGNAL state : stateMachine;
	
	-- Internal value of user_write_buffer.
	SIGNAL user_write_buffer_internal : STD_LOGIC;
	
    -- Index corresponding to the byte that is being written.
    SIGNAL idxByte : INTEGER RANGE 0 TO 400000;	

BEGIN

PROCESS(RSTn, CLK50MHZ)

BEGIN
IF (RSTn = '0') THEN
	control_go <= '0';
	control_write_base <= TO_UNSIGNED(0,ADDRESS_WIDTH);
	control_write_length <= TO_UNSIGNED(0,ADDRESS_WIDTH);
	state <= State_CheckAcqDone;
	user_write_buffer_internal <= '0';
    idxByte <= 0;
    RAM_readAddress <= (OTHERS => '0');
    
ELSIF (CLK50MHZ'EVENT AND CLK50MHZ = '1') THEN
	control_go <= '0';
	user_write_buffer_internal <= '0';
	state <= state;
						
	CASE state IS
        
        WHEN State_CheckAcqDone => -- Make sure the DDR2 is not full.
			IF acq_done = '0' THEN
				state <= State_CheckAcqDone2;
			END IF;

        WHEN State_CheckAcqDone2 => -- Make sure the DDR2 is not full.
			IF acq_done = '1' THEN
				RAM_readAddress <= (OTHERS => '0');
				idxByte <= 0;
				state <= State_CheckControllerReady;
			END IF;
            			
		WHEN State_CheckControllerReady => -- Make sure the controller is ready to receive data.
		
			IF control_done = '1' AND user_buffer_full = '0' THEN
				state <= State_CheckFIFOFull;
				control_write_base <= TO_UNSIGNED(TO_INTEGER(control_write_length)+1,ADDRESS_WIDTH); -- In bytes.
                control_write_length <= TO_UNSIGNED(NBYTES_PER_ALINE,ADDRESS_WIDTH); -- In bytes.         
			END IF;
			
		WHEN State_CheckFIFOFull => 
		
			IF user_buffer_full = '0' THEN -- Not full.
				state <= State_Writing;		
			END IF;
		
		WHEN State_Writing =>
		
            -- One go pulse just after we begin the transfer. At least one data must be written before asserting this signal.
			IF idxByte = BYTES_PER_TRANSFER THEN
				control_go <= '1';
			END IF;	
            
            -- Check if buffer is full. If it is, the last data was not written, so we need to decrement the counter.
            IF user_buffer_full = '0' THEN
                -- The last data was written correctly. Now we check if we are done writing. If not, we write and increment the counter.
                IF idxByte < NBYTES_PER_ALINE THEN
                    RAM_readAddress <= RAM_readAddress + 1;
                            
                    user_buffer_data <= RAM_dataOut;
                    idxByte <= idxByte + BYTES_PER_TRANSFER; -- In bytes.
                    user_write_buffer_internal <= '1';
                ELSE
                    state <= State_Done;
                END IF;
            ELSE 
                state <= State_CheckFIFOFull;
                idxByte <= idxByte - BYTES_PER_TRANSFER; -- In bytes.
                RAM_readAddress <= RAM_readAddress - 1;					
            END IF;		
            
		WHEN State_Done =>
		
            state <= State_CheckAcqDone;
																	
		WHEN OTHERS =>
		
			state <= State_CheckAcqDone;
				
	END CASE;	
END IF;

END PROCESS;

-- user_write_buffer must be in combinational logic.
user_write_buffer <= '1' WHEN (user_buffer_full = '0' AND user_write_buffer_internal = '1') ELSE '0';

END RAMtoDDR2_architecture;
