`include "constants_fft.vh"

module fft16_datapath(

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
							input [15:0] x_8_R_i,
							input [15:0] x_8_I_i,
							input [15:0] x_9_R_i,
							input [15:0] x_9_I_i,
							input [15:0] x_10_R_i,
							input [15:0] x_10_I_i,
							input [15:0] x_11_R_i,
							input [15:0] x_11_I_i,
							input [15:0] x_12_R_i,
							input [15:0] x_12_I_i,
							input [15:0] x_13_R_i,
							input [15:0] x_13_I_i,
							input [15:0] x_14_R_i,
							input [15:0] x_14_I_i,
							input [15:0] x_15_R_i,
							input [15:0] x_15_I_i,							

							input [175:0] alu_reg_i,
							input [4:0] alu_mode_i,
							input [165:0] wr_enable_i,

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
							output [15:0] X_7_I_o,
							output [15:0] X_8_R_o,
							output [15:0] X_8_I_o,
							output [15:0] X_9_R_o,
							output [15:0] X_9_I_o,
							output [15:0] X_10_R_o,
							output [15:0] X_10_I_o,
							output [15:0] X_11_R_o,
							output [15:0] X_11_I_o,
							output [15:0] X_12_R_o,
							output [15:0] X_12_I_o,
							output [15:0] X_13_R_o,
							output [15:0] X_13_I_o,
							output [15:0] X_14_R_o,
							output [15:0] X_14_I_o,
							output [15:0] X_15_R_o,
							output [15:0] X_15_I_o							
					);






reg [15:0] X_0_R_r,  X_0_I_r,  X_0_R_p,  X_0_I_p,
		   X_1_R_r,  X_1_I_r,  X_1_R_p,  X_1_I_p,
		   X_2_R_r,  X_2_I_r,  X_2_R_p,  X_2_I_p,
		   X_3_R_r,  X_3_I_r,  X_3_R_p,  X_3_I_p,
		   X_4_R_r,  X_4_I_r,  X_4_R_p,  X_4_I_p,
		   X_5_R_r,  X_5_I_r,  X_5_R_p,  X_5_I_p,
		   X_6_R_r,  X_6_I_r,  X_6_R_p,  X_6_I_p,
		   X_7_R_r,  X_7_I_r,  X_7_R_p,  X_7_I_p,
		   X_8_R_r,  X_8_I_r,  X_8_R_p,  X_8_I_p,
		   X_9_R_r,  X_9_I_r,  X_9_R_p,  X_9_I_p,
		   X_10_R_r, X_10_I_r, X_10_R_p, X_10_I_p,
		   X_11_R_r, X_11_I_r, X_11_R_p, X_11_I_p,
		   X_12_R_r, X_12_I_r, X_12_R_p, X_12_I_p,
		   X_13_R_r, X_13_I_r, X_13_R_p, X_13_I_p,
		   X_14_R_r, X_14_I_r, X_14_R_p, X_14_I_p,
		   X_15_R_r, X_15_I_r, X_15_R_p, X_15_I_p;


reg [15:0] S1_R0_r,  S1_I0_r,  S1_R0_p,  S1_I0_p,
		   S1_R1_r,  S1_I1_r,  S1_R1_p,  S1_I1_p,
		   S1_R2_r,  S1_I2_r,  S1_R2_p,  S1_I2_p,
		   S1_R3_r,  S1_I3_r,  S1_R3_p,  S1_I3_p,
		   S1_R4_r,  S1_I4_r,  S1_R4_p,  S1_I4_p,
		   S1_R5_r,  S1_I5_r,  S1_R5_p,  S1_I5_p,
		   S1_R6_r,  S1_I6_r,  S1_R6_p,  S1_I6_p,
		   S1_R7_r,  S1_I7_r,  S1_R7_p,  S1_I7_p,
		   S1_R8_r,  S1_I8_r,  S1_R8_p,  S1_I8_p,
		   S1_R9_r,  S1_I9_r,  S1_R9_p,  S1_I9_p,
		   S1_R10_r, S1_I10_r, S1_R10_p, S1_I10_p,
		   S1_R11_r, S1_I11_r, S1_R11_p, S1_I11_p,
		   S1_R12_r, S1_I12_r, S1_R12_p, S1_I12_p,
		   S1_R13_r, S1_I13_r, S1_R13_p, S1_I13_p,
		   S1_R14_r, S1_I14_r, S1_R14_p, S1_I14_p,
		   S1_R15_r, S1_I15_r, S1_R15_p, S1_I15_p,

		   S2_R0_r,  S2_I0_r,  S2_R0_p,  S2_I0_p,
		   S2_R1_r,  S2_I1_r,  S2_R1_p,  S2_I1_p,
		   S2_R2_r,  S2_I2_r,  S2_R2_p,  S2_I2_p,
		   S2_R3_r,  S2_I3_r,  S2_R3_p,  S2_I3_p,
		   S2_R4_r,  S2_I4_r,  S2_R4_p,  S2_I4_p,
		   S2_R5_r,  S2_I5_r,  S2_R5_p,  S2_I5_p,
		   S2_R6_r,  S2_I6_r,  S2_R6_p,  S2_I6_p,
		   S2_R7_r,  S2_I7_r,  S2_R7_p,  S2_I7_p,
		   S2_R8_r,  S2_I8_r,  S2_R8_p,  S2_I8_p,
		   S2_R9_r,  S2_I9_r,  S2_R9_p,  S2_I9_p,
		   S2_R10_r, S2_I10_r, S2_R10_p, S2_I10_p,
		   S2_R11_r, S2_I11_r, S2_R11_p, S2_I11_p,
		   S2_R12_r, S2_I12_r, S2_R12_p, S2_I12_p,
		   S2_R13_r, S2_I13_r, S2_R13_p, S2_I13_p,
		   S2_R14_r, S2_I14_r, S2_R14_p, S2_I14_p,
		   S2_R15_r, S2_I15_r, S2_R15_p, S2_I15_p,

		   S3_R0_r,  S3_I0_r,  S3_R0_p,  S3_I0_p,
		   S3_R1_r,  S3_I1_r,  S3_R1_p,  S3_I1_p,
		   S3_R2_r,  S3_I2_r,  S3_R2_p,  S3_I2_p,
		   S3_R3_r,  S3_I3_r,  S3_R3_p,  S3_I3_p,
		   S3_R4_r,  S3_I4_r,  S3_R4_p,  S3_I4_p,
		   S3_R5_r,  S3_I5_r,  S3_R5_p,  S3_I5_p,
		   S3_R6_r,  S3_I6_r,  S3_R6_p,  S3_I6_p,
		   S3_R7_r,  S3_I7_r,  S3_R7_p,  S3_I7_p,
		   S3_R8_r,  S3_I8_r,  S3_R8_p,  S3_I8_p,
		   S3_R9_r,  S3_I9_r,  S3_R9_p,  S3_I9_p,
		   S3_R10_r, S3_I10_r, S3_R10_p, S3_I10_p,
		   S3_R11_r, S3_I11_r, S3_R11_p, S3_I11_p,
		   S3_R12_r, S3_I12_r, S3_R12_p, S3_I12_p,
		   S3_R13_r, S3_I13_r, S3_R13_p, S3_I13_p,
		   S3_R14_r, S3_I14_r, S3_R14_p, S3_I14_p,
		   S3_R15_r, S3_I15_r, S3_R15_p, S3_I15_p;


reg [15:0] x_0_R_r,   x_0_I_r,  x_0_R_p,   x_0_I_p,
		   x_1_R_r,   x_1_I_r,  x_1_R_p,   x_1_I_p,
		   x_2_R_r,   x_2_I_r,  x_2_R_p,   x_2_I_p,
		   x_3_R_r,   x_3_I_r,  x_3_R_p,   x_3_I_p,
		   x_4_R_r,   x_4_I_r,  x_4_R_p,   x_4_I_p,
		   x_5_R_r,   x_5_I_r,  x_5_R_p,   x_5_I_p,
		   x_6_R_r,   x_6_I_r,  x_6_R_p,   x_6_I_p,
		   x_7_R_r,   x_7_I_r,  x_7_R_p,   x_7_I_p,
		   x_8_R_r,   x_8_I_r,  x_8_R_p,   x_8_I_p,
		   x_9_R_r,   x_9_I_r,  x_9_R_p,   x_9_I_p,
		   x_10_R_r,  x_10_I_r, x_10_R_p,  x_10_I_p,
		   x_11_R_r,  x_11_I_r, x_11_R_p,  x_11_I_p,
		   x_12_R_r,  x_12_I_r, x_12_R_p,  x_12_I_p,
		   x_13_R_r,  x_13_I_r, x_13_R_p,  x_13_I_p,
		   x_14_R_r,  x_14_I_r, x_14_R_p,  x_14_I_p,
		   x_15_R_r,  x_15_I_r, x_15_R_p,  x_15_I_p;

reg [15:0] x0_R , x0_I,
		   x1_R , x1_I,
		   x2_R , x2_I,
		   x3_R , x3_I,
		   x4_R , x4_I,
		   x5_R , x5_I,
		   x6_R , x6_I,
		   x7_R , x7_I,
		   x8_R , x8_I,
		   x9_R , x9_I,
		   x10_R, x10_I,
		   x11_R, x11_I,
		   x12_R, x12_I,
		   x13_R, x13_I,
		   x14_R, x14_I,
		   x15_R, x15_I;		   


 reg  [15:0] T_R0_r , T_I0_r , T_R0_p , T_I0_p, 
 		  	 T_R1_r , T_I1_r , T_R1_p , T_I1_p,
 		   	 T_R2_r , T_I2_r , T_R2_p , T_I2_p,
 		  	 T_R3_r , T_I3_r , T_R3_p , T_I3_p,
 		   	 T_R4_r , T_I4_r , T_R4_p , T_I4_p,	
 		   	 T_R5_r , T_I5_r , T_R5_p , T_I5_p,
 		   	 T_R6_r , T_I6_r , T_R6_p , T_I6_p, 
 		  	 T_R7_r , T_I7_r , T_R7_p , T_I7_p,
 		   	 T_R8_r , T_I8_r , T_R8_p , T_I8_p,
 		  	 T_R9_r , T_I9_r , T_R9_p , T_I9_p,
 		   	 T_R10_r, T_I10_r, T_R10_p, T_I10_p,	
 		   	 T_R11_r, T_I11_r, T_R11_p, T_I11_p,
 		   	 T_R12_r, T_I12_r, T_R12_p, T_I12_p,
 		   	 T_R13_r, T_I13_r, T_R13_p, T_I13_p,	
 		   	 T_R14_r, T_I14_r, T_R14_p, T_I14_p,
 		   	 T_R15_r, T_I15_r, T_R15_p, T_I15_p,
 		   	 T_R16_r, T_I16_r, T_R16_p, T_I16_p,	
 		   	 T_R17_r, T_I17_r, T_R17_p, T_I17_p;


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

		X_0_R_r 		<= 16'd0;
		X_0_I_r 		<= 16'd0;
		X_1_R_r 		<= 16'd0;
		X_1_I_r 		<= 16'd0;
		X_2_R_r 		<= 16'd0;
		X_2_I_r 		<= 16'd0;
		X_3_R_r 		<= 16'd0;
		X_3_I_r 		<= 16'd0;
		X_4_R_r 		<= 16'd0;
		X_4_I_r 		<= 16'd0;		
		X_5_R_r 		<= 16'd0;
		X_5_I_r 		<= 16'd0;
		X_6_R_r 		<= 16'd0;
		X_6_I_r 		<= 16'd0;
		X_7_R_r 		<= 16'd0;
		X_7_I_r 		<= 16'd0;
		X_8_R_r 		<= 16'd0;
		X_8_I_r 		<= 16'd0;
		X_9_R_r 		<= 16'd0;
		X_9_I_r 		<= 16'd0;
		X_10_R_r 		<= 16'd0;
		X_10_I_r 		<= 16'd0;
		X_11_R_r 		<= 16'd0;
		X_11_I_r 		<= 16'd0;
		X_12_R_r 		<= 16'd0;
		X_12_I_r 		<= 16'd0;		
		X_13_R_r 		<= 16'd0;
		X_13_I_r 		<= 16'd0;
		X_14_R_r 		<= 16'd0;
		X_14_I_r 		<= 16'd0;
		X_15_R_r 		<= 16'd0;
		X_15_I_r 		<= 16'd0;

		X_0_R_p			<= 16'd0;
		X_1_R_p			<= 16'd0;
		X_2_R_p 		<= 16'd0;
		X_3_R_p 		<= 16'd0;
		X_4_R_p 		<= 16'd0;
		X_5_R_p 		<= 16'd0;
		X_6_R_p 		<= 16'd0;
		X_7_R_p 		<= 16'd0;
		X_8_R_p			<= 16'd0;
		X_9_R_p			<= 16'd0;
		X_10_R_p 		<= 16'd0;
		X_11_R_p 		<= 16'd0;
		X_12_R_p 		<= 16'd0;
		X_13_R_p 		<= 16'd0;
		X_14_R_p 		<= 16'd0;
		X_15_R_p 		<= 16'd0;
		X_0_I_p			<= 16'd0;
		X_1_I_p			<= 16'd0;
		X_2_I_p 		<= 16'd0;
		X_3_I_p 		<= 16'd0;
		X_4_I_p 		<= 16'd0;
		X_5_I_p 		<= 16'd0;
		X_6_I_p 		<= 16'd0;
		X_7_I_p 		<= 16'd0;
		X_8_I_p			<= 16'd0;
		X_9_I_p			<= 16'd0;
		X_10_I_p 		<= 16'd0;
		X_11_I_p 		<= 16'd0;
		X_12_I_p 		<= 16'd0;
		X_13_I_p 		<= 16'd0;
		X_14_I_p 		<= 16'd0;
		X_15_I_p 		<= 16'd0;


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
		S1_R8_r 		<= 16'd0;
		S1_I8_r	  		<= 16'd0;
		S1_R9_r 		<= 16'd0;
		S1_I9_r	  		<= 16'd0;
		S1_R10_r 		<= 16'd0;
		S1_I10_r	  	<= 16'd0;
		S1_R11_r 		<= 16'd0;
		S1_I11_r	  	<= 16'd0;
		S1_R12_r 		<= 16'd0;
		S1_I12_r	  	<= 16'd0;
		S1_R13_r 		<= 16'd0;
		S1_I13_r	  	<= 16'd0;
		S1_R14_r 		<= 16'd0;
		S1_I14_r	  	<= 16'd0;
		S1_R15_r 		<= 16'd0;
		S1_I15_r	  	<= 16'd0;

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
		S1_R8_p 		<= 16'd0;
		S1_I8_p	  		<= 16'd0;
		S1_R9_p 		<= 16'd0;
		S1_I9_p	  		<= 16'd0;
		S1_R10_p 		<= 16'd0;
		S1_I10_p	  	<= 16'd0;
		S1_R11_p 		<= 16'd0;
		S1_I11_p	  	<= 16'd0;
		S1_R12_p 		<= 16'd0;
		S1_I12_p	  	<= 16'd0;
		S1_R13_p 		<= 16'd0;
		S1_I13_p	  	<= 16'd0;
		S1_R14_p 		<= 16'd0;
		S1_I14_p	  	<= 16'd0;
		S1_R15_p 		<= 16'd0;
		S1_I15_p	  	<= 16'd0;		

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
		S2_R8_r 		<= 16'd0;
		S2_I8_r	  		<= 16'd0;
		S2_R9_r 		<= 16'd0;
		S2_I9_r	  		<= 16'd0;
		S2_R10_r 		<= 16'd0;
		S2_I10_r	  	<= 16'd0;
		S2_R11_r 		<= 16'd0;
		S2_I11_r	  	<= 16'd0;
		S2_R12_r 		<= 16'd0;
		S2_I12_r	  	<= 16'd0;
		S2_R13_r 		<= 16'd0;
		S2_I13_r	  	<= 16'd0;
		S2_R14_r 		<= 16'd0;
		S2_I14_r	  	<= 16'd0;
		S2_R15_r 		<= 16'd0;
		S2_I15_r	  	<= 16'd0;

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
		S2_R8_p 		<= 16'd0;
		S2_I8_p	  		<= 16'd0;
		S2_R9_p 		<= 16'd0;
		S2_I9_p	  		<= 16'd0;
		S2_R10_p 		<= 16'd0;
		S2_I10_p	  	<= 16'd0;
		S2_R11_p 		<= 16'd0;
		S2_I11_p	  	<= 16'd0;
		S2_R12_p 		<= 16'd0;
		S2_I12_p	  	<= 16'd0;
		S2_R13_p 		<= 16'd0;
		S2_I13_p	  	<= 16'd0;
		S2_R14_p 		<= 16'd0;
		S2_I14_p	  	<= 16'd0;
		S2_R15_p 		<= 16'd0;
		S2_I15_p	  	<= 16'd0;

		S3_R0_r 		<= 16'd0;
		S3_I0_r	  		<= 16'd0;
		S3_R1_r 		<= 16'd0;
		S3_I1_r	  		<= 16'd0;
		S3_R2_r 		<= 16'd0;
		S3_I2_r	  		<= 16'd0;
		S3_R3_r 		<= 16'd0;
		S3_I3_r	  		<= 16'd0;
		S3_R4_r 		<= 16'd0;
		S3_I4_r	  		<= 16'd0;
		S3_R5_r 		<= 16'd0;
		S3_I5_r	  		<= 16'd0;
		S3_R6_r 		<= 16'd0;
		S3_I6_r	  		<= 16'd0;
		S3_R7_r 		<= 16'd0;
		S3_I7_r	  		<= 16'd0;
		S3_R8_r 		<= 16'd0;
		S3_I8_r	  		<= 16'd0;
		S3_R9_r 		<= 16'd0;
		S3_I9_r	  		<= 16'd0;
		S3_R10_r 		<= 16'd0;
		S3_I10_r	  	<= 16'd0;
		S3_R11_r 		<= 16'd0;
		S3_I11_r	  	<= 16'd0;
		S3_R12_r 		<= 16'd0;
		S3_I12_r	  	<= 16'd0;
		S3_R13_r 		<= 16'd0;
		S3_I13_r	  	<= 16'd0;
		S3_R14_r 		<= 16'd0;
		S3_I14_r	  	<= 16'd0;
		S3_R15_r 		<= 16'd0;
		S3_I15_r	  	<= 16'd0;

		S3_R0_p 		<= 16'd0;
		S3_I0_p	  		<= 16'd0;
		S3_R1_p 		<= 16'd0;
		S3_I1_p	  		<= 16'd0;
		S3_R2_p 		<= 16'd0;
		S3_I2_p	  		<= 16'd0;
		S3_R3_p 		<= 16'd0;
		S3_I3_p	  		<= 16'd0;
		S3_R4_p 		<= 16'd0;
		S3_I4_p	  		<= 16'd0;
		S3_R5_p 		<= 16'd0;
		S3_I5_p	  		<= 16'd0;
		S3_R6_p 		<= 16'd0;
		S3_I6_p	  		<= 16'd0;
		S3_R7_p 		<= 16'd0;
		S3_I7_p	  		<= 16'd0;
		S3_R8_p 		<= 16'd0;
		S3_I8_p	  		<= 16'd0;
		S3_R9_p 		<= 16'd0;
		S3_I9_p	  		<= 16'd0;
		S3_R10_p 		<= 16'd0;
		S3_I10_p	  	<= 16'd0;
		S3_R11_p 		<= 16'd0;
		S3_I11_p	  	<= 16'd0;
		S3_R12_p 		<= 16'd0;
		S3_I12_p	  	<= 16'd0;
		S3_R13_p 		<= 16'd0;
		S3_I13_p	  	<= 16'd0;
		S3_R14_p 		<= 16'd0;
		S3_I14_p	  	<= 16'd0;
		S3_R15_p 		<= 16'd0;
		S3_I15_p	  	<= 16'd0;

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
		x_8_R_r 		<= 16'd0;
		x_8_I_r 		<= 16'd0;
		x_9_R_r 		<= 16'd0;
		x_9_I_r 		<= 16'd0;
		x_10_R_r 		<= 16'd0;
		x_10_I_r 		<= 16'd0;
		x_11_R_r 		<= 16'd0;
		x_11_I_r 		<= 16'd0;
		x_12_R_r 		<= 16'd0;
		x_12_I_r 		<= 16'd0;
		x_13_R_r 		<= 16'd0;
		x_13_I_r 		<= 16'd0;
		x_14_R_r 		<= 16'd0;
		x_14_I_r 		<= 16'd0;
		x_15_R_r 		<= 16'd0;
		x_15_I_r 		<= 16'd0;

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
		x_8_R_p			<= 16'd0;
		x_8_I_p 		<= 16'd0;
		x_9_R_p 		<= 16'd0;
		x_9_I_p 		<= 16'd0;
		x_10_R_p 		<= 16'd0;
		x_10_I_p 		<= 16'd0;
		x_11_R_p 		<= 16'd0;
		x_11_I_p 		<= 16'd0;
		x_12_R_p 		<= 16'd0;
		x_12_I_p 		<= 16'd0;
		x_13_R_p 		<= 16'd0;
		x_13_I_p 		<= 16'd0;
		x_14_R_p 		<= 16'd0;
		x_14_I_p 		<= 16'd0;
		x_15_R_p 		<= 16'd0;
		x_15_I_p 		<= 16'd0;


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
		T_R6_r  		<= 16'd0;
		T_I6_r  		<= 16'd0;
		T_R6_p 			<= 16'd0;
		T_I6_p  		<= 16'd0;
		T_R7_r  		<= 16'd0;
		T_I7_r  		<= 16'd0;
		T_R7_p 			<= 16'd0;
		T_I7_p  		<= 16'd0;
		T_R8_r  		<= 16'd0;
		T_I8_r  		<= 16'd0;
		T_R8_p 			<= 16'd0;
		T_I8_p  		<= 16'd0;
		T_R9_r  		<= 16'd0;
		T_I9_r  		<= 16'd0;
		T_R9_p 			<= 16'd0;
		T_I9_p  		<= 16'd0;
		T_R10_r  		<= 16'd0;
		T_I10_r  		<= 16'd0;
		T_R10_p 		<= 16'd0;
		T_I10_p  		<= 16'd0;
		T_R11_r  		<= 16'd0;
		T_I11_r  		<= 16'd0;
		T_R11_p 		<= 16'd0;
		T_I11_p  		<= 16'd0;
		T_R12_r  		<= 16'd0;
		T_I12_r  		<= 16'd0;
		T_R12_p 		<= 16'd0;
		T_I12_p  		<= 16'd0;
		T_R13_r  		<= 16'd0;
		T_I13_r  		<= 16'd0;
		T_R13_p 		<= 16'd0;
		T_I13_p  		<= 16'd0;
		T_R14_r  		<= 16'd0;
		T_I14_r  		<= 16'd0;
		T_R14_p 		<= 16'd0;
		T_I14_p  		<= 16'd0;
		T_R15_r  		<= 16'd0;
		T_I15_r  		<= 16'd0;
		T_R15_p 		<= 16'd0;
		T_I15_p  		<= 16'd0;
		T_R16_r  		<= 16'd0;
		T_I16_r  		<= 16'd0;
		T_R16_p 		<= 16'd0;
		T_I16_p  		<= 16'd0;
		T_R17_r  		<= 16'd0;
		T_I17_r  		<= 16'd0;
		T_R17_p 		<= 16'd0;
		T_I17_p  		<= 16'd0;

		start_r			<= 0;



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
		x8_R 			<= x_8_R_i;
		x8_I 			<= x_8_I_i;
		x9_R 			<= x_9_R_i;
		x9_I 			<= x_9_I_i;
		x10_R 			<= x_10_R_i;
		x10_I 			<= x_10_I_i;
		x11_R 			<= x_11_R_i;
		x11_I 			<= x_11_I_i;
		x12_R 			<= x_12_R_i;
		x12_I 			<= x_12_I_i;
		x13_R 			<= x_13_R_i;
		x13_I 			<= x_13_I_i;
		x14_R 			<= x_14_R_i;
		x14_I 			<= x_14_I_i;
		x15_R 			<= x_15_R_i;
		x15_I 			<= x_15_I_i;


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
		X_8_R_r 		<= X_8_R_p;
		X_8_I_r 		<= X_8_I_p;
		X_9_R_r 		<= X_9_R_p;
		X_9_I_r 		<= X_9_I_p;
		X_10_R_r 		<= X_10_R_p;
		X_10_I_r 		<= X_10_I_p;
		X_11_R_r 		<= X_11_R_p;
		X_11_I_r 		<= X_11_I_p;
		X_12_R_r 		<= X_12_R_p;
		X_12_I_r 		<= X_12_I_p;		
		X_13_R_r 		<= X_13_R_p;
		X_13_I_r 		<= X_13_I_p;
		X_14_R_r 		<= X_14_R_p;
		X_14_I_r 		<= X_14_I_p;
		X_15_R_r 		<= X_15_R_p;
		X_15_I_r 		<= X_15_I_p;

		x_0_R_r 		<= x_0_R_p;
		x_0_I_r  		<= x_0_I_p;
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
		x_8_R_r 		<= x_8_R_p;
		x_8_I_r  		<= x_8_I_p;
		x_9_R_r 		<= x_9_R_p;
		x_9_I_r 		<= x_9_I_p;
		x_10_R_r 		<= x_10_R_p;
		x_10_I_r 		<= x_10_I_p;
		x_11_R_r 		<= x_11_R_p;
		x_11_I_r 		<= x_11_I_p;
		x_12_R_r 		<= x_12_R_p;
		x_12_I_r 		<= x_12_I_p;
		x_13_R_r 		<= x_13_R_p;
		x_13_I_r 		<= x_13_I_p;
		x_14_R_r 		<= x_14_R_p;
		x_14_I_r 		<= x_14_I_p;
		x_15_R_r 		<= x_15_R_p;
		x_15_I_r 		<= x_15_I_p;

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
		S1_R8_r			<= S1_R8_p;
		S1_I8_r	    	<= S1_I8_p;
		S1_R9_r			<= S1_R9_p;
		S1_I9_r	    	<= S1_I9_p;
		S1_R10_r		<= S1_R10_p;
		S1_I10_r	    <= S1_I10_p;
		S1_R11_r		<= S1_R11_p;
		S1_I11_r	    <= S1_I11_p;
		S1_R12_r		<= S1_R12_p;
		S1_I12_r	    <= S1_I12_p;
		S1_R13_r		<= S1_R13_p;
		S1_I13_r	    <= S1_I13_p;
		S1_R14_r		<= S1_R14_p;
		S1_I14_r	    <= S1_I14_p;
		S1_R15_r		<= S1_R15_p;
		S1_I15_r	    <= S1_I15_p;

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
		S2_R8_r			<= S2_R8_p;
		S2_I8_r	    	<= S2_I8_p;
		S2_R9_r			<= S2_R9_p;
		S2_I9_r	    	<= S2_I9_p;
		S2_R10_r		<= S2_R10_p;
		S2_I10_r	    <= S2_I10_p;
		S2_R11_r		<= S2_R11_p;
		S2_I11_r	    <= S2_I11_p;
		S2_R12_r		<= S2_R12_p;
		S2_I12_r	    <= S2_I12_p;
		S2_R13_r		<= S2_R13_p;
		S2_I13_r	    <= S2_I13_p;
		S2_R14_r		<= S2_R14_p;
		S2_I14_r	    <= S2_I14_p;
		S2_R15_r		<= S2_R15_p;
		S2_I15_r	    <= S2_I15_p;

		S3_R0_r			<= S3_R0_p;
		S3_I0_r	    	<= S3_I0_p;
		S3_R1_r			<= S3_R1_p;
		S3_I1_r	    	<= S3_I1_p;
		S3_R2_r			<= S3_R2_p;
		S3_I2_r	    	<= S3_I2_p;
		S3_R3_r			<= S3_R3_p;
		S3_I3_r	    	<= S3_I3_p;
		S3_R4_r			<= S3_R4_p;
		S3_I4_r	    	<= S3_I4_p;
		S3_R5_r			<= S3_R5_p;
		S3_I5_r	    	<= S3_I5_p;
		S3_R6_r			<= S3_R6_p;
		S3_I6_r	    	<= S3_I6_p;
		S3_R7_r			<= S3_R7_p;
		S3_I7_r	    	<= S3_I7_p;
		S3_R8_r			<= S3_R8_p;
		S3_I8_r	    	<= S3_I8_p;
		S3_R9_r			<= S3_R9_p;
		S3_I9_r	    	<= S3_I9_p;
		S3_R10_r		<= S3_R10_p;
		S3_I10_r	    <= S3_I10_p;
		S3_R11_r		<= S3_R11_p;
		S3_I11_r	    <= S3_I11_p;
		S3_R12_r		<= S3_R12_p;
		S3_I12_r	    <= S3_I12_p;
		S3_R13_r		<= S3_R13_p;
		S3_I13_r	    <= S3_I13_p;
		S3_R14_r		<= S3_R14_p;
		S3_I14_r	    <= S3_I14_p;
		S3_R15_r		<= S3_R15_p;
		S3_I15_r	    <= S3_I15_p;




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
		T_R6_r  		<= T_R6_p;
		T_I6_r  		<= T_I6_p;
		T_R7_r  		<= T_R7_p;
		T_I7_r  		<= T_I7_p;
		T_R8_r  		<= T_R8_p;
		T_I8_r  		<= T_I8_p;
		T_R9_r  		<= T_R9_p;
		T_I9_r  		<= T_I9_p;
		T_R10_r  		<= T_R10_p;
		T_I10_r  		<= T_I10_p;
		T_R11_r  		<= T_R11_p;
		T_I11_r  		<= T_I11_p;	
		T_R12_r  		<= T_R12_p;
		T_I12_r  		<= T_I12_p;
		T_R13_r  		<= T_R13_p;
		T_I13_r  		<= T_I13_p;
		T_R14_r  		<= T_R14_p;
		T_I14_r  		<= T_I14_p;
		T_R15_r  		<= T_R15_p;
		T_I15_r  		<= T_I15_p;	
		T_R16_r  		<= T_R16_p;
		T_I16_r  		<= T_I16_p;
		T_R17_r  		<= T_R17_p;
		T_I17_r  		<= T_I17_p;		
		
		
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
	x_8_R_p 	= x_8_R_r;
	x_8_I_p 	= x_8_I_r;
	x_9_R_p 	= x_9_R_r;
	x_9_I_p 	= x_9_I_r;
	x_10_R_p 	= x_10_R_r;
	x_10_I_p 	= x_10_I_r;
	x_11_R_p 	= x_11_R_r;
	x_11_I_p 	= x_11_I_r;
	x_12_R_p 	= x_12_R_r;
	x_12_I_p 	= x_12_I_r;
	x_13_R_p 	= x_13_R_r;
	x_13_I_p 	= x_13_I_r;
	x_14_R_p 	= x_14_R_r;
	x_14_I_p 	= x_14_I_r;
	x_15_R_p 	= x_15_R_r;
	x_15_I_p 	= x_15_I_r;	

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
	S1_R8_p		= S1_R8_r;
	S1_I8_p	    = S1_I8_r;
	S1_R9_p		= S1_R9_r;
	S1_I9_p	    = S1_I9_r;
	S1_R10_p	= S1_R10_r;
	S1_I10_p	= S1_I10_r;
	S1_R11_p	= S1_R11_r;
	S1_I11_p	= S1_I11_r;
	S1_R12_p	= S1_R12_r;
	S1_I12_p	= S1_I12_r;
	S1_R13_p	= S1_R13_r;
	S1_I13_p	= S1_I13_r;
	S1_R14_p	= S1_R14_r;
	S1_I14_p	= S1_I14_r;
	S1_R15_p	= S1_R15_r;
	S1_I15_p	= S1_I15_r;

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
	S2_R8_p		= S2_R8_r;
	S2_I8_p	    = S2_I8_r;
	S2_R9_p		= S2_R9_r;
	S2_I9_p	    = S2_I9_r;
	S2_R10_p	= S2_R10_r;
	S2_I10_p	= S2_I10_r;
	S2_R11_p	= S2_R11_r;
	S2_I11_p	= S2_I11_r;
	S2_R12_p	= S2_R12_r;
	S2_I12_p	= S2_I12_r;
	S2_R13_p	= S2_R13_r;
	S2_I13_p	= S2_I13_r;
	S2_R14_p	= S2_R14_r;
	S2_I14_p	= S2_I14_r;
	S2_R15_p	= S2_R15_r;
	S2_I15_p	= S2_I15_r;

	S3_R0_p		= S3_R0_r;
	S3_I0_p	    = S3_I0_r;
	S3_R1_p		= S3_R1_r;
	S3_I1_p	    = S3_I1_r;
	S3_R2_p		= S3_R2_r;
	S3_I2_p	    = S3_I2_r;
	S3_R3_p		= S3_R3_r;
	S3_I3_p	    = S3_I3_r;
	S3_R4_p		= S3_R4_r;
	S3_I4_p	    = S3_I4_r;
	S3_R5_p		= S3_R5_r;
	S3_I5_p	    = S3_I5_r;
	S3_R6_p		= S3_R6_r;
	S3_I6_p	    = S3_I6_r;
	S3_R7_p		= S3_R7_r;
	S3_I7_p	    = S3_I7_r;
	S3_R8_p		= S3_R8_r;
	S3_I8_p	    = S3_I8_r;
	S3_R9_p		= S3_R9_r;
	S3_I9_p	    = S3_I9_r;
	S3_R10_p	= S3_R10_r;
	S3_I10_p	= S3_I10_r;
	S3_R11_p	= S3_R11_r;
	S3_I11_p	= S3_I11_r;
	S3_R12_p	= S3_R12_r;
	S3_I12_p	= S3_I12_r;
	S3_R13_p	= S3_R13_r;
	S3_I13_p	= S3_I13_r;
	S3_R14_p	= S3_R14_r;
	S3_I14_p	= S3_I14_r;
	S3_R15_p	= S3_R15_r;
	S3_I15_p	= S3_I15_r;


	X_0_R_p     = X_0_R_r;
	X_0_I_p  	= X_0_I_r;
	X_1_R_p     = X_1_R_r;
	X_1_I_p  	= X_1_I_r;
	X_2_R_p     = X_2_R_r;
	X_2_I_p  	= X_2_I_r;
	X_3_R_p     = X_3_R_r;
	X_3_I_p  	= X_3_I_r;
	X_4_R_p     = X_4_R_r;
	X_4_I_p  	= X_4_I_r;
	X_5_R_p     = X_5_R_r;
	X_5_I_p  	= X_5_I_r;
	X_6_R_p     = X_6_R_r;
	X_6_I_p  	= X_6_I_r;
	X_7_R_p     = X_7_R_r;
	X_7_I_p  	= X_7_I_r;
	X_8_R_p     = X_8_R_r;
	X_8_I_p  	= X_8_I_r;
	X_9_R_p     = X_9_R_r;
	X_9_I_p  	= X_9_I_r;
	X_10_R_p    = X_10_R_r;
	X_10_I_p  	= X_10_I_r;
	X_11_R_p    = X_11_R_r;
	X_11_I_p  	= X_11_I_r;
	X_12_R_p    = X_12_R_r;
	X_12_I_p  	= X_12_I_r;
	X_13_R_p    = X_13_R_r;
	X_13_I_p  	= X_13_I_r;
	X_14_R_p    = X_14_R_r;
	X_14_I_p  	= X_14_I_r;
	X_15_R_p    = X_15_R_r;
	X_15_I_p  	= X_15_I_r;



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
	T_R6_p  	= T_R6_r;
	T_I6_p  	= T_I6_r;
	T_R7_p  	= T_R7_r;
	T_I7_p  	= T_I7_r;
	T_R8_p  	= T_R8_r;
	T_I8_p  	= T_I8_r;
	T_R9_p  	= T_R9_r;
	T_I9_p  	= T_I9_r;
	T_R10_p  	= T_R10_r;
	T_I10_p  	= T_I10_r;
	T_R11_p  	= T_R11_r;
	T_I11_p  	= T_I11_r;
	T_R12_p  	= T_R12_r;
	T_I12_p  	= T_I12_r;
	T_R13_p  	= T_R13_r;
	T_I13_p  	= T_I13_r;
	T_R14_p  	= T_R14_r;
	T_I14_p  	= T_I14_r;
	T_R15_p  	= T_R15_r;
	T_I15_p  	= T_I15_r;
	T_R16_p  	= T_R16_r;
	T_I16_p  	= T_I16_r;
	T_R17_p  	= T_R17_r;
	T_I17_p  	= T_I17_r;



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
		x_8_R_p   	= x8_R;
		x_8_I_p   	= x8_I;
		x_9_R_p   	= x9_R;
		x_9_I_p   	= x9_I;
		x_10_R_p   	= x10_R;
		x_10_I_p   	= x10_I;
		x_11_R_p   	= x11_R;
		x_11_I_p   	= x11_I;
		x_12_R_p   	= x12_R;
		x_12_I_p   	= x12_I;
		x_13_R_p   	= x13_R;
		x_13_I_p   	= x13_I;
		x_14_R_p   	= x14_R;
		x_14_I_p   	= x14_I;
		x_15_R_p   	= x15_R;
		x_15_I_p   	= x15_I;

	end


	/* Write Back Logic */

	// Stage 1 
	if(wr_enable_i[`WBF_16_S1_R0]) begin
		S1_R0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I0]) begin
		S1_I0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R1]) begin
		S1_R1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I1]) begin
		S1_I1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R2]) begin
		S1_R2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I2]) begin
		S1_I2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R3]) begin
		S1_R3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I3]) begin
		S1_I3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R4]) begin
		S1_R4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I4]) begin
		S1_I4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R5]) begin
		S1_R5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I5]) begin
		S1_I5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R6]) begin
		S1_R6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I6]) begin
		S1_I6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R7]) begin
		S1_R7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I7]) begin
		S1_I7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R8]) begin
		S1_R8_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I8]) begin
		S1_I8_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R9]) begin
		S1_R9_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I9]) begin
		S1_I9_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R10]) begin
		S1_R10_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I10]) begin
		S1_I10_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R11]) begin
		S1_R11_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I11]) begin
		S1_I11_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R12]) begin
		S1_R12_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I12]) begin
		S1_I12_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R13]) begin
		S1_R13_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I13]) begin
		S1_I13_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R14]) begin
		S1_R14_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I14]) begin
		S1_I14_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_R15]) begin
		S1_R15_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S1_I15]) begin
		S1_I15_p 		         = wbb;
	end


	
	// Stage 2 
	if(wr_enable_i[`WBF_16_S2_R0]) begin
		S2_R0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I0]) begin
		S2_I0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R1]) begin
		S2_R1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I1]) begin
		S2_I1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R2]) begin
		S2_R2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I2]) begin
		S2_I2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R3]) begin
		S2_R3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I3]) begin
		S2_I3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R4]) begin
		S2_R4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I4]) begin
		S2_I4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R5]) begin
		S2_R5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I5]) begin
		S2_I5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R6]) begin
		S2_R6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I6]) begin
		S2_I6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R7]) begin
		S2_R7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I7]) begin
		S2_I7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R8]) begin
		S2_R8_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I8]) begin
		S2_I8_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R9]) begin
		S2_R9_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I9]) begin
		S2_I9_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R10]) begin
		S2_R10_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I10]) begin
		S2_I10_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R11]) begin
		S2_R11_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I11]) begin
		S2_I11_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R12]) begin
		S2_R12_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I12]) begin
		S2_I12_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R13]) begin
		S2_R13_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I13]) begin
		S2_I13_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R14]) begin
		S2_R14_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I14]) begin
		S2_I14_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_R15]) begin
		S2_R15_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S2_I15]) begin
		S2_I15_p 		         = wbb;
	end


	// Stage 3
	if(wr_enable_i[`WBF_16_S3_R0]) begin
		S3_R0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I0]) begin
		S3_I0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R1]) begin
		S3_R1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I1]) begin
		S3_I1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R2]) begin
		S3_R2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I2]) begin
		S3_I2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R3]) begin
		S3_R3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I3]) begin
		S3_I3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R4]) begin
		S3_R4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I4]) begin
		S3_I4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R5]) begin
		S3_R5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I5]) begin
		S3_I5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R6]) begin
		S3_R6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I6]) begin
		S3_I6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R7]) begin
		S3_R7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I7]) begin
		S3_I7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R8]) begin
		S3_R8_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I8]) begin
		S3_I8_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R9]) begin
		S3_R9_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I9]) begin
		S3_I9_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R10]) begin
		S3_R10_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I10]) begin
		S3_I10_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R11]) begin
		S3_R11_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I11]) begin
		S3_I11_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R12]) begin
		S3_R12_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I12]) begin
		S3_I12_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R13]) begin
		S3_R13_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I13]) begin
		S3_I13_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R14]) begin
		S3_R14_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I14]) begin
		S3_I14_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_R15]) begin
		S3_R15_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_S3_I15]) begin
		S3_I15_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_T_R0]) begin
		T_R0_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I0]) begin
		T_I0_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R1]) begin
		T_R1_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I1]) begin
		T_I1_p 				    = -(wbb[23:8]); 
	end
	if(wr_enable_i[`WBF_16_T2_R1]) begin
		T_R1_p 		         	= -(wbb[23:8]);
	end
	if(wr_enable_i[`WBF_16_T2_I1]) begin
		T_I1_p 				    = wbb[23:8]; 
	end
	if(wr_enable_i[`WBF_16_T_R2]) begin
		T_R2_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_16_T_I2]) begin
		T_I2_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_16_T_R3]) begin
		T_R3_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I3]) begin
		T_I3_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R4]) begin
		T_R4_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I4]) begin
		T_I4_p 		         	= -(wbb[23:8]);
	end
	if(wr_enable_i[`WBF_16_T_R5]) begin
		T_R5_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_16_T_I5]) begin
		T_I5_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_16_T_R6]) begin
		T_R6_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I6]) begin
		T_I6_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R7]) begin
		T_R7_p 		         	= -(wbb[23:8]);
	end
	if(wr_enable_i[`WBF_16_T_I7]) begin
		T_I7_p 				    = wbb[23:8]; 
	end
	if(wr_enable_i[`WBF_16_T_R8]) begin
		T_R8_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_16_T_I8]) begin
		T_I8_p 		         	= wbb;
	end
	if(wr_enable_i[`WBF_16_T_R9]) begin
		T_R9_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I9]) begin
		T_I9_p 		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R10]) begin
		T_R10_p 		        = -wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I10]) begin
		T_I10_p 		        = wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R11]) begin
		T_R11_p 		        = wbb;
	end
	if(wr_enable_i[`WBF_16_T_I11]) begin
		T_I11_p 		        = wbb;
	end
	if(wr_enable_i[`WBF_16_T_R12]) begin
		T_R12_p		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I12]) begin
		T_I12_p		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R13]) begin
		T_R13_p 		        = -wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I13]) begin
		T_I13_p 		        = wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R14]) begin
		T_R14_p 		        = wbb;
	end
	if(wr_enable_i[`WBF_16_T_I14]) begin
		T_I14_p 		        = wbb;
	end
	if(wr_enable_i[`WBF_16_T_R15]) begin
		T_R15_p		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I15]) begin
		T_I15_p		         	= wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R16]) begin
		T_R16_p 		        = -wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_I16]) begin
		T_I16_p 		        = wbb[23:8];
	end
	if(wr_enable_i[`WBF_16_T_R17]) begin
		T_R17_p 		        = wbb;
	end
	if(wr_enable_i[`WBF_16_T_I17]) begin
		T_I17_p 		        = wbb;
	end


	// Stage 4
	if(wr_enable_i[`WBF_16_X_R0]) begin
		X_0_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I0]) begin
		X_0_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R1]) begin
		X_1_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I1]) begin
		X_1_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R2]) begin
		X_2_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I2]) begin
		X_2_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R3]) begin
		X_3_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I3]) begin
		X_3_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R4]) begin
		X_4_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I4]) begin
		X_4_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R5]) begin
		X_5_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I5]) begin
		X_5_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R6]) begin
		X_6_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I6]) begin
		X_6_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R7]) begin
		X_7_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I7]) begin
		X_7_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R8]) begin
		X_8_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I8]) begin
		X_8_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R9]) begin
		X_9_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I9]) begin
		X_9_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R10]) begin
		X_10_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I10]) begin
		X_10_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R11]) begin
		X_11_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I11]) begin
		X_11_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R12]) begin
		X_12_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I12]) begin
		X_12_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R13]) begin
		X_13_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I13]) begin
		X_13_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R14]) begin
		X_14_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I14]) begin
		X_14_I_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_R15]) begin
		X_15_R_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_16_X_I15]) begin
		X_15_I_p 		         = wbb;
	end

	
	
	// ALU Register OP_A 

	

	if(alu_reg_i[`ALUREG_16_X_R0_TO_OP_A]) begin
		alu_op_a = x_0_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R4_TO_OP_A]) begin
		alu_op_a = x_4_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R2_TO_OP_A]) begin
		alu_op_a = x_2_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R6_TO_OP_A]) begin
		alu_op_a = x_6_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R1_TO_OP_A]) begin
		alu_op_a = x_1_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R5_TO_OP_A]) begin
		alu_op_a = x_5_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R3_TO_OP_A]) begin
		alu_op_a = x_3_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R7_TO_OP_A]) begin
		alu_op_a = x_7_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I0_TO_OP_A]) begin
		alu_op_a = x_0_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I4_TO_OP_A]) begin
		alu_op_a = x_4_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I2_TO_OP_A]) begin
		alu_op_a = x_2_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I6_TO_OP_A]) begin
		alu_op_a = x_6_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I1_TO_OP_A]) begin
		alu_op_a = x_1_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I5_TO_OP_A]) begin
		alu_op_a = x_5_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I3_TO_OP_A]) begin
		alu_op_a = x_3_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I7_TO_OP_A]) begin
		alu_op_a = x_7_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R0_TO_OP_A]) begin
		alu_op_a = S1_R0_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I0_TO_OP_A]) begin
		alu_op_a = S1_I0_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R1_TO_OP_A]) begin
		alu_op_a = S1_R1_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I1_TO_OP_A]) begin
		alu_op_a = S1_I1_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R4_TO_OP_A]) begin
		alu_op_a = S1_R4_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I4_TO_OP_A]) begin
		alu_op_a = S1_I4_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R5_TO_OP_A]) begin
		alu_op_a = S1_R5_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I5_TO_OP_A]) begin
		alu_op_a = S1_I5_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R8_TO_OP_A]) begin
		alu_op_a = S1_R8_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I8_TO_OP_A]) begin
		alu_op_a = S1_I8_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R9_TO_OP_A]) begin
		alu_op_a = S1_R9_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I9_TO_OP_A]) begin
		alu_op_a = S1_I9_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R12_TO_OP_A]) begin
		alu_op_a = S1_R12_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I12_TO_OP_A]) begin
		alu_op_a = S1_I12_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R13_TO_OP_A]) begin
		alu_op_a = S1_R13_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I13_TO_OP_A]) begin
		alu_op_a = S1_I13_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R0_TO_OP_A]) begin
		alu_op_a = S2_R0_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I0_TO_OP_A]) begin
		alu_op_a = S2_I0_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R1_TO_OP_A]) begin
		alu_op_a = S2_R1_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I1_TO_OP_A]) begin
		alu_op_a = S2_I1_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R2_TO_OP_A]) begin
		alu_op_a = S2_R2_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I2_TO_OP_A]) begin
		alu_op_a = S2_I2_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R3_TO_OP_A]) begin
		alu_op_a = S2_R3_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I3_TO_OP_A]) begin
		alu_op_a = S2_I3_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R8_TO_OP_A]) begin
		alu_op_a = S2_R8_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I8_TO_OP_A]) begin
		alu_op_a = S2_I8_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R9_TO_OP_A]) begin
		alu_op_a = S2_R9_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I9_TO_OP_A]) begin
		alu_op_a = S2_I9_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R10_TO_OP_A]) begin
		alu_op_a = S2_R10_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I10_TO_OP_A]) begin
		alu_op_a = S2_I10_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R11_TO_OP_A]) begin
		alu_op_a = S2_R11_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I11_TO_OP_A]) begin
		alu_op_a = S2_I11_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R0_TO_OP_A]) begin
		alu_op_a = S3_R0_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I0_TO_OP_A]) begin
		alu_op_a = S3_I0_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R1_TO_OP_A]) begin
		alu_op_a = S3_R1_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I1_TO_OP_A]) begin
		alu_op_a = S3_I1_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R2_TO_OP_A]) begin
		alu_op_a = S3_R2_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I2_TO_OP_A]) begin
		alu_op_a = S3_I2_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R3_TO_OP_A]) begin
		alu_op_a = S3_R3_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I3_TO_OP_A]) begin
		alu_op_a = S3_I3_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R4_TO_OP_A]) begin
		alu_op_a = S3_R4_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I4_TO_OP_A]) begin
		alu_op_a = S3_I4_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R5_TO_OP_A]) begin
		alu_op_a = S3_R5_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I5_TO_OP_A]) begin
		alu_op_a = S3_I5_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R6_TO_OP_A]) begin
		alu_op_a = S3_R6_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I6_TO_OP_A]) begin
		alu_op_a = S3_I6_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R7_TO_OP_A]) begin
		alu_op_a = S3_R7_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I7_TO_OP_A]) begin
		alu_op_a = S3_I7_p;
	end
	else if(alu_reg_i[`ALUREG_W_16_1_REEL_TO_OP_A]) begin
		alu_op_a = `W_16_1_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_16_1_IMAG_TO_OP_A]) begin
		alu_op_a = `W_16_1_IMAG;
	end
	else if(alu_reg_i[`ALUREG_W_16_2_REEL_TO_OP_A]) begin
		alu_op_a = `W_16_2_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_16_2_IMAG_TO_OP_A]) begin
		alu_op_a = `W_16_2_IMAG;
	end
	else if(alu_reg_i[`ALUREG_W_16_3_REEL_TO_OP_A]) begin
		alu_op_a = `W_16_3_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_16_3_IMAG_TO_OP_A]) begin
		alu_op_a = `W_16_3_IMAG;
	end
	else if(alu_reg_i[`ALUREG_W_16_5_REEL_TO_OP_A]) begin
		alu_op_a = `W_16_5_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_16_5_IMAG_TO_OP_A]) begin
		alu_op_a = `W_16_5_IMAG;
	end
	else if(alu_reg_i[`ALUREG_W_16_6_REEL_TO_OP_A]) begin
		alu_op_a = `W_16_6_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_16_6_IMAG_TO_OP_A]) begin
		alu_op_a = `W_16_6_IMAG;
	end
	else if(alu_reg_i[`ALUREG_W_16_7_REEL_TO_OP_A]) begin
		alu_op_a = `W_16_7_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_16_7_IMAG_TO_OP_A]) begin
		alu_op_a = `W_16_7_IMAG;
	end
	else if(alu_reg_i[`ALUREG_16_T_R0_TO_OP_A]) begin
		alu_op_a = T_R0_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I0_TO_OP_A]) begin
		alu_op_a = T_I0_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R3_TO_OP_A]) begin
		alu_op_a = T_R3_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I3_TO_OP_A]) begin
		alu_op_a = T_I3_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R6_TO_OP_A]) begin
		alu_op_a = T_R6_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I6_TO_OP_A]) begin
		alu_op_a = T_I6_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R9_TO_OP_A]) begin
		alu_op_a = T_R9_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I9_TO_OP_A]) begin
		alu_op_a = T_I9_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R12_TO_OP_A]) begin
		alu_op_a = T_R12_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I12_TO_OP_A]) begin
		alu_op_a = T_I12_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R15_TO_OP_A]) begin
		alu_op_a = T_R15_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I15_TO_OP_A]) begin
		alu_op_a = T_I15_p;
	end


	// ALU Register OP_B 


	if(alu_reg_i[`ALUREG_16_X_R8_TO_OP_B]) begin
		alu_op_b = x_8_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R12_TO_OP_B]) begin
		alu_op_b = x_12_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R10_TO_OP_B]) begin
		alu_op_b = x_10_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R14_TO_OP_B]) begin
		alu_op_b = x_14_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R9_TO_OP_B]) begin
		alu_op_b = x_9_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R13_TO_OP_B]) begin
		alu_op_b = x_13_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R11_TO_OP_B]) begin
		alu_op_b = x_11_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_R15_TO_OP_B]) begin
		alu_op_b = x_15_R_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I8_TO_OP_B]) begin
		alu_op_b = x_8_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I12_TO_OP_B]) begin
		alu_op_b = x_12_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I10_TO_OP_B]) begin
		alu_op_b = x_10_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I14_TO_OP_B]) begin
		alu_op_b = x_14_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I9_TO_OP_B]) begin
		alu_op_b = x_9_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I13_TO_OP_B]) begin
		alu_op_b = x_13_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I11_TO_OP_B]) begin
		alu_op_b = x_11_I_p;
	end
	else if(alu_reg_i[`ALUREG_16_X_I15_TO_OP_B]) begin
		alu_op_b = x_15_I_p;
	end	
	else if(alu_reg_i[`ALUREG_16_S1_R2_TO_OP_B]) begin
		alu_op_b = S1_R2_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I2_TO_OP_B]) begin
		alu_op_b = S1_I2_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R3_TO_OP_B]) begin
		alu_op_b = S1_R3_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I3_TO_OP_B]) begin
		alu_op_b = -S1_I3_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R6_TO_OP_B]) begin
		alu_op_b = S1_R6_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I6_TO_OP_B]) begin
		alu_op_b = S1_I6_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R7_TO_OP_B]) begin
		alu_op_b = S1_R7_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I7_TO_OP_B]) begin
		alu_op_b = -S1_I7_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R10_TO_OP_B]) begin
		alu_op_b = S1_R10_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I10_TO_OP_B]) begin
		alu_op_b = S1_I10_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R11_TO_OP_B]) begin
		alu_op_b = S1_R11_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I11_TO_OP_B]) begin
		alu_op_b = -S1_I11_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R14_TO_OP_B]) begin
		alu_op_b = S1_R14_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I14_TO_OP_B]) begin
		alu_op_b = S1_I14_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_R15_TO_OP_B]) begin
		alu_op_b = S1_R15_p;
	end
	else if(alu_reg_i[`ALUREG_16_S1_I15_TO_OP_B]) begin
		alu_op_b = -S1_I15_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R4_TO_OP_B]) begin
		alu_op_b = S2_R4_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I4_TO_OP_B]) begin
		alu_op_b = S2_I4_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R5_TO_OP_B]) begin
		alu_op_b = S2_R5_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I5_TO_OP_B]) begin
		alu_op_b = S2_I5_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R6_TO_OP_B]) begin
		alu_op_b = S2_R6_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I6_TO_OP_B]) begin
		alu_op_b = -S2_I6_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R7_TO_OP_B]) begin
		alu_op_b = S2_R7_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I7_TO_OP_B]) begin
		alu_op_b = S2_I7_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R12_TO_OP_B]) begin
		alu_op_b = S2_R12_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I12_TO_OP_B]) begin
		alu_op_b = S2_I12_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R13_TO_OP_B]) begin
		alu_op_b = S2_R13_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I13_TO_OP_B]) begin
		alu_op_b = S2_I13_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R14_TO_OP_B]) begin
		alu_op_b = S2_R14_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I14_TO_OP_B]) begin
		alu_op_b = -S2_I14_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_R15_TO_OP_B]) begin
		alu_op_b = S2_R15_p;
	end
	else if(alu_reg_i[`ALUREG_16_S2_I15_TO_OP_B]) begin
		alu_op_b = S2_I15_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R8_TO_OP_B]) begin
		alu_op_b = S3_R8_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I8_TO_OP_B]) begin
		alu_op_b = S3_I8_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R9_TO_OP_B]) begin
		alu_op_b = S3_R9_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I9_TO_OP_B]) begin
		alu_op_b = S3_I9_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R10_TO_OP_B]) begin
		alu_op_b = S3_R10_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I10_TO_OP_B]) begin
		alu_op_b = S3_I10_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R11_TO_OP_B]) begin
		alu_op_b = S3_R11_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I11_TO_OP_B]) begin
		alu_op_b = S3_I11_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R12_TO_OP_B]) begin
		alu_op_b = S3_R12_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I12_TO_OP_B]) begin
		alu_op_b = -S3_I12_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R13_TO_OP_B]) begin
		alu_op_b = S3_R13_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I13_TO_OP_B]) begin
		alu_op_b = S3_I13_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R14_TO_OP_B]) begin
		alu_op_b = S3_R14_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I14_TO_OP_B]) begin
		alu_op_b = S3_I14_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_R15_TO_OP_B]) begin
		alu_op_b = S3_R15_p;
	end
	else if(alu_reg_i[`ALUREG_16_S3_I15_TO_OP_B]) begin
		alu_op_b = S3_I15_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R1_TO_OP_B]) begin
		alu_op_b = T_R1_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I1_TO_OP_B]) begin
		alu_op_b = T_I1_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R2_TO_OP_B]) begin
		alu_op_b = T_R2_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I2_TO_OP_B]) begin
		alu_op_b = T_I2_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R4_TO_OP_B]) begin
		alu_op_b = T_R4_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I4_TO_OP_B]) begin
		alu_op_b = T_I4_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R5_TO_OP_B]) begin
		alu_op_b = T_R5_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I5_TO_OP_B]) begin
		alu_op_b = T_I5_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R7_TO_OP_B]) begin
		alu_op_b = T_R7_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I7_TO_OP_B]) begin
		alu_op_b = T_I7_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R8_TO_OP_B]) begin
		alu_op_b = T_R8_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I8_TO_OP_B]) begin
		alu_op_b = T_I8_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R10_TO_OP_B]) begin
		alu_op_b = T_R10_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I10_TO_OP_B]) begin
		alu_op_b = T_I10_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R11_TO_OP_B]) begin
		alu_op_b = T_R11_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I11_TO_OP_B]) begin
		alu_op_b = T_I11_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R13_TO_OP_B]) begin
		alu_op_b = T_R13_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I13_TO_OP_B]) begin
		alu_op_b = T_I13_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R14_TO_OP_B]) begin
		alu_op_b = T_R14_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I14_TO_OP_B]) begin
		alu_op_b = T_I14_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R16_TO_OP_B]) begin
		alu_op_b = T_R16_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I16_TO_OP_B]) begin
		alu_op_b = T_I16_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_R17_TO_OP_B]) begin
		alu_op_b = T_R17_p;
	end
	else if(alu_reg_i[`ALUREG_16_T_I17_TO_OP_B]) begin
		alu_op_b = T_I17_p;
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
assign X_8_R_o = X_8_R_r;
assign X_8_I_o = X_8_I_r;
assign X_9_R_o = X_9_R_r;
assign X_9_I_o = X_9_I_r;
assign X_10_R_o = X_10_R_r;
assign X_10_I_o = X_10_I_r;
assign X_11_R_o = X_11_R_r;
assign X_11_I_o = X_11_I_r;
assign X_12_R_o = X_12_R_r;
assign X_12_I_o = X_12_I_r;
assign X_13_R_o = X_13_R_r;
assign X_13_I_o = X_13_I_r;
assign X_14_R_o = X_14_R_r;
assign X_14_I_o = X_14_I_r;
assign X_15_R_o = X_15_R_r;
assign X_15_I_o = X_15_I_r;


endmodule