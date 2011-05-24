// Custom 11-bit counter to point acquisition data to corresponding register. Starts counting from 0 by signal GCLKIN, finishes at fixed NSAMPLES.
module sample_addressing_custom (
	clock,
	sclr,
	q
	);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter	NSAMPLES		= 11'd1170;			// Number of samples per A-line

//=======================================================
//  PORT declarations
//=======================================================
input			clock;
input			sclr;
output reg [10:0] q;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg 	[25:0]	count;
//=======================================================
//  Structural coding
//=======================================================
initial
  begin
	q			= 0;
    count		= 0;
  end
always @(posedge clock or posedge sclr)
begin
	if (sclr == 1)	begin
		count	<= 0;
		//q		<= 0;
	end
	else
	count = count + 1'b1;
	if (count > NSAMPLES)	begin
		//q		<= 0;
		count	<= 0;
	end
	//else	begin
		
	//end
end
assign q = count[10:0];
endmodule