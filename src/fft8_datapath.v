`include "constants_fft.vh"

module fft8_datapath(

						 	input clk,
							input rst,
							input start_i,

							input [15:0] x_0_R_i,
							input [15:0] x_0_I_i,
							input [15:0] x_1_R_i,
							input [15:0] x_1_I_i,
							input [15:0] x_2_R_i,
							input [15:0] x_2_I_i,
							input [15:0] x_3_R_i,
							input [15:0] x_3_I_i,
							input [15:0] x_4_R_i,
							input [15:0] x_4_I_i,
							input [15:0] x_5_R_i,
							input [15:0] x_5_I_i,
							input [15:0] x_6_R_i,
							input [15:0] x_6_I_i,
							input [15:0] x_7_R_i,
							input [15:0] x_7_I_i,

							input [63:0] alu_reg_i,
							input [4:0] alu_mode_i,
							input [59:0] wr_enable_i,

							output [15:0] X_0_R_o,
							output [15:0] X_0_I_o,
							output [15:0] X_1_R_o,
							output [15:0] X_1_I_o,
							output [15:0] X_2_R_o,
							output [15:0] X_2_I_o,
							output [15:0] X_3_R_o,
							output [15:0] X_3_I_o,
							output [15:0] X_4_R_o,
							output [15:0] X_4_I_o,
							output [15:0] X_5_R_o,
							output [15:0] X_5_I_o,
							output [15:0] X_6_R_o,
							output [15:0] X_6_I_o,
							output [15:0] X_7_R_o,
							output [15:0] X_7_I_o
					);






reg [15:0] X_0_R_r, X_0_I_r, X_0_R_p, X_0_I_p,
		     X_1_R_r, X_1_I_r, X_1_R_p, X_1_I_p,
		     X_2_R_r, X_2_I_r, X_2_R_p, X_2_I_p,
		     X_3_R_r, X_3_I_r, X_3_R_p, X_3_I_p,
		     X_4_R_r, X_4_I_r, X_4_R_p, X_4_I_p,
		     X_5_R_r, X_5_I_r, X_5_R_p, X_5_I_p,
		     X_6_R_r, X_6_I_r, X_6_R_p, X_6_I_p,
		     X_7_R_r, X_7_I_r, X_7_R_p, X_7_I_p;


reg [15:0] S1_R0_r, S1_I0_r, S1_R0_p, S1_I0_p,
		   S1_R1_r, S1_I1_r, S1_R1_p, S1_I1_p,
		   S1_R2_r, S1_I2_r, S1_R2_p, S1_I2_p,
		   S1_R3_r, S1_I3_r, S1_R3_p, S1_I3_p,
		   S1_R4_r, S1_I4_r, S1_R4_p, S1_I4_p,
		   S1_R5_r, S1_I5_r, S1_R5_p, S1_I5_p,
		   S1_R6_r, S1_I6_r, S1_R6_p, S1_I6_p,
		   S1_R7_r, S1_I7_r, S1_R7_p, S1_I7_p,

		   S2_R0_r, S2_I0_r, S2_R0_p, S2_I0_p,
		   S2_R1_r, S2_I1_r, S2_R1_p, S2_I1_p,
		   S2_R2_r, S2_I2_r, S2_R2_p, S2_I2_p,
		   S2_R3_r, S2_I3_r, S2_R3_p, S2_I3_p,
		   S2_R4_r, S2_I4_r, S2_R4_p, S2_I4_p,
		   S2_R5_r, S2_I5_r, S2_R5_p, S2_I5_p,
		   S2_R6_r, S2_I6_r, S2_R6_p, S2_I6_p,
		   S2_R7_r, S2_I7_r, S2_R7_p, S2_I7_p;


reg [15:0] x_0_R_r,  x_0_I_r, x_0_R_p,  x_0_I_p,
		   x_1_R_r,  x_1_I_r, x_1_R_p,  x_1_I_p,
		   x_2_R_r,  x_2_I_r, x_2_R_p,  x_2_I_p,
		   x_3_R_r,  x_3_I_r, x_3_R_p,  x_3_I_p,
		   x_4_R_r,  x_4_I_r, x_4_R_p,  x_4_I_p,
		   x_5_R_r,  x_5_I_r, x_5_R_p,  x_5_I_p,
		   x_6_R_r,  x_6_I_r, x_6_R_p,  x_6_I_p,
		   x_7_R_r,  x_7_I_r, x_7_R_p,  x_7_I_p;

reg [15:0] x0_R,x0_I,
		   x1_R,x1_I,
		   x2_R,x2_I,
		   x3_R,x3_I,
		   x4_R,x4_I,
		   x5_R,x5_I,
		   x6_R,x6_I,
		   x7_R,x7_I;		   


 reg  [15:0] T_R0_r, T_I0_r, T_R0_p, T_I0_p, 
 		  	 T_R1_r, T_I1_r, T_R1_p, T_I1_p,
 		   	 T_R2_r, T_I2_r, T_R2_p, T_I2_p,
 		  	 T_R3_r, T_I3_r, T_R3_p, T_I3_p,
 		   	 T_R4_r, T_I4_r, T_R4_p, T_I4_p,	
 		   	 T_R5_r, T_I5_r, T_R5_p, T_I5_p;

/* Alu operands  */
reg  signed [15:0] alu_op_a, alu_op_b;
reg  signed [31:0] alu_op_c;
wire signed [31:0] alu_res, wbb;


reg start_r;


fft_alu ALU (

				.clk			(clk),
				.rst 			(rst),
				.op_a_i			(alu_op_a),
				.op_b_i 		(alu_op_b),
				.op_c_i			(alu_op_c),
				.alu_mode_i		(alu_mode_i),
	
				.res_o	 		(alu_res)

			 );


always @(posedge clk) begin
	if(rst) begin

		S1_R0_r 		<= 16'd0;
		S1_I0_r	  		<= 16'd0;
		S1_R1_r 		<= 16'd0;
		S1_I1_r	  		<= 16'd0;
		S1_R2_r 		<= 16'd0;
		S1_I2_r	  		<= 16'd0;
		S1_R3_r 		<= 16'd0;
		S1_I3_r	  		<= 16'd0;
		S1_R4_r 		<= 16'd0;
		S1_I4_r	  		<= 16'd0;
		S1_R5_r 		<= 16'd0;
		S1_I5_r	  		<= 16'd0;
		S1_R6_r 		<= 16'd0;
		S1_I6_r	  		<= 16'd0;
		S1_R7_r 		<= 16'd0;
		S1_I7_r	  		<= 16'd0;

		S1_R0_p 		<= 16'd0;
		S1_I0_p	  		<= 16'd0;
		S1_R1_p 		<= 16'd0;
		S1_I1_p	  		<= 16'd0;
		S1_R2_p 		<= 16'd0;
		S1_I2_p	  		<= 16'd0;
		S1_R3_p 		<= 16'd0;
		S1_I3_p	  		<= 16'd0;
		S1_R4_p 		<= 16'd0;
		S1_I4_p	  		<= 16'd0;
		S1_R5_p 		<= 16'd0;
		S1_I5_p	  		<= 16'd0;
		S1_R6_p 		<= 16'd0;
		S1_I6_p	  		<= 16'd0;
		S1_R7_p 		<= 16'd0;
		S1_I7_p	  		<= 16'd0;

		S2_R0_r 		<= 16'd0;
		S2_I0_r	  		<= 16'd0;
		S2_R1_r 		<= 16'd0;
		S2_I1_r	  		<= 16'd0;
		S2_R2_r 		<= 16'd0;
		S2_I2_r	  		<= 16'd0;
		S2_R3_r 		<= 16'd0;
		S2_I3_r	  		<= 16'd0;
		S2_R4_r 		<= 16'd0;
		S2_I4_r	  		<= 16'd0;
		S2_R5_r 		<= 16'd0;
		S2_I5_r	  		<= 16'd0;
		S2_R6_r 		<= 16'd0;
		S2_I6_r	  		<= 16'd0;
		S2_R7_r 		<= 16'd0;
		S2_I7_r	  		<= 16'd0;

		S2_R0_p 		<= 16'd0;
		S2_I0_p	  		<= 16'd0;
		S2_R1_p 		<= 16'd0;
		S2_I1_p	  		<= 16'd0;
		S2_R2_p 		<= 16'd0;
		S2_I2_p	  		<= 16'd0;
		S2_R3_p 		<= 16'd0;
		S2_I3_p	  		<= 16'd0;
		S2_R4_p 		<= 16'd0;
		S2_I4_p	  		<= 16'd0;
		S2_R5_p 		<= 16'd0;
		S2_I5_p	  		<= 16'd0;
		S2_R6_p 		<= 16'd0;
		S2_I6_p	  		<= 16'd0;
		S2_R7_p 		<= 16'd0;
		S2_I7_p	  		<= 16'd0;

		x_0_R_r 		<= 16'd0;
		x_0_I_r 		<= 16'd0;
		x_1_R_r 		<= 16'd0;
		x_1_I_r 		<= 16'd0;
		x_2_R_r 		<= 16'd0;
		x_2_I_r 		<= 16'd0;
		x_3_R_r 		<= 16'd0;
		x_3_I_r 		<= 16'd0;
		x_4_R_r 		<= 16'd0;
		x_4_I_r 		<= 16'd0;
		x_5_R_r 		<= 16'd0;
		x_5_I_r 		<= 16'd0;
		x_6_R_r 		<= 16'd0;
		x_6_I_r 		<= 16'd0;
		x_7_R_r 		<= 16'd0;
		x_7_I_r 		<= 16'd0;

		x_0_R_p			<= 16'd0;
		x_0_I_p 		<= 16'd0;
		x_1_R_p 		<= 16'd0;
		x_1_I_p 		<= 16'd0;
		x_2_R_p 		<= 16'd0;
		x_2_I_p 		<= 16'd0;
		x_3_R_p 		<= 16'd0;
		x_3_I_p 		<= 16'd0;
		x_4_R_p 		<= 16'd0;
		x_4_I_p 		<= 16'd0;
		x_5_R_p 		<= 16'd0;
		x_5_I_p 		<= 16'd0;
		x_6_R_p 		<= 16'd0;
		x_6_I_p 		<= 16'd0;
		x_7_R_p 		<= 16'd0;
		x_7_I_p 		<= 16'd0;

		T_R0_r  		<= 16'd0;
		T_I0_r  		<= 16'd0;
		T_R0_p 			<= 16'd0;
		T_I0_p  		<= 16'd0;
		T_R1_r  		<= 16'd0;
		T_I1_r  		<= 16'd0;
		T_R1_p 			<= 16'd0;
		T_I1_p  		<= 16'd0;
		T_R2_r  		<= 16'd0;
		T_I2_r  		<= 16'd0;
		T_R2_p 			<= 16'd0;
		T_I2_p  		<= 16'd0;
		T_R3_r  		<= 16'd0;
		T_I3_r  		<= 16'd0;
		T_R3_p 			<= 16'd0;
		T_I3_p  		<= 16'd0;
		T_R4_r  		<= 16'd0;
		T_I4_r  		<= 16'd0;
		T_R4_p 			<= 16'd0;
		T_I4_p  		<= 16'd0;
		T_R5_r  		<= 16'd0;
		T_I5_r  		<= 16'd0;
		T_R5_p 			<= 16'd0;
		T_I5_p  		<= 16'd0;





	end
	else begin


		/* inputs */
		x0_R 			<= x_0_R_i;
		x0_I 			<= x_0_I_i;
		x1_R 			<= x_1_R_i;
		x1_I 			<= x_1_I_i;
		x2_R 			<= x_2_R_i;
		x2_I 			<= x_2_I_i;
		x3_R 			<= x_3_R_i;
		x3_I 			<= x_3_I_i;
		x4_R 			<= x_4_R_i;
		x4_I 			<= x_4_I_i;
		x5_R 			<= x_5_R_i;
		x5_I 			<= x_5_I_i;
		x6_R 			<= x_6_R_i;
		x6_I 			<= x_6_I_i;
		x7_R 			<= x_7_R_i;
		x7_I 			<= x_7_I_i;


		/* persistent data */

		X_0_R_r 		<= X_0_R_p;
		X_0_I_r 		<= X_0_I_p;
		X_1_R_r 		<= X_1_R_p;
		X_1_I_r 		<= X_1_I_p;
		X_2_R_r 		<= X_2_R_p;
		X_2_I_r 		<= X_2_I_p;
		X_3_R_r 		<= X_3_R_p;
		X_3_I_r 		<= X_3_I_p;
		X_4_R_r 		<= X_4_R_p;
		X_4_I_r 		<= X_4_I_p;		
		X_5_R_r 		<= X_5_R_p;
		X_5_I_r 		<= X_5_I_p;
		X_6_R_r 		<= X_6_R_p;
		X_6_I_r 		<= X_6_I_p;
		X_7_R_r 		<= X_7_R_p;
		X_7_I_r 		<= X_7_I_p;

		x_0_R_r 		<= x_0_R_p;
		x_0_I_r  	<= x_0_I_p;
		x_1_R_r 		<= x_1_R_p;
		x_1_I_r 		<= x_1_I_p;
		x_2_R_r 		<= x_2_R_p;
		x_2_I_r 		<= x_2_I_p;
		x_3_R_r 		<= x_3_R_p;
		x_3_I_r 		<= x_3_I_p;
		x_4_R_r 		<= x_4_R_p;
		x_4_I_r 		<= x_4_I_p;
		x_5_R_r 		<= x_5_R_p;
		x_5_I_r 		<= x_5_I_p;
		x_6_R_r 		<= x_6_R_p;
		x_6_I_r 		<= x_6_I_p;
		x_7_R_r 		<= x_7_R_p;
		x_7_I_r 		<= x_7_I_p;

		S1_R0_r			<= S1_R0_p;
		S1_I0_r	    	<= S1_I0_p;
		S1_R1_r			<= S1_R1_p;
		S1_I1_r	    	<= S1_I1_p;
		S1_R2_r			<= S1_R2_p;
		S1_I2_r	    	<= S1_I2_p;
		S1_R3_r			<= S1_R3_p;
		S1_I3_r	    	<= S1_I3_p;
		S1_R4_r			<= S1_R4_p;
		S1_I4_r	    	<= S1_I4_p;
		S1_R5_r			<= S1_R5_p;
		S1_I5_r	    	<= S1_I5_p;
		S1_R6_r			<= S1_R6_p;
		S1_I6_r	    	<= S1_I6_p;
		S1_R7_r			<= S1_R7_p;
		S1_I7_r	    	<= S1_I7_p;

		S2_R0_r			<= S2_R0_p;
		S2_I0_r	    	<= S2_I0_p;
		S2_R1_r			<= S2_R1_p;
		S2_I1_r	    	<= S2_I1_p;
		S2_R2_r			<= S2_R2_p;
		S2_I2_r	    	<= S2_I2_p;
		S2_R3_r			<= S2_R3_p;
		S2_I3_r	    	<= S2_I3_p;
		S2_R4_r			<= S2_R4_p;
		S2_I4_r	    	<= S2_I4_p;
		S2_R5_r			<= S2_R5_p;
		S2_I5_r	    	<= S2_I5_p;
		S2_R6_r			<= S2_R6_p;
		S2_I6_r	    	<= S2_I6_p;
		S2_R7_r			<= S2_R7_p;
		S2_I7_r	    	<= S2_I7_p;

		/* ALU */
		alu_op_c 		<= alu_res;
		start_r         <= start_i;

		T_R0_r  		<= T_R0_p;
		T_I0_r  		<= T_I0_p;
		T_R1_r  		<= T_R1_p;
		T_I1_r  		<= T_I1_p;
		T_R2_r  		<= T_R2_p;
		T_I2_r  		<= T_I2_p;
		T_R3_r  		<= T_R3_p;
		T_I3_r  		<= T_I3_p;
		T_R4_r  		<= T_R4_p;
		T_I4_r  		<= T_I4_p;
		T_R5_r  		<= T_R5_p;
		T_I5_r  		<= T_I5_p;		
		
		
	end
end


always @(*) begin
	
	alu_op_a    = 0;
	alu_op_b    = 0;

	x_0_R_p 	= x_0_R_r;
	x_0_I_p 	= x_0_I_r;
	x_1_R_p 	= x_1_R_r;
	x_1_I_p 	= x_1_I_r;
	x_2_R_p 	= x_2_R_r;
	x_2_I_p 	= x_2_I_r;
	x_3_R_p 	= x_3_R_r;
	x_3_I_p 	= x_3_I_r;
	x_4_R_p 	= x_4_R_r;
	x_4_I_p 	= x_4_I_r;
	x_5_R_p 	= x_5_R_r;
	x_5_I_p 	= x_5_I_r;
	x_6_R_p 	= x_6_R_r;
	x_6_I_p 	= x_6_I_r;
	x_7_R_p 	= x_7_R_r;
	x_7_I_p 	= x_7_I_r;

	S1_R0_p		= S1_R0_r;
	S1_I0_p	    = S1_I0_r;
	S1_R1_p		= S1_R1_r;
	S1_I1_p	    = S1_I1_r;
	S1_R2_p		= S1_R2_r;
	S1_I2_p	    = S1_I2_r;
	S1_R3_p		= S1_R3_r;
	S1_I3_p	    = S1_I3_r;
	S1_R4_p		= S1_R4_r;
	S1_I4_p	    = S1_I4_r;
	S1_R5_p		= S1_R5_r;
	S1_I5_p	    = S1_I5_r;
	S1_R6_p		= S1_R6_r;
	S1_I6_p	    = S1_I6_r;
	S1_R7_p		= S1_R7_r;
	S1_I7_p	    = S1_I7_r;

	S2_R0_p		= S2_R0_r;
	S2_I0_p	    = S2_I0_r;
	S2_R1_p		= S2_R1_r;
	S2_I1_p	    = S2_I1_r;
	S2_R2_p		= S2_R2_r;
	S2_I2_p	    = S2_I2_r;
	S2_R3_p		= S2_R3_r;
	S2_I3_p	    = S2_I3_r;
	S2_R4_p		= S2_R4_r;
	S2_I4_p	    = S2_I4_r;
	S2_R5_p		= S2_R5_r;
	S2_I5_p	    = S2_I5_r;
	S2_R6_p		= S2_R6_r;
	S2_I6_p	    = S2_I6_r;
	S2_R7_p		= S2_R7_r;
	S2_I7_p	    = S2_I7_r;





	T_R0_p  	= T_R0_r;
	T_I0_p  	= T_I0_r;
	T_R1_p  	= T_R1_r;
	T_I1_p  	= T_I1_r;
	T_R2_p  	= T_R2_r;
	T_I2_p  	= T_I2_r;
	T_R3_p  	= T_R3_r;
	T_I3_p  	= T_I3_r;
	T_R4_p  	= T_R4_r;
	T_I4_p  	= T_I4_r;
	T_R5_p  	= T_R5_r;
	T_I5_p  	= T_I5_r;



	if(start_r) begin
		

		x_0_R_p   	= x0_R;
		x_0_I_p   	= x0_I;
		x_1_R_p   	= x1_R;
		x_1_I_p   	= x1_I;
		x_2_R_p   	= x2_R;
		x_2_I_p   	= x2_I;
		x_3_R_p   	= x3_R;
		x_3_I_p   	= x3_I;
		x_4_R_p   	= x4_R;
		x_4_I_p   	= x4_I;
		x_5_R_p   	= x5_R;
		x_5_I_p   	= x5_I;
		x_6_R_p   	= x6_R;
		x_6_I_p   	= x6_I;
		x_7_R_p   	= x7_R;
		x_7_I_p   	= x7_I;
		
		
		X_0_R_r 		= 16'd0;
		X_0_I_r 		= 16'd0;
		X_1_R_r 		= 16'd0;
		X_1_I_r 		= 16'd0;
		X_2_R_r 		= 16'd0;
		X_2_I_r 		= 16'd0;
		X_3_R_r 		= 16'd0;
		X_3_I_r 		= 16'd0;
		X_4_R_r 		= 16'd0;
		X_4_I_r 		= 16'd0;		
		X_5_R_r 		= 16'd0;
		X_5_I_r 		= 16'd0;
		X_6_R_r 		= 16'd0;
		X_6_I_r 		= 16'd0;
		X_7_R_r 		= 16'd0;
		X_7_I_r 		= 16'd0;

	end


	/* Write Back Logic */

	// Stage 1 
	if(wr_enable_i[`WBF_8_S1_R0]) begin
		S1_R0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_I0]) begin
		S1_I0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_R1]) begin
		S1_R1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_I1]) begin
		S1_I1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_R2]) begin
		S1_R2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_I2]) begin
		S1_I2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_R3]) begin
		S1_R3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_I3]) begin
		S1_I3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_R4]) begin
		S1_R4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_I4]) begin
		S1_I4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_R5]) begin
		S1_R5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_I5]) begin
		S1_I5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_R6]) begin
		S1_R6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_I6]) begin
		S1_I6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_R7]) begin
		S1_R7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S1_I7]) begin
		S1_I7_p 		         = wbb;
	end

	// Stage 2 
	if(wr_enable_i[`WBF_8_S2_R0]) begin
		S2_R0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_I0]) begin
		S2_I0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_R1]) begin
		S2_R1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_I1]) begin
		S2_I1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_R2]) begin
		S2_R2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_I2]) begin
		S2_I2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_R3]) begin
		S2_R3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_I3]) begin
		S2_I3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_R4]) begin
		S2_R4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_I4]) begin
		S2_I4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_R5]) begin
		S2_R5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_I5]) begin
		S2_I5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_R6]) begin
		S2_R6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_I6]) begin
		S2_I6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_R7]) begin
		S2_R7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_S2_I7]) begin
		S2_I7_p 		         = wbb;
	end


	// Stage 3
	if(wr_enable_i[`WBF_8_X_R0]) begin
		X_0_R_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_I0]) begin
		X_0_I_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_R1]) begin
		X_1_R_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_I1]) begin
		X_1_I_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_R2]) begin
		X_2_R_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_I2]) begin
		X_2_I_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_R3]) begin
		X_3_R_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_I3]) begin
		X_3_I_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_R4]) begin
		X_4_R_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_I4]) begin
		X_4_I_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_R5]) begin
		X_5_R_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_I5]) begin
		X_5_I_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_R6]) begin
		X_6_R_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_I6]) begin
		X_6_I_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_R7]) begin
		X_7_R_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_X_I7]) begin
		X_7_I_r 		         = wbb;
	end
	if(wr_enable_i[`WBF_8_T_R0]) begin
		T_R0_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_8_T_I0]) begin
		T_I0_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_8_T_R1]) begin
		T_R1_p 		         	= -(wbb[23:8]);
	end
	if(wr_enable_i[`WBF_8_T_I1]) begin
		T_I1_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_8_T_R2]) begin
		T_R2_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_8_T_I2]) begin
		T_I2_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_8_T_R3]) begin
		T_R3_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_8_T_I3]) begin
		T_I3_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_8_T_R4]) begin
		T_R4_p 		         	= -(wbb[23:8]);
	end
	if(wr_enable_i[`WBF_8_T_I4]) begin
		T_I4_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_8_T_R5]) begin
		T_R5_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_8_T_I5]) begin
		T_I5_p 		         	= wbb;
	end
	

	/* ALU Register OP_A */

	if(alu_reg_i[`ALUREG_8_X_R0_TO_OP_A]) begin
		alu_op_a = x_0_R_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_R1_TO_OP_A]) begin
		alu_op_a = x_1_R_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_R2_TO_OP_A]) begin
		alu_op_a = x_2_R_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_R3_TO_OP_A]) begin
		alu_op_a = x_3_R_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_I0_TO_OP_A]) begin
		alu_op_a = x_0_I_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_I1_TO_OP_A]) begin
		alu_op_a = x_1_I_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_I2_TO_OP_A]) begin
		alu_op_a = x_2_I_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_I3_TO_OP_A]) begin
		alu_op_a = x_3_I_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_R0_TO_OP_A]) begin
		alu_op_a = S1_R0_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_I0_TO_OP_A]) begin
		alu_op_a = S1_I0_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_R1_TO_OP_A]) begin
		alu_op_a = S1_R1_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_I1_TO_OP_A]) begin
		alu_op_a = S1_I1_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_R4_TO_OP_A]) begin
		alu_op_a = S1_R4_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_I4_TO_OP_A]) begin
		alu_op_a = S1_I4_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_R5_TO_OP_A]) begin
		alu_op_a = S1_R5_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_I5_TO_OP_A]) begin
		alu_op_a = S1_I5_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_R0_TO_OP_A]) begin
		alu_op_a = S2_R0_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_I0_TO_OP_A]) begin
		alu_op_a = S2_I0_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_R1_TO_OP_A]) begin
		alu_op_a = S2_R1_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_I1_TO_OP_A]) begin
		alu_op_a = S2_I1_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_R2_TO_OP_A]) begin
		alu_op_a = S2_R2_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_I2_TO_OP_A]) begin
		alu_op_a = S2_I2_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_R3_TO_OP_A]) begin
		alu_op_a = S2_R3_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_I3_TO_OP_A]) begin
		alu_op_a = S2_I3_p;
	end
	else if(alu_reg_i[`ALUREG_W_8_1_REEL_TO_OP_A]) begin
		alu_op_a = `W_8_1_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_8_1_IMAG_TO_OP_A]) begin
		alu_op_a = `W_8_1_IMAG;
	end
	else if(alu_reg_i[`ALUREG_W_8_3_REEL_TO_OP_A]) begin
		alu_op_a = `W_8_3_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_8_3_IMAG_TO_OP_A]) begin
		alu_op_a = `W_8_3_IMAG;
	end
	else if(alu_reg_i[`ALUREG_8_T_R0_TO_OP_A]) begin
		alu_op_a = T_R0_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_I0_TO_OP_A]) begin
		alu_op_a = T_I0_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_R3_TO_OP_A]) begin
		alu_op_a = T_R3_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_I3_TO_OP_A]) begin
		alu_op_a = T_I3_p;
	end





	/* ALU Register OP_B */

	if(alu_reg_i[`ALUREG_8_X_R4_TO_OP_B]) begin
		alu_op_b = x_4_R_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_R5_TO_OP_B]) begin
		alu_op_b = x_5_R_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_R6_TO_OP_B]) begin
		alu_op_b = x_6_R_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_R7_TO_OP_B]) begin
		alu_op_b = x_7_R_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_I4_TO_OP_B]) begin
		alu_op_b = x_4_I_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_I5_TO_OP_B]) begin
		alu_op_b = x_5_I_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_I6_TO_OP_B]) begin
		alu_op_b = x_6_I_p;
	end
	else if(alu_reg_i[`ALUREG_8_X_I7_TO_OP_B]) begin
		alu_op_b = x_7_I_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_R2_TO_OP_B]) begin
		alu_op_b = S1_R2_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_I2_TO_OP_B]) begin
		alu_op_b = S1_I2_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_R3_TO_OP_B]) begin
		alu_op_b = S1_R3_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_I3_TO_OP_B]) begin
		alu_op_b = -S1_I3_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_R6_TO_OP_B]) begin
		alu_op_b = S1_R6_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_I6_TO_OP_B]) begin
		alu_op_b = S1_I6_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_R7_TO_OP_B]) begin
		alu_op_b = S1_R7_p;
	end
	else if(alu_reg_i[`ALUREG_8_S1_I7_TO_OP_B]) begin
		alu_op_b = -S1_I7_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_R4_TO_OP_B]) begin
		alu_op_b = S2_R4_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_I4_TO_OP_B]) begin
		alu_op_b = S2_I4_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_R5_TO_OP_B]) begin
		alu_op_b = S2_R5_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_I5_TO_OP_B]) begin
		alu_op_b = S2_I5_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_R6_TO_OP_B]) begin
		alu_op_b = S2_R6_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_I6_TO_OP_B]) begin
		alu_op_b = -S2_I6_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_R7_TO_OP_B]) begin
		alu_op_b = S2_R7_p;
	end
	else if(alu_reg_i[`ALUREG_8_S2_I7_TO_OP_B]) begin
		alu_op_b = S2_I7_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_R1_TO_OP_B]) begin
		alu_op_b = T_R1_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_I1_TO_OP_B]) begin
		alu_op_b = T_I1_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_R2_TO_OP_B]) begin
		alu_op_b = T_R2_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_I2_TO_OP_B]) begin
		alu_op_b = T_I2_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_R4_TO_OP_B]) begin
		alu_op_b = T_R4_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_I4_TO_OP_B]) begin
		alu_op_b = T_I4_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_R5_TO_OP_B]) begin
		alu_op_b = T_R5_p;
	end
	else if(alu_reg_i[`ALUREG_8_T_I5_TO_OP_B]) begin
		alu_op_b = T_I5_p;
	end








	


end


assign wbb = alu_op_c;


assign X_0_R_o = X_0_R_r;
assign X_0_I_o = X_0_I_r;
assign X_1_R_o = X_1_R_r;
assign X_1_I_o = X_1_I_r;
assign X_2_R_o = X_2_R_r;
assign X_2_I_o = X_2_I_r;
assign X_3_R_o = X_3_R_r;
assign X_3_I_o = X_3_I_r;
assign X_4_R_o = X_4_R_r;
assign X_4_I_o = X_4_I_r;
assign X_5_R_o = X_5_R_r;
assign X_5_I_o = X_5_I_r;
assign X_6_R_o = X_6_R_r;
assign X_6_I_o = X_6_I_r;
assign X_7_R_o = X_7_R_r;
assign X_7_I_o = X_7_I_r;


endmodule