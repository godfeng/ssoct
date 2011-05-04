// ADC out of range display
module ADC_OOR(
	clock,
	ADC_OOR_inp,
	seg7D0,
	seg7D1);

//=======================================================
//  PORT declarations
//=======================================================

input	clock;
input	ADC_OOR_inp;
output	[6:0]				seg7D0;
output	[6:0]				seg7D1;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg		[6:0]				seg7w0;
reg		[6:0]				seg7w1;
wire						ADC_OOR_w;

//=======================================================
//  Structural coding
//=======================================================
assign 	seg7D0 				= seg7w0;
assign 	seg7D1 				= seg7w1;
assign  ADC_OOR_w 			= ADC_OOR_inp;

always @(posedge clock)
begin
// 7 segment displays
	if (ADC_OOR_w == 1'b1) begin
	// write or
		seg7w0				<= 7'b0101111;
		seg7w1				<= 7'b0100011;
	end
	else begin
	// turn displays off
		seg7w0				<= 7'b1111111;
		seg7w1				<= 7'b1111111;
	end
end

endmodule
	