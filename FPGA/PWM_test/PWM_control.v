// 32 bit PWM control (Fan, LEDs, etc)
module PWM_control(
	clk,
	reset_n,
	sel,
	PWM
);
//=======================================================
//  PARAMETER declarations
//=======================================================
//`define REG_TOTAL_DUR	0
//`define REG_HIGH_DUR	1
parameter	OFF		= 32'h0000;
parameter	LOW		= 32'h0FFF;
parameter	MID		= 32'hBFFF;
parameter	HI		= 32'hFFFF;

//=======================================================
//  PORT declarations
//=======================================================
input 				clk;
input				reset_n;
input		[1:0]	sel;
output				PWM;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg			[31:0]	total_dur;
reg			[31:0]	high_dur;
reg			[31:0]	tick;

//=======================================================
//  Structural coding
//=======================================================	
initial
	begin
		high_dur <= 0;
		tick <= 0;
		total_dur <= HI;
	end

always @ (posedge clk or negedge reset_n)
begin

case (sel) 
	2'd0 : 		high_dur = OFF; 
	2'd1 : 		high_dur = LOW; 
	2'd2 : 		high_dur = MID;
	2'd3 :		high_dur = HI; 
	default : 	high_dur = HI; 
endcase
if (~reset_n)
	begin
		tick <= 0;
	end
	else if (tick >= total_dur)
	begin
		tick <= 0;
	end
	else
		tick <= tick + 1;
end

assign PWM = (tick < high_dur)?1'b1:1'b0;

endmodule
