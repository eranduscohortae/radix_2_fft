
`include "constants.vh"

module fft16_controller(

						 	input clk,
							input rst,
							input start_i,

							output reg [150:0] alu_reg_o,
							output reg [4:0] alu_mode_o,
							output reg [127:0] wr_enable_o,
							output busy_o,
							output valid_o

					  );






// FSM States
localparam FSM_IDLE			     = 0;

localparam FSM_STAGE1_R0         = 1;
localparam FSM_STAGE1_I0         = 2;
localparam FSM_STAGE1_R1         = 3;
localparam FSM_STAGE1_I1         = 4;
localparam FSM_STAGE1_R2         = 5;
localparam FSM_STAGE1_I2         = 6;
localparam FSM_STAGE1_R3         = 7;
localparam FSM_STAGE1_I3         = 8;
localparam FSM_STAGE1_R4         = 9;
localparam FSM_STAGE1_I4         = 10;
localparam FSM_STAGE1_R5         = 11;
localparam FSM_STAGE1_I5         = 12;
localparam FSM_STAGE1_R6         = 13;
localparam FSM_STAGE1_I6         = 14;
localparam FSM_STAGE1_R7         = 15;
localparam FSM_STAGE1_I7         = 16;
localparam FSM_STAGE1_R8         = 17;
localparam FSM_STAGE1_I8         = 18;
localparam FSM_STAGE1_R9         = 19;
localparam FSM_STAGE1_I9         = 20;
localparam FSM_STAGE1_R10        = 21;
localparam FSM_STAGE1_I10        = 22;
localparam FSM_STAGE1_R11        = 23;
localparam FSM_STAGE1_I11        = 24;
localparam FSM_STAGE1_R12        = 25;
localparam FSM_STAGE1_I12        = 26;
localparam FSM_STAGE1_R13        = 27;
localparam FSM_STAGE1_I13        = 28;
localparam FSM_STAGE1_R14        = 29;
localparam FSM_STAGE1_I14        = 30;
localparam FSM_STAGE1_R15        = 31;
localparam FSM_STAGE1_I15        = 32;

localparam FSM_STAGE2_R0         = 33;
localparam FSM_STAGE2_I0         = 34;
localparam FSM_STAGE2_R1         = 35;
localparam FSM_STAGE2_I1         = 36;
localparam FSM_STAGE2_R2         = 37;
localparam FSM_STAGE2_I2         = 38;
localparam FSM_STAGE2_R3         = 39;
localparam FSM_STAGE2_I3         = 40;
localparam FSM_STAGE2_R4         = 41;
localparam FSM_STAGE2_I4         = 42;
localparam FSM_STAGE2_R5         = 43;
localparam FSM_STAGE2_I5         = 44;
localparam FSM_STAGE2_R6         = 45;
localparam FSM_STAGE2_I6         = 46;
localparam FSM_STAGE2_R7         = 47;
localparam FSM_STAGE2_I7         = 48;
localparam FSM_STAGE2_R8         = 49;
localparam FSM_STAGE2_I8         = 50;
localparam FSM_STAGE2_R9         = 51;
localparam FSM_STAGE2_I9         = 52;
localparam FSM_STAGE2_R10        = 53;
localparam FSM_STAGE2_I10        = 54;
localparam FSM_STAGE2_R11        = 55;
localparam FSM_STAGE2_I11        = 56;
localparam FSM_STAGE2_R12        = 57;
localparam FSM_STAGE2_I12        = 58;
localparam FSM_STAGE2_R13        = 59;
localparam FSM_STAGE2_I13        = 60;
localparam FSM_STAGE2_R14        = 61;
localparam FSM_STAGE2_I14        = 62;
localparam FSM_STAGE2_R15        = 63;
localparam FSM_STAGE2_I15        = 64;


localparam FSM_STAGE3_R0         = 65;
localparam FSM_STAGE3_I0         = 66;
localparam FSM_STAGE3_R1         = 67;
localparam FSM_STAGE3_I1         = 68;
localparam FSM_STAGE3_R2         = 69;
localparam FSM_STAGE3_I2         = 70;
localparam FSM_STAGE3_R3         = 71;
localparam FSM_STAGE3_I3         = 72;
localparam FSM_STAGE3_R4         = 73;
localparam FSM_STAGE3_I4         = 74;
localparam FSM_STAGE3_R5         = 75;
localparam FSM_STAGE3_I5         = 76;
localparam FSM_STAGE3_R6         = 77;
localparam FSM_STAGE3_I6         = 78;
localparam FSM_STAGE3_R7         = 79;
localparam FSM_STAGE3_I7         = 80;
localparam FSM_STAGE3_R8         = 81;
localparam FSM_STAGE3_I8         = 82;
localparam FSM_STAGE3_R9         = 83;
localparam FSM_STAGE3_I9         = 84;
localparam FSM_STAGE3_R10        = 85;
localparam FSM_STAGE3_I10        = 86;
localparam FSM_STAGE3_R11        = 87;
localparam FSM_STAGE3_I11        = 88;
localparam FSM_STAGE3_R12        = 89;
localparam FSM_STAGE3_I12        = 90;
localparam FSM_STAGE3_R13        = 91;
localparam FSM_STAGE3_I13        = 92;
localparam FSM_STAGE3_R14        = 93;
localparam FSM_STAGE3_I14        = 94;
localparam FSM_STAGE3_R15        = 95;
localparam FSM_STAGE3_I15        = 96;


localparam FSM_STAGE3_T_R0 		 = 97;
localparam FSM_STAGE3_T_I0 		 = 98;
localparam FSM_STAGE3_T_R1 		 = 99;
localparam FSM_STAGE3_T_I1 		 = 100;
localparam FSM_STAGE3_T_R2 		 = 101;
localparam FSM_STAGE3_T_I2 		 = 102;
localparam FSM_STAGE3_T_R3 		 = 103;
localparam FSM_STAGE3_T_I3 		 = 104;
localparam FSM_STAGE3_T_R4 		 = 105;
localparam FSM_STAGE3_T_I4 		 = 106;
localparam FSM_STAGE3_T_R5 		 = 107;
localparam FSM_STAGE3_T_I5 		 = 108;
localparam FSM_STAGE3_T_R6 		 = 109;
localparam FSM_STAGE3_T_I6 		 = 110;
localparam FSM_STAGE3_T_R7 		 = 111;
localparam FSM_STAGE3_T_I7 		 = 112;
localparam FSM_STAGE3_T_R8 		 = 113;
localparam FSM_STAGE3_T_I8 		 = 114;
localparam FSM_STAGE3_T_R9 		 = 115;
localparam FSM_STAGE3_T_I9 		 = 116;
localparam FSM_STAGE3_T_R10		 = 117;
localparam FSM_STAGE3_T_I10		 = 118;
localparam FSM_STAGE3_T_R11		 = 119;
localparam FSM_STAGE3_T_I11		 = 120;

/*
localparam FSM_WAIT_END			 = 109;
localparam FSM_END 				 = 110;
*/
reg [6:0]  current_state, next_state;




reg start_r;
reg valid_r;
reg busy_r;

always @(posedge clk) begin
	
	if(rst) begin

		busy_r			  <= `HIGH;
		start_r 		  <= `LOW;
		current_state 	  <= FSM_IDLE;
		valid_r  		  <= 0;

	end
	else begin

		start_r 	   	  <= start_i;
		current_state     <= next_state;
		
	end

end




always @(*) begin
	
	alu_mode_o  = `ALUMODE_IDLE;
	next_state  = current_state;
	wr_enable_o = 0;
	alu_reg_o   = 0;
	valid_r     = 0;


	case (current_state)



		FSM_IDLE: begin

			busy_r			  						= `LOW;

			if(start_r == `HIGH) begin

				busy_r			  					= `HIGH;
				next_state 							= FSM_STAGE1_R0;

			end

		end

		// Stage 1
		FSM_STAGE1_R0: begin

			alu_reg_o[`ALUREG_16_X_R0_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R8_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_I0;

		end

		FSM_STAGE1_I0: begin

			wr_enable_o[`WBF_16_S1_R0]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I0_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I8_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_R1;

		end

		FSM_STAGE1_R1: begin

			wr_enable_o[`WBF_16_S1_I0]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R0_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R8_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_I1;

		end

		FSM_STAGE1_I1: begin

			wr_enable_o[`WBF_16_S1_R1]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I0_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I8_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_R2;

		end

		FSM_STAGE1_R2: begin

			wr_enable_o[`WBF_16_S1_I1]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R4_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R12_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_I2;

		end

		FSM_STAGE1_I2: begin

			wr_enable_o[`WBF_16_S1_R2]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I4_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I12_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_R3;

		end

		FSM_STAGE1_R3: begin

			wr_enable_o[`WBF_16_S1_I2]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R4_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R12_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_I3;

		end

		FSM_STAGE1_I3: begin

			wr_enable_o[`WBF_16_S1_R3]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I4_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I12_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_R4;

		end

		FSM_STAGE1_R4: begin

			wr_enable_o[`WBF_16_S1_I3]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R2_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R10_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_I4;

		end

		FSM_STAGE1_I4: begin

			wr_enable_o[`WBF_16_S1_R4]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I2_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I10_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_R5;

		end

		FSM_STAGE1_R5: begin

			wr_enable_o[`WBF_16_S1_I4]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R2_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R10_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_I5;

		end

		FSM_STAGE1_I5: begin

			wr_enable_o[`WBF_16_S1_R5]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I2_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I10_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_R6;

		end

		FSM_STAGE1_R6: begin

			wr_enable_o[`WBF_16_S1_I5]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R6_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R14_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_I6;

		end

		FSM_STAGE1_I6: begin

			wr_enable_o[`WBF_16_S1_R6]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I6_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I14_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_R7;

		end

		FSM_STAGE1_R7: begin

			wr_enable_o[`WBF_16_S1_I6]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R6_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R14_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_I7;

		end

		FSM_STAGE1_I7: begin

			wr_enable_o[`WBF_16_S1_R7]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I6_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I14_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_R8;

		end

		FSM_STAGE1_R8: begin

			wr_enable_o[`WBF_16_S1_I7]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R1_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R9_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_I8;

		end

		FSM_STAGE1_I8: begin

			wr_enable_o[`WBF_16_S1_R8]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I1_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I9_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_R9;

		end


		FSM_STAGE1_R9: begin

			wr_enable_o[`WBF_16_S1_I8]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R1_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R9_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_I9;

		end

		FSM_STAGE1_I9: begin

			wr_enable_o[`WBF_16_S1_R9]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I1_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I9_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_R10;

		end

		FSM_STAGE1_R10: begin

			wr_enable_o[`WBF_16_S1_I9]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R5_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R13_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_I10;

		end

		FSM_STAGE1_I10: begin

			wr_enable_o[`WBF_16_S1_R10]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_I5_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I13_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_R11;

		end


		FSM_STAGE1_R11: begin

			wr_enable_o[`WBF_16_S1_I10]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_R5_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R13_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_I11;

		end

		FSM_STAGE1_I11: begin

			wr_enable_o[`WBF_16_S1_R11]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_I5_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I13_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_R12;

		end

		FSM_STAGE1_R12: begin

			wr_enable_o[`WBF_16_S1_I11]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_R3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R11_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_I12;

		end

		FSM_STAGE1_I12: begin

			wr_enable_o[`WBF_16_S1_R12]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_I3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I11_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_R13;

		end

		FSM_STAGE1_R13: begin

			wr_enable_o[`WBF_16_S1_I12]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_R3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R11_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_I13;

		end

		FSM_STAGE1_I13: begin

			wr_enable_o[`WBF_16_S1_R13]					= `HIGH;
			alu_reg_o[`ALUREG_16_X_I3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I11_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_R14;

		end


		FSM_STAGE1_R14: begin

			wr_enable_o[`WBF_16_S1_I13]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_R7_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R15_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_I14;

		end

		FSM_STAGE1_I14: begin

			wr_enable_o[`WBF_16_S1_R14]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_I7_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I15_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE1_R15;

		end


		FSM_STAGE1_R15: begin

			wr_enable_o[`WBF_16_S1_I14]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_R7_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_R15_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE1_I15;

		end

		FSM_STAGE1_I15: begin

			wr_enable_o[`WBF_16_S1_R15]				= `HIGH;
			alu_reg_o[`ALUREG_16_X_I7_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_X_I15_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R0;

		end


		// Stage 2
		FSM_STAGE2_R0: begin

			wr_enable_o[`WBF_16_S1_I15]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R0_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R2_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_I0;
			

		end

		FSM_STAGE2_I0: begin
		
			wr_enable_o[`WBF_16_S2_R0]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I0_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I2_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_R2;
		
		end

		FSM_STAGE2_R2: begin

			wr_enable_o[`WBF_16_S2_I0]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R0_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R2_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_I2;

		end

		FSM_STAGE2_I2: begin

			wr_enable_o[`WBF_16_S2_R2]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I0_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I2_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R1;

		end
		
		FSM_STAGE2_R1: begin

			wr_enable_o[`WBF_16_S2_I2]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R1_TO_OP_A]		= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I3_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_I1;

		end

		FSM_STAGE2_I1: begin

			wr_enable_o[`WBF_16_S2_R1]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I1_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R3_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R3;

		end
		

		FSM_STAGE2_R3: begin

			wr_enable_o[`WBF_16_S2_I1]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R1_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I3_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_I3;

		end

		FSM_STAGE2_I3: begin

			wr_enable_o[`WBF_16_S2_R3]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I1_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R3_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_R4;

		end

		FSM_STAGE2_R4: begin

			wr_enable_o[`WBF_16_S2_I3]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R4_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R6_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_I4;
			

		end

		FSM_STAGE2_I4: begin

			wr_enable_o[`WBF_16_S2_R4]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I4_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I6_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_R6;

		end

		FSM_STAGE2_R6: begin

			wr_enable_o[`WBF_16_S2_I4]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R4_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R6_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_I6;

		end

		FSM_STAGE2_I6: begin

			wr_enable_o[`WBF_16_S2_R6]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I4_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I6_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R5;

		end

		FSM_STAGE2_R5: begin

			wr_enable_o[`WBF_16_S2_I6]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R5_TO_OP_A]		= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I7_TO_OP_B]		= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_I5;

		end

		FSM_STAGE2_I5: begin

			wr_enable_o[`WBF_16_S2_R5]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I5_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R7_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R7;

		end

		FSM_STAGE2_R7: begin

			wr_enable_o[`WBF_16_S2_I5]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R5_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I7_TO_OP_B]    	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_I7;

		end

		FSM_STAGE2_I7: begin

			wr_enable_o[`WBF_16_S2_R7]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I5_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R7_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_R8;

		end

		FSM_STAGE2_R8: begin

			wr_enable_o[`WBF_16_S2_I7]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R8_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R10_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_I8;
			

		end

		FSM_STAGE2_I8: begin
		
			wr_enable_o[`WBF_16_S2_R8]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I8_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I10_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_R10;
		
		end

		FSM_STAGE2_R10: begin

			wr_enable_o[`WBF_16_S2_I8]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R8_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R10_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_I10;

		end

		FSM_STAGE2_I10: begin

			wr_enable_o[`WBF_16_S2_R10]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I8_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I10_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R9;

		end
		
		FSM_STAGE2_R9: begin

			wr_enable_o[`WBF_16_S2_I10]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R9_TO_OP_A]		= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I11_TO_OP_B]	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_I9;

		end

		FSM_STAGE2_I9: begin

			wr_enable_o[`WBF_16_S2_R9]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I9_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R11_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R11;

		end
		

		FSM_STAGE2_R11: begin

			wr_enable_o[`WBF_16_S2_I9]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R9_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I11_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_I11;

		end

		FSM_STAGE2_I11: begin
			wr_enable_o[`WBF_16_S2_R11]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I9_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R11_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_R12;

		end

		FSM_STAGE2_R12: begin

			wr_enable_o[`WBF_16_S2_I11]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R12_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R14_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_I12;
			

		end

		FSM_STAGE2_I12: begin

			wr_enable_o[`WBF_16_S2_R12]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I12_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I14_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_R14;

		end

		FSM_STAGE2_R14: begin

			wr_enable_o[`WBF_16_S2_I12]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R12_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R14_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_I14;

		end

		FSM_STAGE2_I14: begin

			wr_enable_o[`WBF_16_S2_R14]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I12_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I14_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R13;

		end

		FSM_STAGE2_R13: begin

			wr_enable_o[`WBF_16_S2_I14]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R13_TO_OP_A]	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I15_TO_OP_B]	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_I13;

		end

		FSM_STAGE2_I13: begin

			wr_enable_o[`WBF_16_S2_R13]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I13_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R15_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE2_R15;

		end

		FSM_STAGE2_R15: begin

			wr_enable_o[`WBF_16_S2_I13]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R13_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I15_TO_OP_B]    = `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE2_I15;

		end

		FSM_STAGE2_I15: begin

			wr_enable_o[`WBF_16_S2_R15]				= `HIGH;
			alu_reg_o[`ALUREG_16_S1_I13_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S1_R15_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_R0;

		end


		FSM_STAGE3_R0: begin

			wr_enable_o[`WBF_16_S2_I15]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R0_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R4_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_I0;
			

		end

		FSM_STAGE3_I0: begin

			wr_enable_o[`WBF_16_S3_R0]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I0_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I4_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_R4;
						
		end

		FSM_STAGE3_R4: begin

			wr_enable_o[`WBF_16_S3_I0]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R0_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R4_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE3_I4;

		end

		FSM_STAGE3_I4: begin

			wr_enable_o[`WBF_16_S3_R4]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I0_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I4_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE3_R8;
						
		end


		FSM_STAGE3_R8: begin

			wr_enable_o[`WBF_16_S3_I4]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R8_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R12_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_I8;
			

		end

		FSM_STAGE3_I8: begin

			wr_enable_o[`WBF_16_S3_R8]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I8_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I12_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_R12;
						
		end

		FSM_STAGE3_R12: begin

			wr_enable_o[`WBF_16_S3_I8]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R8_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R12_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE3_I12;

		end

		FSM_STAGE3_I12: begin

			wr_enable_o[`WBF_16_S3_R12]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I8_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I12_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE3_R2;
						
		end


		FSM_STAGE3_R2: begin

			wr_enable_o[`WBF_16_S3_I12]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R2_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I6_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE3_I2;

		end

		FSM_STAGE3_I2: begin

			wr_enable_o[`WBF_16_S3_R2]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I2_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R6_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE3_R6;
						
		end

		FSM_STAGE3_R6: begin

			wr_enable_o[`WBF_16_S3_I2]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R2_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I6_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_I6;

		end

		FSM_STAGE3_I6: begin

			wr_enable_o[`WBF_16_S3_R6]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I2_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R6_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_R10;
						
		end

		FSM_STAGE3_R10: begin

			wr_enable_o[`WBF_16_S3_I6]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R10_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I14_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE3_I10;

		end

		FSM_STAGE3_I10: begin

			wr_enable_o[`WBF_16_S3_R10]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I10_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R14_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;
			next_state 								= FSM_STAGE3_R14;
						
		end

		FSM_STAGE3_R14: begin

			wr_enable_o[`WBF_16_S3_I10]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R10_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I14_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_I14;

		end

		FSM_STAGE3_I14: begin

			wr_enable_o[`WBF_16_S3_R14]				= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I10_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R14_TO_OP_B]  	= `HIGH;			
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;
			next_state 								= FSM_STAGE3_T_R0;
						
		end

		FSM_STAGE3_T_R0: begin

			wr_enable_o[`WBF_16_S3_I14]				= `HIGH;
			alu_reg_o[`ALUREG_W_16_2_REEL_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R5_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_MULT_B;
			next_state 								= FSM_STAGE3_T_I0;	
			
		end

		FSM_STAGE3_T_I0: begin

			wr_enable_o[`WBF_16_T_R0]				= `HIGH;
			wr_enable_o[`WBF_16_T_I1]				= `HIGH;
			alu_reg_o[`ALUREG_W_16_2_REEL_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I5_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_MULT_B;
			next_state 								= FSM_STAGE3_T_R2;	
											
		end

		FSM_STAGE3_T_R2: begin

			wr_enable_o[`WBF_16_T_I0]				= `HIGH;
			wr_enable_o[`WBF_16_T_R1]				= `HIGH;
			alu_reg_o[`ALUREG_16_T_R0_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_T_R1_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_T_I2;	
											
		end

		FSM_STAGE3_T_I2: begin

			wr_enable_o[`WBF_16_T_R2]				= `HIGH;
			alu_reg_o[`ALUREG_16_T_I0_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_T_I1_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_T_R3;	
											
		end

		FSM_STAGE3_T_R3: begin

			wr_enable_o[`WBF_16_T_I2]				= `HIGH;
			alu_reg_o[`ALUREG_W_16_2_REEL_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R13_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_MULT_B;			
			next_state 								= FSM_STAGE3_T_I3;	
											
		end

		FSM_STAGE3_T_I3: begin

			wr_enable_o[`WBF_16_T_R3]				= `HIGH;
			wr_enable_o[`WBF_16_T_I4]				= `HIGH;
			alu_reg_o[`ALUREG_W_16_2_REEL_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I13_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_MULT_B;			
			next_state 								= FSM_STAGE3_T_R5;	
											
		end

		FSM_STAGE3_T_R5: begin

			wr_enable_o[`WBF_16_T_I3]				= `HIGH;
			wr_enable_o[`WBF_16_T_R4]				= `HIGH;
			alu_reg_o[`ALUREG_16_T_R3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_T_R4_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_T_I5;	
											
		end

		FSM_STAGE3_T_I5: begin

			wr_enable_o[`WBF_16_T_R5]				= `HIGH;
			alu_reg_o[`ALUREG_16_T_I3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_T_I4_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_T_R6;	
											
		end

		FSM_STAGE3_T_R6: begin

			wr_enable_o[`WBF_16_T_I5]				= `HIGH;
			alu_reg_o[`ALUREG_W_16_6_REEL_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R7_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_MULT_B;
			next_state 								= FSM_STAGE3_T_I6;	
			
		end

		FSM_STAGE3_T_I6: begin

			wr_enable_o[`WBF_16_T_R6]				= `HIGH;
			wr_enable_o[`WBF_16_T_I7]				= `HIGH;
			alu_reg_o[`ALUREG_W_16_6_REEL_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I7_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_MULT_B;
			next_state 								= FSM_STAGE3_T_R8;	
											
		end

		FSM_STAGE3_T_R8: begin

			wr_enable_o[`WBF_16_T_I6]				= `HIGH;
			wr_enable_o[`WBF_16_T_R7]				= `HIGH;
			alu_reg_o[`ALUREG_16_T_R6_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_T_R7_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_T_I8;	
											
		end

		FSM_STAGE3_T_I8: begin

			wr_enable_o[`WBF_16_T_R8]				= `HIGH;
			alu_reg_o[`ALUREG_16_T_I6_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_T_I7_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_T_R9;	
											
		end

		FSM_STAGE3_T_R9: begin

			wr_enable_o[`WBF_16_T_I8]				= `HIGH;
			alu_reg_o[`ALUREG_W_16_6_REEL_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_R15_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_MULT_B;			
			next_state 								= FSM_STAGE3_T_I9;	
											
		end

		FSM_STAGE3_T_I9: begin

			wr_enable_o[`WBF_16_T_R9]				= `HIGH;
			wr_enable_o[`WBF_16_T_I10]				= `HIGH;
			alu_reg_o[`ALUREG_W_16_6_REEL_TO_OP_A] 	= `HIGH;
			alu_reg_o[`ALUREG_16_S2_I15_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_MULT_B;			
			next_state 								= FSM_STAGE3_T_R11;	
											
		end

		FSM_STAGE3_T_R11: begin

			wr_enable_o[`WBF_16_T_I9]				= `HIGH;
			wr_enable_o[`WBF_16_T_R10]				= `HIGH;
			alu_reg_o[`ALUREG_16_T_R9_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_T_R10_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_T_I11;	
											
		end

		FSM_STAGE3_T_I11: begin

			wr_enable_o[`WBF_16_T_R11]				= `HIGH;
			alu_reg_o[`ALUREG_16_T_I9_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_16_T_I10_TO_OP_B]  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_R1;	
											
		end

		FSM_STAGE3_R1: begin

			wr_enable_o[`WBF_16_T_I11]				= `HIGH;
			alu_reg_o[`ALUREG_S2_R1_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_R2_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_I1;	
			
											
		end

		FSM_STAGE3_I1: begin

			wr_enable_o[`WBF_16_S3_R1]				= `HIGH;
			alu_reg_o[`ALUREG_S2_I1_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_I2_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_R5;	
											
		end

		FSM_STAGE3_R5: begin

			wr_enable_o[`WBF_16_S3_I1]				= `HIGH;
			alu_reg_o[`ALUREG_S2_R1_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_R2_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_I5;	
											
		end

		FSM_STAGE3_I5: begin

			wr_enable_o[`WBF_16_S3_R5]			    = `HIGH;
			alu_reg_o[`ALUREG_S2_I1_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_I2_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_R9;	
											
		end

		FSM_STAGE3_R9: begin

			wr_enable_o[`WBF_16_S3_I5]				= `HIGH;
			alu_reg_o[`ALUREG_S2_R9_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_R5_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_I9;	
											
		end

		FSM_STAGE3_I9: begin

			wr_enable_o[`WBF_16_S3_R9]				= `HIGH;
			alu_reg_o[`ALUREG_S2_I9_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_I5_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_ADD_B;			
			next_state 								= FSM_STAGE3_R13;	
											
		end
		FSM_STAGE3_R13: begin

			wr_enable_o[`WBF_16_S3_I9]				    = `HIGH;
			alu_reg_o[`ALUREG_S2_R9_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_R5_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_I13;	
											
		end

		FSM_STAGE3_I13: begin

			wr_enable_o[`WBF_16_S3_R13]				= `HIGH;
			alu_reg_o[`ALUREG_S2_I9_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_I5_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_R3;	
											
		end

		FSM_STAGE3_R3: begin

			wr_enable_o[`WBF_16_S3_I13]				= `HIGH;
			alu_reg_o[`ALUREG_S2_R3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_R8_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_I3;	
											
		end

		FSM_STAGE3_I3: begin

			wr_enable_o[`WBF_16_S3_R3]				= `HIGH;
			alu_reg_o[`ALUREG_S2_I3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_I8_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_R7;	
											
		end

		FSM_STAGE3_R7: begin

			wr_enable_o[`WBF_16_S3_I3]				= `HIGH;
			alu_reg_o[`ALUREG_S2_R3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_R8_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_I7;	
											
		end

		FSM_STAGE3_I7: begin

			wr_enable_o[`WBF_16_S3_R7]				= `HIGH;
			alu_reg_o[`ALUREG_S2_I3_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_I8_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_R11;	
											
		end

		FSM_STAGE3_R11: begin

			wr_enable_o[`WBF_16_S3_I7]				= `HIGH;
			alu_reg_o[`ALUREG_S2_R11_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_R11_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_I11;	
											
		end

		FSM_STAGE3_I11: begin

			wr_enable_o[`WBF_16_S3_R11]				= `HIGH;
			alu_reg_o[`ALUREG_S2_I11_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_I11_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_R15;	
											
		end

		FSM_STAGE3_R15: begin

			wr_enable_o[`WBF_16_S3_I11]				= `HIGH;
			alu_reg_o[`ALUREG_S2_R11_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_R11_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_STAGE3_I15;	
											
		end

		FSM_STAGE3_I15: begin

			wr_enable_o[`WBF_16_S3_R15]				= `HIGH;
			alu_reg_o[`ALUREG_S2_I11_TO_OP_A] 		= `HIGH;
			alu_reg_o[`ALUREG_T_I11_TO_OP_B]  	  	= `HIGH;
			alu_mode_o 		  						= `ALUMODE_A_SUB_B;			
			next_state 								= FSM_WAIT_END;	
											
		end

		FSM_WAIT_END: begin

			wr_enable_o[`WBF_X_I7]				    = `HIGH;
			next_state 								= FSM_END;	
											
		end

		FSM_END: begin


			valid_r 								= `HIGH;
			next_state 								= FSM_IDLE;
											
		end
		

	endcase 

end


assign busy_o  = busy_r;
assign valid_o = valid_r;


endmodule