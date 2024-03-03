`ifndef _constants_vh_
`define _constants_vh_


 /* Alu Register */
`define ALUREG_X_0_TO_OP_A 			   			 0
`define ALUREG_X_1_TO_OP_A				    	 1
`define ALUREG_X_2_TO_OP_A				    	 2
`define ALUREG_X_3_TO_OP_A				    	 3
`define ALUREG_X_4_TO_OP_B				    	 4
`define ALUREG_X_5_TO_OP_B				    	 5
`define ALUREG_X_6_TO_OP_B				    	 6
`define ALUREG_X_7_TO_OP_B				    	 7

`define ALUREG_S1_0_TO_OP_A 					 8
`define ALUREG_S1_1_TO_OP_A 					 9
`define ALUREG_S1_2_TO_OP_B 					 10
`define ALUREG_S1_3_TO_OP_B 					 11
`define ALUREG_S1_4_TO_OP_A 					 12
`define ALUREG_S1_5_TO_OP_A 					 13
`define ALUREG_S1_6_TO_OP_B 					 14
`define ALUREG_S1_7_TO_OP_B 					 15



/* ALU Mode */
`define ALUMODE_IDLE 			       			 0
`define ALUMODE_A_SHIFT_R_B  	       			 1
`define ALUMODE_A_SHIFT_L_B  	  	   			 2 
`define ALUMODE_A_ADD_B  		       			 3
`define ALUMODE_COMPARE_HIGHER_A_WITH_B 		 4 
`define ALUMODE_COMPARE_LOWER_A_WITH_B  		 5
`define ALUMODE_A_SUB_B				   			 6
`define ALUMODE_A_SIGN_B				   		 7
`define ALUMODE_A_ADDSUB_C			   			 8
`define ALUMODE_A_MULT_B				   		 9

/* Write Back Flags */
`define WBF_S1_0 							     0
`define WBF_S1_1 							     1
`define WBF_S1_2 							     2
`define WBF_S1_3 							     3
`define WBF_S1_4 							     4
`define WBF_S1_5 							     5
`define WBF_S1_6 							     6
`define WBF_S1_7  							     7
`define WBF_S2_0 							     8
`define WBF_S2_1_REEL						     9
`define WBF_S2_1_IMAG						     10
`define WBF_S2_2 							     11
`define WBF_S2_3_REEL						     12
`define WBF_S2_3_IMAG						     13
`define WBF_S2_4 							     14
`define WBF_S2_5_REEL						     15
`define WBF_S2_5_IMAG						     16
`define WBF_S2_6 							     17
`define WBF_S2_7_REEL						     18
`define WBF_S2_7_IMAG						     19



`define LOW 									 1'b0
`define HIGH 									 1'b1


`define W_8_1_REEL								 16'b0_101101010000010 			// 0,70709228515625
`define W_8_1_IMAG								 (-1) * (16'b0_101101010000010) // -j*0,70709228515625

`define W_8_2_IMAG								 -1

`define W_8_3_REEL								 (-1) * (16'b0_101101010000010) // -0,70709228515625
`define W_8_3_IMAG								 (-1) * (16'b0_101101010000010) // -j*0,70709228515625

`endif






