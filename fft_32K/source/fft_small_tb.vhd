--	Copyright (C) 1988-2004 Altera Corporation
--	Any megafunction design, and related net list (encrypted or decrypted),
--	support information, device programming or simulation file, and any other
--	associated documentation or information provided by Altera or a partner
--	under Altera's Megafunction Partnership Program may be used only to
--	program PLD devices (but not masked PLD devices) from Altera.  Any other
--	use of such megafunction design, net list, support information, device
--	programming or simulation file, or any other related documentation or
--	information is prohibited for any other purpose, including, but not
--	limited to modification, reverse engineering, de-compiling, or use with
--	any other silicon devices, unless such use is explicitly licensed under
--	a separate agreement with Altera or a megafunction partner.  Title to
--	the intellectual property, including patents, copyrights, trademarks,
--	trade secrets, or maskworks, embodied in any such megafunction design,
--	net list, support information, device programming or simulation file, or
--	any other related documentation or information provided by Altera or a
--	megafunction partner, remains with Altera, the megafunction partner, or
--	their respective licensors.  No other licenses, including any licenses
--	needed under any third party's intellectual property, are provided herein.

--       Altera FFT MegaCore ver 2.1.0 VHDL TESTBENCH
library ieee;                                                                                 
use ieee.std_logic_1164.all;                                                                    
use ieee.std_logic_signed.all;                                                                  
use ieee.std_logic_arith.all;                                                                   
use std.textio.all;                                                                             
entity fft_small_tb is                                                                            
end fft_small_tb;                                                                                 
                                                                                                
architecture tb of fft_small_tb is                                                                
                                                                                                
function int2ustd(value : integer; width : integer) return std_logic_vector is                 
-- convert integer to unsigned std_logicvector                                                 
 variable temp :   std_logic_vector(width-1 downto 0);                                          
	begin                                                                                          
	  if (width>0) then                                                                              
	    temp:=conv_std_logic_vector(conv_unsigned(value, width ), width);                          
	  end if ;                                                                                       
	return temp;                                                                                   
end int2ustd;                                                                                  
	                                                                                               
constant clk_time_step : time :=1 ns;                                                          
signal clk : std_logic;                                                                       
signal reset : std_logic;                                                                     
signal inv_i : std_logic;                                                                     
signal master_sink_sop : std_logic;                                                                       
signal master_sink_dav : std_logic;                                                                       
signal master_sink_ena : std_logic;                                                                       
signal master_sink_ena_reg : std_logic;                                                                   
signal data_real_in : std_logic_vector(15 downto 0);                                                
signal data_imag_in : std_logic_vector(15 downto 0);                                                
signal fft_real_out : std_logic_vector(15 downto 0);                                                
signal fft_imag_out : std_logic_vector(15 downto 0);                                                
signal exponent_out : std_logic_vector(5 downto 0);                                                
signal counter : std_logic_vector(13 downto 0);                                               
signal master_source_sop : std_logic;                                                                       
signal master_source_eop : std_logic;                                                                       
signal master_source_ena : std_logic;                                                                       
signal master_source_dav : std_logic;                                                                       
         	                                                                                     
--------------------------------------------------------------------------------------------                                      
-- FFT Component Declaration
--------------------------------------------------------------------------------------------                                      
component fft_small is                                                                     						 
 port (                                                                           
       clk	: in std_logic;                                                            
       reset	: in std_logic;                                                          
       inv_i	: in std_logic;                                                          
       data_real_in	: in std_logic_vector (15 downto 0);                             
       data_imag_in	: in std_logic_vector (15 downto 0);                             
       fft_real_out	: out std_logic_vector (15 downto 0);                            
       fft_imag_out	: out std_logic_vector (15 downto 0);                            
       exponent_out	: out std_logic_vector (5 downto 0);                            
       master_sink_dav	: in std_logic;                                                          
       master_sink_sop	: in std_logic;                                                          
       master_sink_ena	: out std_logic;                                                          
       master_source_dav	: in std_logic;                                                         
       master_source_ena	: out std_logic;                                                         
       master_source_sop	: out std_logic;                                                           
       master_source_eop	: out std_logic                                                           
);                                                                                 
end component;                                                                            
	                                                                                               
