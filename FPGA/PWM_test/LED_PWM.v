//For more LED intensity control, a PWM is an ideal solution.
//Here's an example that uses a 4-bits control to select between 16 intensity levels out of an LED.

module LED_PWM(
	clk,
	PWM_input,
	LED);
	
//=======================================================
//  PORT declarations
//=======================================================
input 			clk;
input 	[3:0]	PWM_input;     // 16 intensity levels
output 			LED;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg 	[4:0] 	PWM;

//=======================================================
//  Structural coding
//=======================================================
always @(posedge clk) 
	PWM <= PWM[3:0]+PWM_input;
assign LED = PWM[4];

endmodule