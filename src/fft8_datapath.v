
`include "constants.vh"

module fft8_datapath(

						 	input clk,
							input rst,
							input start_i,

							input [15:0] x_0_i,
							input [15:0] x_1_i,
							input [15:0] x_2_i,
							input [15:0] x_3_i,
							input [15:0] x_4_i,
							input [15:0] x_5_i,
							input [15:0] x_6_i,
							input [15:0] x_7_i,

							input [7:0] check_i,
							input [47:0] alu_reg_i,
							input [7:0] alu_mode_i,
							input [25:0] wr_enable_i,

							output valid_o,
							output [5:0]  valid_states_o,
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






reg [15:0] X_0_R_r, X_0_I_r,
		   X_1_R_r, X_1_I_r,
		   X_2_R_r, X_2_I_r,
		   X_3_R_r, X_3_I_r,
		   X_4_R_r, X_4_I_r,
		   X_5_R_r, X_5_I_r,
		   X_6_R_r, X_6_I_r,
		   X_7_R_r, X_7_I_r;


reg [15:0] S1_0_r, S1_0_p,
		   S1_1_r, S1_1_p,
		   S1_2_r, S1_2_p,
		   S1_3_r, S1_3_p,
		   S1_4_r, S1_4_p,
		   S1_5_r, S1_5_p,
		   S1_6_r, S1_6_p,
		   S1_7_r, S1_7_p,

		   S2_0_r  , S2_0_p,
		   S2_1_R_r, S2_1_R_p,
		   S2_1_I_r, S2_1_I_p,
		   S2_2_r  , S2_2_p,
		   S2_3_R_r, S2_3_R_p,
		   S2_3_I_r, S2_3_I_p,
		   S2_4_r  , S2_4_p,
		   S2_5_R_r, S2_5_R_p,
		   S2_5_I_r, S2_5_I_p,
		   S2_6_r  , S2_6_p,
		   S2_7_R_r, S2_7_R_p,
		   S2_7_I_r, S2_7_I_p;


reg [15:0] x_0_r,  x_0_p,
		   x_1_r,  x_1_p,
		   x_2_r,  x_2_p,
		   x_3_r,  x_3_p,
		   x_4_r,  x_4_p,
		   x_5_r,  x_5_p,
		   x_6_r,  x_6_p,
		   x_7_r,  x_7_p;

reg [15:0] x0,
		   x1,
		   x2,
		   x3,
		   x4,
		   x5,
		   x6,
		   x7;		   


/* Alu operands  */
reg  signed [15:0]  alu_op_a, alu_op_b, alu_op_c;
wire signed [15:0]  wbb, alu_res;


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

		S1_0_r 			<= 16'd0;
		S1_1_r 			<= 16'd0;
		S1_2_r 			<= 16'd0;
		S1_3_r 			<= 16'd0;
		S1_4_r 			<= 16'd0;
		S1_5_r 			<= 16'd0;
		S1_6_r 			<= 16'd0;
		S1_7_r 			<= 16'd0;
		S1_0_p 			<= 16'd0;
		S1_1_p 			<= 16'd0;
		S1_2_p 			<= 16'd0;
		S1_3_p 			<= 16'd0;
		S1_4_p 			<= 16'd0;
		S1_5_p			<= 16'd0;
		S1_6_p 			<= 16'd0;
		S1_7_p 			<= 16'd0;

		S2_0_r			<= 16'd0;
		S2_1_R_r		<= 16'd0;
		S2_1_I_r		<= 16'd0;
		S2_2_r 			<= 16'd0;
		S2_3_R_r 		<= 16'd0;
		S2_3_I_r 		<= 16'd0;
		S2_4_r 			<= 16'd0;
		S2_5_R_r 		<= 16'd0;
		S2_5_I_r 		<= 16'd0;
		S2_6_r  		<= 16'd0;
		S2_7_R_r 		<= 16'd0;
		S2_7_I_r 		<= 16'd0;
		S2_0_p			<= 16'd0;
		S2_1_R_p		<= 16'd0;
		S2_1_I_p		<= 16'd0;
		S2_2_p 			<= 16'd0;
		S2_3_R_p 		<= 16'd0;
		S2_3_I_p 		<= 16'd0;
		S2_4_p 			<= 16'd0;
		S2_5_R_p 		<= 16'd0;
		S2_5_I_p 		<= 16'd0;
		S2_6_p  		<= 16'd0;
		S2_7_R_p 		<= 16'd0;
		S2_7_I_p 		<= 16'd0;

		x_0_r 			<= 16'd0;
		x_1_r 			<= 16'd0;
		x_2_r 			<= 16'd0;
		x_3_r 			<= 16'd0;
		x_4_r 			<= 16'd0;
		x_5_r 			<= 16'd0;
		x_6_r 			<= 16'd0;
		x_7_r 			<= 16'd0;
		x_0_p 			<= 16'd0;
		x_1_p 			<= 16'd0;
		x_2_p 			<= 16'd0;
		x_3_p 			<= 16'd0;
		x_4_p 			<= 16'd0;
		x_5_p 			<= 16'd0;
		x_6_p 			<= 16'd0;
		x_7_p 			<= 16'd0;


		start_r			<= 0;



	end
	else begin


		/* inputs */
		x0 				<= x_0_i;
		x1 				<= x_1_i;
		x2 				<= x_2_i;
		x3 				<= x_3_i;
		x4 				<= x_4_i;
		x5 				<= x_5_i;
		x6 				<= x_6_i;
		x7 				<= x_7_i;

		/* persistent data */


		x_0_r 			<= x_0_p;
		x_1_r 			<= x_1_p;
		x_2_r 			<= x_2_p;
		x_3_r 			<= x_3_p;
		x_4_r 			<= x_4_p;
		x_5_r 			<= x_5_p;
		x_6_r 			<= x_6_p;
		x_7_r 			<= x_7_p;

		S1_0_r 			<= S1_0_p;
		S1_1_r 			<= S1_1_p;
		S1_2_r 			<= S1_2_p;
		S1_3_r 			<= S1_3_p;
		S1_4_r 			<= S1_4_p;
		S1_5_r 			<= S1_5_p;
		S1_6_r 			<= S1_6_p;
		S1_7_r 			<= S1_7_p;

		S2_0_r			<= S2_0_p;
		S2_1_R_r		<= S2_1_R_p;
		S2_1_I_r		<= S2_1_I_p;
		S2_2_r 			<= S2_2_p;
		S2_3_R_r 		<= S2_3_R_p;
		S2_3_I_r 		<= S2_3_I_p;
		S2_4_r 			<= S2_4_p;
		S2_5_R_r 		<= S2_5_R_p;
		S2_5_I_r 		<= S2_5_I_p;
		S2_6_r  		<= S2_6_p;
		S2_7_R_r 		<= S2_7_R_p;
		S2_7_I_r 		<= S2_7_I_p;

		/* ALU */
		alu_op_c 		<= alu_res;
		start_r         <= start_i;
		
		
	end
end


always @(*) begin
	
	alu_op_a    = 0;
	alu_op_b    = 0;
	x_0_p 	    = x_0_r;
	x_1_p 	    = x_1_r;
	x_2_p 	    = x_2_r;
	x_3_p 	    = x_3_r;
	x_4_p 	    = x_4_r;
	x_5_p 	    = x_5_r;
	x_6_p 	    = x_6_r;
	x_7_p 	    = x_7_r;

	S1_0_p		= S1_0_r;
	S1_1_p		= S1_1_r;
	S1_2_p		= S1_2_r;
	S1_3_p 		= S1_3_r;
	S1_4_p 		= S1_4_r;
	S1_5_p 		= S1_5_r;
	S1_6_p 		= S1_6_r;
	S1_7_p 		= S1_7_r;

	S2_0_p 		= S2_0_r;
	S2_1_R_p	= S2_1_R_r;
	S2_1_I_p 	= S2_1_I_r;
	S2_2_p 		= S2_2_r;
	S2_3_R_p 	= S2_3_R_r;
	S2_3_I_p 	= S2_3_I_r;
	S2_4_p 		= S2_4_r;
	S2_5_R_p 	= S2_5_R_r;
	S2_5_I_p 	= S2_5_I_r;
	S2_6_p 		= S2_6_r;
	S2_7_R_p 	= S2_7_R_r;
	S2_7_I_p 	= S2_7_I_r;




	if(start_r) begin
		

		x_0_p   	= x0;
		x_1_p   	= x1;
		x_2_p   	= x2;
		x_3_p   	= x3;
		x_4_p   	= x4;
		x_5_p   	= x5;
		x_6_p   	= x6;
		x_7_p   	= x7;

		S1_0_p		= 16'd0;
		S1_1_p		= 16'd0;
		S1_2_p		= 16'd0;
		S1_3_p		= 16'd0;
		S1_4_p		= 16'd0;
		S1_5_p		= 16'd0;
		S1_6_p		= 16'd0;
		S1_7_p		= 16'd0;

		S2_0_p 		= 16'd0;
		S2_1_R_p	= 16'd0;
		S2_1_I_p 	= 16'd0;
		S2_2_p 		= 16'd0;
		S2_3_R_p 	= 16'd0;
		S2_3_I_p 	= 16'd0;
		S2_4_p 		= 16'd0;
		S2_5_R_p 	= 16'd0;
		S2_5_I_p 	= 16'd0;
		S2_6_p 		= 16'd0;
		S2_7_R_p 	= 16'd0;
		S2_7_I_p 	= 16'd0;		

	end


	/* Write Back Logic */


	if(wr_enable_i[`WBF_S1_0]) begin
		S1_0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S1_1]) begin
		S1_1_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S1_2]) begin
		S1_2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S1_3]) begin
		S1_3_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S1_4]) begin
		S1_4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S1_5]) begin
		S1_5_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S1_6]) begin
		S1_6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S1_7]) begin
		S1_7_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S2_0]) begin
		S2_0_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S2_1_REEL]) begin
		S2_1_R_p 		     = S1_1_r;
	end
	if(wr_enable_i[`WBF_S2_1_IMAG]) begin
		S2_1_I_p             = -S1_3_r;
	end
	if(wr_enable_i[`WBF_S2_2]) begin
		S2_2_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S2_3_REEL]) begin
		S2_3_R_p 		     = S1_1_r;
	end
	if(wr_enable_i[`WBF_S2_3_IMAG]) begin
		S2_3_I_p	         = S1_3_r;
	end
	if(wr_enable_i[`WBF_S2_4]) begin
		S2_4_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S2_5_REEL]) begin
		S2_5_R_p 		     = S1_5_r;
	end
	if(wr_enable_i[`WBF_S2_5_IMAG]) begin
		S2_5_I_p	         = -S1_7_r;
	end
	if(wr_enable_i[`WBF_S2_6]) begin
		S2_6_p 		         = wbb;
	end
	if(wr_enable_i[`WBF_S2_7_REEL]) begin
		S2_7_R_p 		     = S1_5_r;
	end
	if(wr_enable_i[`WBF_S2_7_IMAG]) begin
		S2_7_I_p	         = S1_7_r;
	end






	/* ALU Register OP_A */

	if(alu_reg_i[`ALUREG_X_0_TO_OP_A]) begin
		alu_op_a = x_0_p;
	end
	else if(alu_reg_i[`ALUREG_X_1_TO_OP_A]) begin
		alu_op_a = x_1_p;
	end
	else if(alu_reg_i[`ALUREG_X_2_TO_OP_A]) begin
		alu_op_a = x_2_p;
	end
	else if(alu_reg_i[`ALUREG_X_3_TO_OP_A]) begin
		alu_op_a = x_3_p;
	end
	else if(alu_reg_i[`ALUREG_S1_0_TO_OP_A]) begin
		alu_op_a = S1_0_p;
	end
	else if(alu_reg_i[`ALUREG_S1_1_TO_OP_A]) begin
		alu_op_a = S1_1_p;
	end
	else if(alu_reg_i[`ALUREG_S1_4_TO_OP_A]) begin
		alu_op_a = S1_4_p;
	end
	else if(alu_reg_i[`ALUREG_S1_5_TO_OP_A]) begin
		alu_op_a = S1_5_p;
	end


	/* ALU Register OP_B */

	if(alu_reg_i[`ALUREG_X_4_TO_OP_B]) begin
		alu_op_b = x_4_p;
	end
	else if(alu_reg_i[`ALUREG_X_5_TO_OP_B]) begin
		alu_op_b = x_5_p;
	end
	else if(alu_reg_i[`ALUREG_X_6_TO_OP_B]) begin
		alu_op_b = x_6_p;
	end
	else if(alu_reg_i[`ALUREG_X_7_TO_OP_B]) begin
		alu_op_b = x_7_p;
	end
	if(alu_reg_i[`ALUREG_S1_2_TO_OP_B]) begin
		alu_op_b = S1_2_p;
	end
	else if(alu_reg_i[`ALUREG_S1_3_TO_OP_B]) begin
		alu_op_b = S1_3_p;
	end
	else if(alu_reg_i[`ALUREG_S1_6_TO_OP_B]) begin
		alu_op_b = S1_6_p;
	end
	else if(alu_reg_i[`ALUREG_S1_7_TO_OP_B]) begin
		alu_op_b = S1_7_p;
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