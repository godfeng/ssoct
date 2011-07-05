// Outputs a 14-bit offset binary sinusoidal wave
module sine2DAC(
	clk50MHz,
	rstn,
	sineOutput);
				
//=======================================================
//  PORT declarations
//=======================================================
input						clk50MHz;
input						rstn;
output		[13:0]			sineOutput;
				
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg			[13:0]			sineOutput;
wire		[13:0]			raw_sine;

//=======================================================
//  Structural coding
//=======================================================
always @(negedge rstn or posedge clk50MHz)
begin
	if (!rstn) begin
		sineOutput		<= 14'd0;
	end
	else begin
		// Invert sign bit (MSB) to have offset binary
		sineOutput		<= {~raw_sine[13],raw_sine[12:0]};
	end
end
				
sin400k sin400k_inst
(
	.phi_inc_i(32'd34359738) ,	// input [31:0] phi_inc_i_sig 32'd34359738 for a 50 MHz clock
	.clk(clk50MHz) ,			// input  clk_sig
	.reset_n(rstn) ,			// input  reset_n_sig
	.clken(1'b1) ,				// input  clken_sig
	.fsin_o(raw_sine) ,			// output [13:0] fsin_o_sig
	.fcos_o() ,					// output [13:0] fcos_o_sig (NC)
	.out_valid() 				// output  out_valid_sig (NC)
);
endmodule