module parse_fft_input (
	//input ports
	clk_data_in,
	clk_fft,
	reset,
	master_sink_dav,
	master_sink_sop,
	master_source_dav,
	inv_i,
	data_real_in,
	data_imag_in,
	master_sink_ena,
	//output ports
	master_sink_dav_fft,
	master_sink_sop_fft,
	master_source_dav_fft,
	inv_i_fft,
	data_real_in_fft_top,
	data_imag_in_fft_top,
	data_real_in_fft_bot,
	data_imag_in_fft_bot);
	
	// GLOBAL PARAMETER DECLARATION
    parameter data_width = 16;    //The number of bits in the input data for both real and imag parts
 
	input			clk_data_in;
	input    		clk_fft;
	input			reset;
	input			master_sink_dav;
	input			master_sink_sop;
	input			master_source_dav;
	input			inv_i;
	input	[data_width-1:0]	data_real_in;
	input	[data_width-1:0]	data_imag_in;
	input			master_sink_ena;
	
	output 			master_sink_dav_fft;
	output 			master_sink_sop_fft;
	output			master_source_dav_fft;
	output			inv_i_fft;
	output  [data_width-1:0]  data_real_in_fft_top;
	output  [data_width-1:0]  data_imag_in_fft_top;
	output  [data_width-1:0]  data_real_in_fft_bot;
	output  [data_width-1:0]  data_imag_in_fft_bot;
	
	
	reg cnt;
	reg master_sink_ena_reg;
	reg master_sink_sop_reg;
	reg master_sink_dav_fft;
	reg master_source_dav_fft;
	reg master_sink_sop_fft;
	reg inv_i_reg;
	reg inv_i_fft;
	reg [data_width-1:0] data_real_in_fft_top;
	reg [data_width-1:0] data_imag_in_fft_top;
	reg [data_width-1:0] data_real_in_fft_top_dly;
	reg [data_width-1:0] data_imag_in_fft_top_dly;
	reg [data_width-1:0] data_real_in_fft_bot;
	reg [data_width-1:0] data_imag_in_fft_bot;
	

	

   // Generate master_sink_dav, master_source_dav input signals.
   always @ (posedge clk_fft)
     begin                                                                                        
       if(reset == 1'b1)
         begin                                                                                        
           master_sink_dav_fft <= 1'b0;                                                                                     
           master_source_dav_fft <= 1'b0;
		 end 
       else                                                                                     
         begin                                                                                        
           master_sink_dav_fft <= master_sink_dav;                                                                                     
           master_source_dav_fft <= master_source_dav;                                                                                     
		 end 
     end 
	

	// Register output signal master_sink_ena on the positive edge of the clock 
    always @ (posedge clk_data_in)                                                              
      begin                                                                                        
         if(reset == 1'b1)          
			begin                                                                          
	           master_sink_ena_reg <= 1'b0;                                                                      
			   master_sink_sop_reg <= 1'b0;
			   inv_i_reg <= 1'b0;
			end
	     else                                                                      
			begin
			   master_sink_ena_reg <= master_sink_ena;                                                                      
			   master_sink_sop_reg <= master_sink_sop;
			   inv_i_reg <= inv_i;
			end
	  end 
	
	always @ (posedge clk_data_in)
	  begin
	     if(reset == 1'b1)
			cnt <= 1'b0;
		 else
		    begin
		       if (master_sink_ena_reg == 1'b1)
			      cnt <= cnt + 1;
			   else
			      cnt <= 1'b0;
			end
	  end
	
	// Generate the master_sink_sop_fft signal
    always @ (negedge clk_fft)
   	  begin                                                                                        
     	 if (reset == 1'b1)
           begin
        	 master_sink_sop_fft <= 1'b0;  
			 inv_i_fft <= 1'b0;                                                                             
		   end
	     else                                                                                     
    	   begin                                                                                        
        	 if(master_sink_ena_reg == 1'b1) 
               begin                                                    
		           master_sink_sop_fft <= master_sink_sop_reg;                                                                             
		           inv_i_fft <= inv_i_reg;
		       end
    	     else 
               begin                                                                  
	        	   master_sink_sop_fft<=1'b0;                                                                   
			       inv_i_fft <= 1'b0;
			   end
	       end                                                                                  
      end 
	
	always @ (posedge clk_data_in)
	  begin
	     if(reset == 1'b1)
	       begin
			  data_real_in_fft_top <= 0;
		  	  data_imag_in_fft_top <= 0;
		  	  data_real_in_fft_top_dly <= 0;
		  	  data_imag_in_fft_top_dly <= 0;
		 	  data_real_in_fft_bot <= 0;
			  data_imag_in_fft_bot <= 0;
			end
		  else if ( master_sink_ena_reg == 1'b1 )
		    begin
			   if (cnt == 1'b0)
			     begin
				  data_real_in_fft_top_dly <= data_real_in;
			  	  data_imag_in_fft_top_dly <= data_imag_in;
			    end
			  else 
			    begin
				  data_real_in_fft_bot <= data_real_in;
				  data_imag_in_fft_bot <= data_imag_in;
				end
				data_real_in_fft_top <= data_real_in_fft_top_dly;
				data_imag_in_fft_top <= data_imag_in_fft_top_dly;
		    end
		  else 
		    begin
			  data_real_in_fft_top <= 0;
		  	  data_imag_in_fft_top <= 0;
		  	  data_real_in_fft_top_dly <= 0;
		  	  data_imag_in_fft_top_dly <= 0;
		 	  data_real_in_fft_bot <= 0;
			  data_imag_in_fft_bot <= 0;
			end
	   end
	
endmodule