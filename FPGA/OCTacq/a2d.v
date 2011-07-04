
module	a2d(
		adclk,
		rdclk,
		cs_n,
		rst_n,
		rd,
		a2dc,
		addr,
		waitreq,
		a2do	);
		
//=======================================================
//  PORT declarations
//=======================================================
input						adclk;		
input						rdclk;		
input						cs_n;		
input						rst_n;		
input						rd;			
input		[11:0]			a2dc;		
input		[ 9:0]			addr;		
output						waitreq;	
output		[31:0]			a2do;

//=======================================================
//  REG/WIRE declarations
//=======================================================									
wire						waitreq;	
wire		[31:0]			a2do;		
// === Intermediate	Variable
wire		[ 7:0]			a2du;		
reg			[ 1:0]			current_byte,	next_byte;
reg			[ 7:0]			a2di0,	a2di1,	a2di2,	a2di3 ;
wire		[31:0]			ad_q0,	ad_q1;	
wire		[31:0]			ccb_q;		
wire						wfull0,	rempty0;
wire						wfull1,	rempty1;
reg							wrreq,	rdreq;	
reg			[ 2:0]			current_ad,		next_ad ;
reg			[ 7:0]			counter;	
wire						wrclk;		
reg							byte_cntr;	
reg			[15:0]			datiL,	datiH;	
reg			[31:0]			dati;		
wire						datready;	
wire						clkfull,	clkrfull;

// === clock instantiation
// The Altera PLL MegaCore function is used for a cross clock bridge
bufclk bufclk_inst
(
	.areset(~rst_n) ,		// input  areset_sig
	.inclk0(adclk) ,		// input  inclk0_sig
	.c0(wrclk) ,			// output  c0_sig
	.locked() 				// output  locked_sig
);
							
// === 2's	complement to binary		
assign	a2du	[7]		=	~a2dc 	[11];			
assign	a2du 	[6:0]	=	a2dc 	[10:4];		

// === 8-bit to 32-bit					
//   1. synchronous sequential block		
always  @( negedge	adclk )	begin			
	current_byte	<=	next_byte ;		
end									
//   2. combination logic block			
always  @( current_byte )		begin			
	case ( current_byte )						
		2'b00:		next_byte = 2'b01;	//	BYTE1;
		2'b01:		next_byte = 2'b10;	//	BYTE2;
		2'b10:		next_byte = 2'b11;	//	BYTE3;
		2'b11:		next_byte = 2'b00;	//	BYTE0;
		default:	next_byte = 2'b01;	//	BYTE1;
	endcase								
end									
//   3.	synchronous sequential block: give output
always  @( negedge	adclk )	begin			
	case ( next_byte )						
		2'b00:	begin						
			a2di3	<=	a2du;				
		end								
		2'b01:	begin						
			a2di0  	<=	a2du;				
			dati	<=	{a2di3,	a2di2,	a2di1,	a2di0};
		end								
		2'b10:	begin						
			a2di1  <=  a2du;				
		end								
		2'b11:	begin						
			a2di2  <=  a2du;				
		end								
		default:	begin						
			a2di0  <=  a2du;				
			a2di1  <=  a2du;				
			a2di2  <=  a2du;				
			a2di3  <=  a2du;				
		end								
	endcase
end

// ============ Cross Clock Bridge Begin =============== //
// The Altera double-clock FIFO MegaCore function is used for a cross clock bridge
wire rempty ; 