begin                                                                                           
	 -----------------------------------------------------------------------------------------------
  -- Reset Generation                                                                          
	 -----------------------------------------------------------------------------------------------
  reset <='1',                                                                                
          '0' after 92*clk_time_step;                                                          
	 -----------------------------------------------------------------------------------------------
  -- Clock Generation                                                                         
	 -----------------------------------------------------------------------------------------------
  clk_gen : process                                                                            
    begin                                                                                        
      loop                                                                                       
	       clk<='0' ,                                                                           
             '1'	after 5*clk_time_step;                                                            
	             wait for  10*clk_time_step;                                                              
	     end loop;                                                                                  
   end process clk_gen;                                                                                 
		                                                                                             
  -----------------------------------------------------------------------------------------------
  -- Set FFT Direction                                                                           
  -- '0' => FFT                                                                                  
  -- '1' => IFFT                                                                                 
  -----------------------------------------------------------------------------------------------
  inv_i <= '0';                                                                                  
  -----------------------------------------------------------------------------------------------
  -- All FFT MegaCore input signals are registered on the rising edge of the input clock, clk and 
  -- all FFT MegaCore output signals are output on the rising edge of the input clock, clk. 
  -- The testbench generates inputs and montitors output signals to and form the the core on the 
  -- negative edge of the clock avoid the necessity of zero-delay assumptions in post-fitting 
  -- simulation models and ensure expected behavior in all simulation flows.
  -----------------------------------------------------------------------------------------------
  -- Register output signal master_sink_ena on the negative edge of the clock 
  register_master_sink_ena : process(clk) is                                                                
   begin                                                                                         
     if(falling_edge(clk)) then                                                                   
       if(reset='1') then                                                                        
         master_sink_ena_reg <= '0';                                                               
       else                                                                                      
         master_sink_ena_reg <= master_sink_ena;                                                  
       end if;                                                                                   
     end if;                                                                                     
  end process register_master_sink_ena;                                                                     
                                                                                               
  -----------------------------------------------------------------------------------------------
  -- Generate a pulse on master_sink_sop every N clock cycles                 
  -----------------------------------------------------------------------------------------------
  n_sample_count : process(clk) is                                                       
    begin                                                                                         
      if(falling_edge(clk)) then                                                                    
        if(reset='1' or master_sink_ena_reg='0') then                                                                         
          counter <= int2ustd(0,14);                                                     
        else                                                                                       
          counter <= counter + int2ustd(1,14);                                                     
        end if;                                                                                    
      end if;                                                                                      
  end process n_sample_count;                                                                                  
                                                                                                
  -----------------------------------------------------------------------------------------------
  gen_sop_pulse : process(clk) is                                                     
    begin                                                                                        
      if(falling_edge(clk)) then                                                                  
        if(reset='1') then                                                                       
          master_sink_sop<='0';                                                                              
        elsif(counter(13 downto 0)=(13 downto 0 => '0')) then                                         
          if(master_sink_ena_reg='1') then                                                                   
            master_sink_sop<='1';                                                                        
          else                                                                   
            master_sink_sop<='0';                                                                   
          end if;                                                                              
        else                                                                                   
  	     master_sink_sop<='0';                                                                            
  	 end if;                                                                                
      end if;                                                                                  
  end process gen_sop_pulse;                                                                      
  -----------------------------------------------------------------------------------------------
  -- Generate master_sink_dav, master_source_dav input signals                            
  -----------------------------------------------------------------------------------------------
  gen_dav : process(clk) is                                                                      
    begin                                                                                         
      if(falling_edge(clk)) then                                                                   
        if(reset='1') then                                                                        
          master_sink_dav <= '0';                                                                 
          master_source_dav <= '0';                                                               
        else                                                                                      
          master_sink_dav <= '1';                                                                 
          master_source_dav <= '1';                                                               
        end if;                                                                                   
      end if;                                                                                     
  end process gen_dav;                                                                           
  		                                                                                           
	-----------------------------------------------------------------------------------------------
	-- Read input data from files                                                                  
	-----------------------------------------------------------------------------------------------
  testbench_i : process(clk) is                                                           
  file r_file		:	text open	read_mode	is "real_input.txt";                                     
	 file i_file		:	text open	read_mode	is "imag_input.txt";                                       
	 variable rdata		:	line;                                                                      
	 variable data_r	:	integer	;                                                                    
	 variable idata		:	line;                                                                      
	 variable data_i	:	integer	;                                                                    
	 begin                                                                                          
    if falling_edge(clk)	then                                                                     
	     if(reset='1') then                                                                         
        data_real_in<=int2ustd(0,16);                                                                    
        data_imag_in<=int2ustd(0,16);                                                                    
      else                                                                                       
        if not endfile(r_file)	then                                                             
          if(master_sink_ena_reg='1') then                                                                     
            readline(r_file,rdata);                                                              
            read(rdata,data_r);                                                                  
	           readline(i_file,idata);                                                              
	           read(idata,data_i);                                                                  
	           data_real_in<=int2ustd(data_r,16);                                                           
	           data_imag_in<=int2ustd(data_i,16);                                                           
	         else                                                                                   
	           data_real_in<=data_real_in;                                                                            
	           data_imag_in<=data_imag_in;                                                                            
	         end if;                                                                                
	       else                                                                                     
	         data_real_in<=int2ustd(0,16);                                                                  
	         data_imag_in<=int2ustd(0,16);                                                                  
	       end if;                                                                                  
      end if;                                                                                    
    end if;                                                                                    
  end process testbench_i;		                                                                 
 	                                                                                             
 ---------------------------------------------------------------------------------------------
 -- Write Real and Imginary Components and Block Exponent to Files                                               
 ---------------------------------------------------------------------------------------------
 	                                                                                             
  testbench_o : process(clk) is                                                            
  file ro_file		:	text open	write_mode	is "real_output_vhd.txt";                                
	 file io_file		:	text open	write_mode	is "imag_output_vhd.txt";                                
	 file eo_file		:	text open	write_mode	is "exponent_output_vhd.txt";                                
	 variable rdata		:	line;                                                                      
	 variable data_r	:	integer	;                                                                    
	 variable idata		:	line;                                                                      
	 variable data_i	:	integer	;                                                                    
	 variable edata		:	line;                                                                      
	 variable data_e	:	integer	;                                                                    
	 begin                                                                                          
   if falling_edge(clk)  then                                                                   
     if(master_source_ena='1' and reset='0') then                                                                       
       data_r := conv_integer(fft_real_out);                                                           
       data_i := conv_integer(fft_imag_out);                                                           
       data_e := conv_integer(exponent_out);                                                           
       write(rdata, data_r);                                                                  
       writeline(ro_file,rdata);                                                              
       write(idata, data_i);                                                                  
       writeline(io_file,idata);                                                              
       write(edata, data_e);                                                                  
       writeline(eo_file,edata);                                                              
     end if;                                                                                  
   end if;                                                                                    
 end process testbench_o;                                                                     
                                                                                                
 ---------------------------------------------------------------------------------------------
 -- FFT Component Instantiation                                                               
 ---------------------------------------------------------------------------------------------
dut : fft_small                                                                   
 port map(	                                                                    
           clk   => clk,                                                              
           reset => reset,                                                            
           inv_i => inv_i,                                                             
           data_real_in => data_real_in,                                                        
           data_imag_in => data_imag_in,                                                        
           fft_real_out	=> fft_real_out,                                                        
           fft_imag_out	=> fft_imag_out,                                                        
           exponent_out	=> exponent_out,                                                        
           master_sink_sop => master_sink_sop,                                                            
           master_sink_dav => master_sink_dav,                                                            
           master_sink_ena => master_sink_ena,                                                             
           master_source_ena => master_source_ena,                                                      
           master_source_dav => master_source_dav,                                                       
           master_source_sop => master_source_sop,                                                      
           master_source_eop => master_source_eop                                                      
);	                                                                                 
	 	                                                                                             
                                                                                                
end tb;																																												 
