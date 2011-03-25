module BFP_unitygain (
						clk,
						reset_n,
						ifft_sink_valid,
						ifft_sink_sop,
						ifft_sink_eop,
						ifft_sink_real,
						ifft_sink_imag,
						ifft_sink_error,
						scaler_source_ready,
						
						ifft_sink_ready,
						scaler_source_valid,
						scaler_source_sop,
						scaler_source_eop,
						scaler_source_real,
						scaler_source_imag,
						scaler_source_error);


input		clk;
input		reset_n;
input		ifft_sink_valid;
input		ifft_sink_sop;
input		ifft_sink_eop;
input[15:0]	ifft_sink_real;
input[15:0]	ifft_sink_imag;
input[1:0]	ifft_sink_error;
input		scaler_source_ready;

output		ifft_sink_ready;
output[1:0]	scaler_source_error;
output		scaler_source_valid;
output		scaler_source_sop;
output		scaler_source_eop;
output[16:0]scaler_source_real;
output[16:0]scaler_source_imag;

	
wire   		ifft_sink_ready;
wire		ifft_source_valid;
wire		ifft_source_sop;
wire		ifft_source_eop;
wire[5:0]	ifft_source_exp;
wire[15:0]	ifft_source_real;
wire[15:0]	ifft_source_imag;
wire[1:0]	ifft_source_error;

wire	fft_sink_ready;
wire	ifft_source_ready = fft_sink_ready; 	

fft91 ifft_inst( 
   				.clk(clk),
		      	.reset_n(reset_n),
		      	.inverse(1'b1),
		      	.sink_valid(ifft_sink_valid),
		      	.sink_sop(ifft_sink_sop),
		      	.sink_eop(ifft_sink_eop),
		      	.sink_real(ifft_sink_real),
		      	.sink_imag(ifft_sink_imag),
              	.sink_error(ifft_sink_error),
		      	.source_ready(ifft_source_ready),

		      	.sink_ready(ifft_sink_ready),
		      	.source_valid(ifft_source_valid),
		      	.source_sop(ifft_source_sop),
		      	.source_eop(ifft_source_eop),
		      	.source_exp(ifft_source_exp),
		      	.source_real(ifft_source_real),
		      	.source_imag(ifft_source_imag),
              	.source_error(ifft_source_error)
		      	);

wire		fft_sink_valid = ifft_source_valid;
wire		fft_sink_sop = ifft_source_sop;
wire		fft_sink_eop = ifft_source_eop;
wire[15:0]	fft_sink_real = ifft_source_real;
wire[15:0]	fft_sink_imag = ifft_source_imag;
wire[1:0]	fft_sink_error = ifft_source_error;

wire		scaler_sink_ready;
wire		fft_source_ready = scaler_sink_ready;

wire		fft_source_valid;
wire		fft_source_sop;
wire		fft_source_eop;
wire[5:0]	fft_source_exp;
wire[15:0]	fft_source_real;
wire[15:0]	fft_source_imag;
wire[1:0]	fft_source_error;
fft91 fft_inst( 
   			   .clk(clk),
		       .reset_n(reset_n),
		       .inverse(1'b0),
		       .sink_valid(fft_sink_valid),
		       .sink_sop(fft_sink_sop),
		       .sink_eop(fft_sink_eop),
		       .sink_real(fft_sink_real),
		       .sink_imag(fft_sink_imag),
               .sink_error(fft_sink_error),
		       .source_ready(fft_source_ready),

		       .sink_ready(fft_sink_ready),
		       .source_valid(fft_source_valid),
		       .source_sop(fft_source_sop),
		       .source_eop(fft_source_eop),
		       .source_exp(fft_source_exp),
		       .source_real(fft_source_real),
		       .source_imag(fft_source_imag),
               .source_error(fft_source_error)
		       );
		
reg	scaler_sink_valid;
reg scaler_sink_sop;
reg	scaler_sink_eop;
reg [15:0] scaler_sink_real;
reg [15:0] scaler_sink_imag;
reg	[1:0] scaler_sink_error;
always@(posedge clk) begin
	if(!reset_n) begin
		scaler_sink_valid   <= 1'b0;		
		scaler_sink_sop 	<= 1'b0;		
		scaler_sink_eop 	<= 1'b0;		
		scaler_sink_real    <= 16'b0;
		scaler_sink_imag    <= 16'b0;
		scaler_sink_error 	<= 2'b0;
	end
	else begin 
		scaler_sink_valid 	<= fft_source_valid;		
		scaler_sink_sop 	<= fft_source_sop;		
		scaler_sink_eop 	<= fft_source_eop;		
		scaler_sink_real    <= fft_source_real;
		scaler_sink_imag    <= fft_source_imag;
		scaler_sink_error 	<= fft_source_error;
	end
end	

reg [5:0] ifft_source_exp_d1, ifft_source_exp_d2, fft_source_exp_d1;
always@(posedge clk) begin
	if(!reset_n) begin
		ifft_source_exp_d1 <= 5'b0;		
		ifft_source_exp_d2 <= 5'b0;	
		fft_source_exp_d1  <= 5'b0;
	end
	else begin 
		fft_source_exp_d1  <= fft_source_exp;
		if(ifft_source_eop&ifft_source_valid) begin
			ifft_source_exp_d1 <= ifft_source_exp;
			ifft_source_exp_d2 <= ifft_source_exp_d1;
		end
	end
end		  

reg [5:0]	exp_ifft;		
always@(posedge clk) begin
	if(!reset_n) begin
		exp_ifft <= 5'b0;		
	end
	else if(fft_source_sop) begin
		exp_ifft <= ifft_source_exp_d2;
	end
end	

wire [5:0]	exp_ifft_fft_sum = scaler_sink_valid? ((~exp_ifft+1)+(~fft_source_exp_d1+1)-8) : exp_ifft_fft_sum;		
wire [5:0]	scaler_sink_exp = ~exp_ifft_fft_sum+1;		
 
wire [16:0]	scaler_source_real, scaler_source_imag; 
Scaler	scaler_inst(
					.clk(clk),
					.reset_n(reset_n),
		       		.sink_valid(scaler_sink_valid),
		       		.sink_sop(scaler_sink_sop),
		       		.sink_eop(scaler_sink_eop),
					.sink_real(scaler_sink_real),
					.sink_imag(scaler_sink_imag),
					.sink_exp(scaler_sink_exp),
					.sink_error(scaler_sink_error),
	 		        .source_ready(scaler_source_ready),

			        .sink_ready(scaler_sink_ready),
       				.source_valid(scaler_source_valid),
       				.source_sop(scaler_source_sop),
       				.source_eop(scaler_source_eop),
       				.source_real(scaler_source_real),
       				.source_imag(scaler_source_imag),
       				.source_error(scaler_source_error)
       				);

endmodule