adFIFO adFIFO_inst
(
	.data( dati ) ,			// input [31:0] data_sig
	.rdclk( rdclk ) ,		// input  rdclk_sig
	.rdreq( ~rempty ) ,		// input  rdreq_sig
	.wrclk( wrclk ) ,		// input  wrclk_sig
	.wrreq( 1'b1 ) ,		// input  wrreq_sig
	.q( ccb_q ) ,			// output [31:0] q_sig
	.rdempty( rempty ) ,	// output  rdempty_sig
	.rdfull( ) ,			// output  rdfull_sig
	.wrfull( ) 				// output  wrfull_sig
);
//  ============  Cross Clock Bridge End  =================  //

//  ===============  Swing Buffer Begin  ==================  //
// The Altera single-Clock FIFO MegaCore function is used for a swing buffer.
reg			[1:0]   		current_buf, next_buf;	
reg							idle;					
reg							wren0,	wren1,	rden;	

// Control FSM 
parameter 
INITIAL  =  2'b00,		
BUFFER0  =  2'b01,		
BUFFER1  =  2'b10;		

//	synchronous	sequential block		
always	@( posedge rdclk or negedge rst_n )	begin
	if ( ~rst_n )						
		current_buf	<=  INITIAL ;		
	else						
		current_buf	<=	next_buf ;		
	end								
//	combinatorial	block				
always	@( current_buf or cs_n or wfull0 or wfull1 or rempty0 or rempty1 )   begin		
	case ( current_buf )				
		INITIAL:	begin				
			if ( wfull0	& ~cs_n )		
				next_buf = BUFFER0;		
			else					
				next_buf = INITIAL ;		
			end						
		BUFFER0:	begin		
			if ( wfull1  &  rempty0 )	
				next_buf	=  BUFFER1;	
			else				
				next_buf	=  BUFFER0;	
			end					
		BUFFER1:	begin		
			if	( wfull0  &  rempty1 )	
				next_buf	=  BUFFER0;	
			else				
				next_buf	=  BUFFER1;	
			end					
		default:	begin		
			next_buf  =  INITIAL ;	
		end					
	endcase					
end						

//   sequential	block			
always	@( posedge	rdclk )	begin	
	case ( next_buf )			
		INITIAL:	begin		
			wren0	<=	1'b1;	
			wren1	<=  1'b0;	
			rden	<=  1'b0;	
			rdreq	<=  1'bz;	
			idle	<=	1'b0;	
		end					
		BUFFER0:	begin		
			wren0	<=	1'b0;	
			if	( wfull1  &  ~rempty0 )	begin
				wren1	<=	1'b0;	
			end				
			else	begin		
				wren1	<=	1'b1;	
			end				
			if	( rempty0  &  ~ wfull1 )	begin
				rden	<=	1'b0;	
				idle	<=	1'b1;	
			end				
			else	begin		
				rden	<=	1'b1;	
				idle	<=	1'b0;	
			end				
			rdreq	<=	1'b1;	
		end					
		BUFFER1:	begin		
			if	( wfull0  &  ~rempty1 )	begin
				wren0	<=	1'b0;	
			end						
			else	begin		
				wren0	<=	1'b1;	
			end						
			wren1	<=	1'b0;	
			if	( rempty1  &  ~ wfull0 )	begin
				rden	<=	1'b0;	
				idle	<=	1'b1;	
			end						
			else	begin		
				rden	<=	1'b1;	
				idle	<=	1'b0;	
			end						
			rdreq	<=	1'b0;	
		end							
		default:	begin		
			wren0	<=  1'b1;	
			wren1	<=  1'b0;	
			rden	<=	1'b0;	
			rdreq	<=  1'bz;	
			idle	<=	1'b0;	
		end							
	endcase							
end								
									
swBUF swBUF_inst0
(
	.clock( rdclk ) ,		// input  clock_sig
	.data( ccb_q ) ,		// input [31:0] data_sig
	.rdreq( rden  
			&  rd  
			&  rdreq) ,		// input  rdreq_sig
	.sclr( ~rst_n ) ,		// input  sclr_sig
	.wrreq( ~rempty 
			& wren0 ) ,		// input  wrreq_sig
	.empty( rempty0 ) ,		// output  empty_sig
	.full( wfull0 ) ,		// output  full_sig
	.q( ad_q0 ) 			// output [31:0] q_sig
);

swBUF swBUF_inst1
(
	.clock( rdclk ) ,		// input  clock_sig
	.data( ccb_q ) ,		// input [31:0] data_sig
	.rdreq( rden  
			&  rd  
			&  ~rdreq) ,	// input  rdreq_sig
	.sclr( ~rst_n ) ,		// input  sclr_sig
	.wrreq( ~rempty 
			& wren1 ) ,		// input  wrreq_sig
	.empty( rempty1 ) ,		// output  empty_sig
	.full( wfull1 ) ,		// output  full_sig
	.q( ad_q1 ) 			// output [31:0] q_sig
);

assign	waitreq	=	idle;				
assign	a2do	=	rdreq ? ad_q0 : ad_q1;

endmodule							