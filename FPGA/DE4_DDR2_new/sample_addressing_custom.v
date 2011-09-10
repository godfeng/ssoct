// Custom 11-bit counter to point acquisition data to corresponding register. Starts counting from 0 by signal trigger50kHz, finishes at fixed NSAMPLES.

`include "my_incl.v"			// Verilog include file

module sample_addressing_custom (
	clock,
	sclr,
	sample_position
	);
//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================
input				clock;
input				sclr;
output reg 	[10:0] 	sample_position;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg 		[13:0]	count;
//=======================================================
//  Structural coding
//=======================================================
initial
  begin
	// Initialize count and output sample_position
	sample_position	= 0;
    count			= 0;
  end

always @(posedge clock)
begin
	if (sclr == 1)	begin
		count		<= 0;		// Synchronous clear
	end
	else
		// Increment counter
		count 			<= count + 1'b1;
		if (count > `NSAMPLES)	begin
		// Output sample_position equal to zero
			sample_position		<= 0;
		end
		else	begin
		// Output sample_position equal to count LSBits
			sample_position 	<= count[10:0];	
		end
end

endmodule