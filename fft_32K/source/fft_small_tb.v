// Copyright (C) 1988-2004 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.

// Altera FFT MegaCore ver 2.1.0 Verilog HDL Testbench
`timescale 1ns / 1ps
                                                 
module fft_small_tb;
                                                              
// Input Signals                                                
reg clk;                                                         
reg reset;                                                       
reg [15:0] data_real_in;                               
reg [15:0] data_imag_in;                                
reg master_sink_dav;                                             
reg master_sink_sop;                                           
reg master_source_dav;                                    
wire inv_i;                                                   

// Output Signals                                              
wire [15:0] fft_real_out;                              
wire [15:0] fft_imag_out;                                
wire [5:0] exponent_out;                                           
wire master_sink_ena;                                               
wire master_source_ena;                                           
wire master_source_sop;                                         
wire master_source_eop;                                   

reg master_sink_ena_reg;                                   
reg [13:0] counter;           
integer data_real_in_int,data_imag_in_int,data_rf,data_if;                
integer fft_real_out_int,fft_imag_out_int, exponent_out_int;
integer fft_rf, fft_if, expf;

  initial                                                        
    begin
      data_rf = $fopen("real_input.txt","r");
      data_if = $fopen("imag_input.txt","r");
      fft_rf = $fopen("real_output_ver.txt");
      fft_if = $fopen("imag_output_ver.txt");
      expf = $fopen("exponent_output_ver.txt");
      #0 clk = 1'b0;
      #0 reset = 1'b1;
      #92 reset = 1'b0;
    end

  ///////////////////////////////////////////////////////////////////////////////////////////////
  // Clock Generation                                                                         
  ///////////////////////////////////////////////////////////////////////////////////////////////
  always
     begin
       #5 clk = 1'b1;
       #5 clk = 1'b0;
     end
		                                                                                             
  ///////////////////////////////////////////////////////////////////////////////////////////////
  // Set FFT Direction      
  // '0' => FFT      
  // '1' => IFFT      
  assign inv_i = 1'b0; 
  ///////////////////////////////////////////////////////////////////////////////////////////////
  // All FFT MegaCore input signals are registered on the rising edge of the input clock, clk and 
  // all FFT MegaCore output signals are output on the rising edge of the input clock, clk. 
  // The testbench generates inputs and montitors output signals to and form the the core on the 
  // negative edge of the clock avoid the necessity of zero-delay assumptions in post-fitting 
  // simulation models and ensure expected behavior in all simulation flows.
  ///////////////////////////////////////////////////////////////////////////////////////////////

  // Register output signal master_sink_ena on the negative edge of the clock 
  always @ (negedge clk)                                                              
    begin                                                                                        
      if(reset==1'b1)                                                                                    
        master_sink_ena_reg <= 1'b0;                                                                      
      else                                                                      
        master_sink_ena_reg <= master_sink_ena;                                                                      
    end 
  ///////////////////////////////////////////////////////////////////////////////////////////////
  // Generate a pulse on master_sink_sop every N clock cycles
  ///////////////////////////////////////////////////////////////////////////////////////////////
  always @ (negedge clk)
    begin                                                                                         
      if(reset==1'b1 || master_sink_ena_reg==1'b0)
        counter <= 0;
      else                                                                                       
        counter <= counter + 1;                                                     
    end                                                                                      
                                                                                                
  always @ (negedge clk)
    begin                                                                                        
      if(reset==1'b1)
         master_sink_sop<=1'b0;                                                                              
     else                                                                                     
       begin                                                                                        
         if(counter==0 && master_sink_ena_reg==1'b1)                                                     
           master_sink_sop<=1'b1;                                                                             
         else                                                                   
           master_sink_sop<=1'b0;                                                                   
       end                                                                                  
    end 
  ///////////////////////////////////////////////////////////////////////////////////////////////
  // Generate master_sink_dav and master_source_dav input signals.
  ///////////////////////////////////////////////////////////////////////////////////////////////
  always @ (negedge clk)
    begin                                                                                        
      if(reset==1'b1)
        begin                                                                                        
          master_sink_dav <= 1'b0;                                                                                     
          master_source_dav <= 1'b0;                                                                                     
        end 
      else                                                                                     
        begin                                                                                        
          master_sink_dav <= 1'b1;                                                                                     
          master_source_dav <= 1'b1;                                                                                     
        end 
    end 
  		                                                                                           
  ///////////////////////////////////////////////////////////////////////////////////////////////
  // Read input data from files. Data is generated on the negative edge of the clock, clk, in the 
  // testbench and registered by the core on the positive edge of the clock                                                                    
  ///////////////////////////////////////////////////////////////////////////////////////////////
  integer rc_x;
  integer ic_x;
  always @ (negedge clk)
    begin
	   if(reset==1'b1)                                                                         
        begin
	       data_real_in<=0;                                                                    
	       data_imag_in<=0;                                                                    
        end                                                                                  
	    else                                                                                       
         begin
           if(master_sink_ena_reg==1'b1) 
             begin
               rc_x = $fscanf(data_rf,"%d",data_real_in_int);                                                           
               data_real_in <= data_real_in_int;
               ic_x = $fscanf(data_if,"%d",data_imag_in_int);                                                           
               data_imag_in <= data_imag_in_int;
             end                                                                                  
           else                                                                                   
             begin
               data_real_in<=data_real_in;                                                                            
               data_imag_in<=data_imag_in;                                                                            
             end                                                                                 
         end                                                                                 
 	  end                                                                                    
 	                                                                                             
  //////////////////////////////////////////////////////////////////////////////////////////////
  // Write Real and Imginary Data Components and Block Exponent to Disk                                               
  //////////////////////////////////////////////////////////////////////////////////////////////
  always @ (negedge clk)                                                            
    begin
      if(reset==1'b0 & master_source_ena==1'b1)
        begin
          fft_real_out_int = fft_real_out;                                                           
          fft_imag_out_int = fft_imag_out;                                                           
          exponent_out_int = exponent_out;                                                           
          $fdisplay(fft_rf, "%d", (fft_real_out_int < 32768)?fft_real_out_int:fft_real_out_int-65536);
          $fdisplay(fft_if, "%d", (fft_imag_out_int < 32768)?fft_imag_out_int:fft_imag_out_int-65536);
          $fdisplay(expf, "%d", (exponent_out_int < 32)?exponent_out_int:exponent_out_int-64);
	     end                                                                                  
 	  end
 	                                                                                             
 ///////////////////////////////////////////////////////////////////////////////////////////////
 // FFT Module Instantiation                                                               
 /////////////////////////////////////////////////////////////////////////////////////////////
  fft_small dut(                                                                   
           .clk(clk),                                                              
           .reset(reset),                                                            
           .inv_i(inv_i),                                                             
           .data_real_in(data_real_in),                                                        
           .data_imag_in(data_imag_in),                                                        
           .master_sink_sop(master_sink_sop),                                                            
           .master_sink_dav(master_sink_dav),                                                            
           .master_source_dav(master_source_dav),                                                       

           .fft_real_out(fft_real_out),                                                        
           .fft_imag_out(fft_imag_out),                                                        
           .exponent_out(exponent_out),                                                        
           .master_sink_ena(master_sink_ena),                                                             
           .master_source_ena(master_source_ena),                                                      
           .master_source_sop(master_source_sop),                                                      
           .master_source_eop(master_source_eop)                                                      
);	                                                                                 
	 	                                                                                             
                                                                                                
endmodule																																												 
