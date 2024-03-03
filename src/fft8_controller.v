
`include "constants.vh"

module fft8_controller(

						 	input clk,
							input rst,
							input start_i,
							input valid_i,
							input [5:0]  valid_states_i,

							output reg [7:0] check_o,
							output reg [47:0] alu_reg_o,
							output reg [7:0] alu_mode_o,
							output reg [25:0] wr_enable_o,
							output busy_o

	);






// FSM States
localparam FSM_IDLE			     = 0;
localparam FSM_STAGE1_0          = 1;
localparam FSM_STAGE1_1          = 2;
localparam FSM_STAGE1_2          = 3;
localparam FSM_STAGE1_3          = 4;
localparam FSM_STAGE1_4          = 5;
localparam FSM_STAGE1_5          = 6;
localparam FSM_STAGE1_6          = 7;
localparam FSM_STAGE1_7          = 8;
localparam FSM_STAGE2_0          = 9;
localparam FSM_STAGE2_1          = 10;
localparam FSM_STAGE2_2          = 11;
localparam FSM_STAGE2_3          = 12;
localparam FSM_STAGE2_4          = 13;
localparam FSM_STAGE2_5          = 14;
localparam FSM_STAGE2_6          = 15;
localparam FSM_STAGE2_7          = 16;
localparam FSM_STAGE3_0			 = 17;
reg [4:0]  current_state, next_state;




reg start_r;
reg valid_r;
reg [5:0] valid_states_r;
reg busy_r;

always @(posedge clk) begin
	
	if(rst) begin

		busy_r			  <= HIGH;
		start_r 		  <= LOW;
		current_state 	  <= FSM_IDLE;
		valid_r  		  <= 0;
		valid_states_r 	  <= 0;

	end
	else begin

		start_r 	   	  <= start_i;
		valid_r 	      <= valid_i;
		current_state     <= next_state;
		valid_states_r    <= valid_states_i;
		
	end

end




always @(*) begin
	
	alu_mode_o  = `ALUMODE_IDLE;
	next_state  = current_state;
	check_o 	= 0;
	wr_enable_o = 0;
	alu_reg_o   = 0;


	case (current_state)



		FSM_IDLE: begin

			busy_r			  						= LOW;

			if(start_r == HIGH) begin

				busy_r			  					= HIGH;
				next_state 							= FSM_STAGE1_0;

			end

		end

		// Stage 1
		FSM_STAGE1_0: begin

			alu_reg_o[`ALUREG_X_0_TO_OP_A] 			= HIGH;
			alu_reg_o[`ALUREG_X_4_TO_OP_B]			= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_1;

		end

		FSM_STAGE1_1: begin

			wr_enable_o[`WBF_S1_0]					= HIGH;
			alu_reg_o[`ALUREG_X_0_TO_OP_A] 			= HIGH;
			alu_reg_o[`ALUREG_X_4_TO_OP_B]    		= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_2;

		end

		FSM_STAGE1_2: begin

			wr_enable_o[`WBF_S1_1]					= HIGH;
			alu_reg_o[`ALUREG_X_2_TO_OP_A] 			= HIGH;
			alu_reg_o[`ALUREG_X_6_TO_OP_B]    		= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_3;

		end

		FSM_STAGE1_3: begin

			wr_enable_o[`WBF_S1_2]					= HIGH;
			alu_reg_o[`ALUREG_X_2_TO_OP_A] 			= HIGH;
			alu_reg_o[`ALUREG_X_6_TO_OP_B]    		= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_4;

		end

		FSM_STAGE1_4: begin

			wr_enable_o[`WBF_S1_3]					= HIGH;
			alu_reg_o[`ALUREG_X_1_TO_OP_A] 			= HIGH;
			alu_reg_o[`ALUREG_X_5_TO_OP_B]    		= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_5;

		end

		FSM_STAGE1_5: begin

			wr_enable_o[`WBF_S1_4]					= HIGH;
			alu_reg_o[`ALUREG_X_1_TO_OP_A] 			= HIGH;
			alu_reg_o[`ALUREG_X_5_TO_OP_B]    		= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_6;

		end

		FSM_STAGE1_6: begin

			wr_enable_o[`WBF_S1_5]					= HIGH;
			alu_reg_o[`ALUREG_X_3_TO_OP_A] 			= HIGH;
			alu_reg_o[`ALUREG_X_7_TO_OP_B]    		= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_7;

		end

		FSM_STAGE1_7: begin

			wr_enable_o[`WBF_S1_6]					= HIGH;
			alu_reg_o[`ALUREG_X_3_TO_OP_A] 			= HIGH;
			alu_reg_o[`ALUREG_X_7_TO_OP_B]    		= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_0;

		end



		// Stage 2
		FSM_STAGE2_0: begin

			wr_enable_o[`WBF_S1_7]					= HIGH;
			alu_reg_o[`ALUREG_S1_0_TO_OP_A] 		= HIGH;
			alu_reg_o[`ALUREG_S1_2_TO_OP_B]    	  	= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_1;

		end

		FSM_STAGE2_1: begin

			wr_enable_o[`WBF_S2_0]				    = HIGH;
			wr_enable_o[`WBF_S2_1_REEL]				= HIGH;
			wr_enable_o[`WBF_S2_1_IMAG]				= HIGH;
			next_state 								= FSM_STAGE2_2;

		end

		FSM_STAGE2_2: begin

			alu_reg_o[`ALUREG_S1_0_TO_OP_A] 		= HIGH;
			alu_reg_o[`ALUREG_S1_2_TO_OP_B]    	  	= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_3;

		end

		FSM_STAGE2_3: begin

			wr_enable_o[`WBF_S2_2]				    = HIGH;
			wr_enable_o[`WBF_S2_3_REEL]				= HIGH;
			wr_enable_o[`WBF_S2_3_IMAG]				= HIGH;
			next_state 								= FSM_STAGE2_4;

		end

		FSM_STAGE2_4: begin

			alu_reg_o[`ALUREG_S1_4_TO_OP_A] 		= HIGH;
			alu_reg_o[`ALUREG_S1_6_TO_OP_B]    	  	= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_5;

		end

		FSM_STAGE2_5: begin

			wr_enable_o[`WBF_S2_4]				    = HIGH;
			wr_enable_o[`WBF_S2_5_REEL]				= HIGH;
			wr_enable_o[`WBF_S2_5_IMAG]				= HIGH;
			next_state 								= FSM_STAGE2_6;

		end

		FSM_STAGE2_6: begin

			alu_reg_o[`ALUREG_S1_4_TO_OP_A] 		= HIGH;
			alu_reg_o[`ALUREG_S1_6_TO_OP_B]    	  	= HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_7;

		end

		FSM_STAGE2_7: begin

			wr_enable_o[`WBF_S2_6]				    = HIGH;
			wr_enable_o[`WBF_S2_7_REEL]				= HIGH;
			wr_enable_o[`WBF_S2_7_IMAG]				= HIGH;
			next_state 								= FSM_STAGE3_0;

		end

		// Stage 3
		FSM_STAGE3_0: begin

			next_state 								= FSM_IDLE;

		end

	endcase 

end


assign busy_o = busy_r;


endmodule