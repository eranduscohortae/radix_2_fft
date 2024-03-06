`ifndef _constants_vh_
`define _constants_vh_


 /* Alu Register */
`define ALUREG_X_R0_TO_OP_A 			   		 0
`define ALUREG_X_I0_TO_OP_A 			   		 1
`define ALUREG_X_R1_TO_OP_A 			   		 2
`define ALUREG_X_I1_TO_OP_A 			   		 3
`define ALUREG_X_R2_TO_OP_A 			   		 4
`define ALUREG_X_I2_TO_OP_A 			   		 5
`define ALUREG_X_R3_TO_OP_A 			   		 6
`define ALUREG_X_I3_TO_OP_A 			   		 7
`define ALUREG_X_R4_TO_OP_B				    	 8
`define ALUREG_X_I4_TO_OP_B				    	 9
`define ALUREG_X_R5_TO_OP_B				    	 10
`define ALUREG_X_I5_TO_OP_B				    	 11
`define ALUREG_X_R6_TO_OP_B				    	 12
`define ALUREG_X_I6_TO_OP_B				    	 13
`define ALUREG_X_R7_TO_OP_B				    	 14
`define ALUREG_X_I7_TO_OP_B				    	 15

`define ALUREG_S1_R0_TO_OP_A 					 16
`define ALUREG_S1_I0_TO_OP_A 					 17
`define ALUREG_S1_R1_TO_OP_A 					 18
`define ALUREG_S1_I1_TO_OP_A 					 19
`define ALUREG_S1_R2_TO_OP_B 					 20
`define ALUREG_S1_I2_TO_OP_B 					 21
`define ALUREG_S1_R3_TO_OP_B 					 22
`define ALUREG_S1_I3_TO_OP_B 					 23
`define ALUREG_S1_R4_TO_OP_A 					 24
`define ALUREG_S1_I4_TO_OP_A 					 25
`define ALUREG_S1_R5_TO_OP_A 					 26
`define ALUREG_S1_I5_TO_OP_A 					 27
`define ALUREG_S1_R6_TO_OP_B 					 28
`define ALUREG_S1_I6_TO_OP_B 					 29
`define ALUREG_S1_R7_TO_OP_B 					 30
`define ALUREG_S1_I7_TO_OP_B 					 31

`define ALUREG_S2_R0_TO_OP_A 					 32
`define ALUREG_S2_I0_TO_OP_A 					 33
`define ALUREG_S2_R1_TO_OP_A 					 34
`define ALUREG_S2_I1_TO_OP_A 					 35
`define ALUREG_S2_R2_TO_OP_A 					 36
`define ALUREG_S2_I2_TO_OP_A 					 37
`define ALUREG_S2_R3_TO_OP_A 					 38
`define ALUREG_S2_I3_TO_OP_A 					 39
`define ALUREG_S2_R4_TO_OP_B 					 40
`define ALUREG_S2_I4_TO_OP_B 					 41
`define ALUREG_S2_R5_TO_OP_B 					 42
`define ALUREG_S2_I5_TO_OP_B 					 43
`define ALUREG_S2_R6_TO_OP_B 					 44
`define ALUREG_S2_I6_TO_OP_B 					 45
`define ALUREG_S2_R7_TO_OP_B 					 46
`define ALUREG_S2_I7_TO_OP_B 					 47
`define ALUREG_W_8_1_REEL_TO_OP_A 				 48
`define ALUREG_W_8_1_IMAG_TO_OP_A 				 49
`define ALUREG_W_8_3_REEL_TO_OP_A 				 50
`define ALUREG_W_8_3_IMAG_TO_OP_A 				 51
`define ALUREG_T_R0_TO_OP_A 					 52
`define ALUREG_T_I0_TO_OP_A 					 53
`define ALUREG_T_R1_TO_OP_B						 54
`define ALUREG_T_I1_TO_OP_B 					 55
`define ALUREG_T_R2_TO_OP_B 					 56
`define ALUREG_T_I2_TO_OP_B 					 57
`define ALUREG_T_R3_TO_OP_A 					 58
`define ALUREG_T_I3_TO_OP_A 					 59
`define ALUREG_T_R4_TO_OP_B 					 60
`define ALUREG_T_I4_TO_OP_B 					 61
`define ALUREG_T_R5_TO_OP_B 					 62
`define ALUREG_T_I5_TO_OP_B 					 63


/*
`define ALUREG_S2_0_TO_OP_A 					 16
`define ALUREG_S2_1_REEL_TO_OP_A 				 17
`define ALUREG_S2_1_IMAG_TO_OP_A 				 18
`define ALUREG_S2_2_TO_OP_A 					 19
`define ALUREG_S2_3_REEL_TO_OP_A 				 20
`define ALUREG_S2_3_IMAG_TO_OP_A 				 21
`define ALUREG_S2_4_TO_OP_B 					 22
`define ALUREG_S2_5_REEL_TO_OP_B 				 23
`define ALUREG_S2_5_IMAG_TO_OP_B				 24
`define ALUREG_S1_6_TO_OP_B 					 25
`define ALUREG_S2_7_REEL_TO_OP_B 				 26
`define ALUREG_S2_7_IMAG_TO_OP_B				 27
`define ALUREG_W_8_1_REEL_TO_OP_A 				 28
`define ALUREG_W_8_1_IMAG_TO_OP_A 				 29
`define ALUREG_W_8_2_REEL_TO_OP_A 				 30
`define ALUREG_W_8_2_IMAG_TO_OP_A 				 31
`define ALUREG_TEMP0_REEL_TO_OP_A				 32
`define ALUREG_TEMP1_REEL_TO_OP_B				 33
`define ALUREG_TEMP0_IMAG_TO_OP_A				 34
`define ALUREG_TEMP1_IMAG_TO_OP_B				 35
*/
/* ALU Mode */
`define ALUMODE_IDLE 			       			 0
`define ALUMODE_A_ADD_B  		       			 1
`define ALUMODE_A_SUB_B				   			 2
`define ALUMODE_A_ADD_C				   			 3
`define ALUMODE_A_MULT_B				   		 4

/* Write Back Flags */
`define WBF_S1_R0 							     0
`define WBF_S1_I0 							     1
`define WBF_S1_R1 							     2
`define WBF_S1_I1 							     3
`define WBF_S1_R2 							     4
`define WBF_S1_I2 							     5
`define WBF_S1_R3 							     6
`define WBF_S1_I3 							     7
`define WBF_S1_R4 							     8
`define WBF_S1_I4 							     9
`define WBF_S1_R5 							     10
`define WBF_S1_I5 							     11
`define WBF_S1_R6 							     12
`define WBF_S1_I6 							     13
`define WBF_S1_R7 							     14
`define WBF_S1_I7 							     15

`define WBF_S2_R0 							     16
`define WBF_S2_I0 							     17
`define WBF_S2_R1 							     18
`define WBF_S2_I1 							     19
`define WBF_S2_R2 							     20
`define WBF_S2_I2 							     21
`define WBF_S2_R3 							     22
`define WBF_S2_I3 							     23
`define WBF_S2_R4 							     24
`define WBF_S2_I4 							     25
`define WBF_S2_R5 							     26
`define WBF_S2_I5 							     27
`define WBF_S2_R6 							     28
`define WBF_S2_I6 							     29
`define WBF_S2_R7 							     30
`define WBF_S2_I7 							     31

`define WBF_X_R0								 32
`define WBF_X_I0								 33
`define WBF_X_R1								 34
`define WBF_X_I1								 35
`define WBF_X_R2								 36
`define WBF_X_I2								 37
`define WBF_X_R3								 38
`define WBF_X_I3								 39
`define WBF_X_R4								 40
`define WBF_X_I4								 41
`define WBF_X_R5								 42
`define WBF_X_I5								 43
`define WBF_X_R6								 44
`define WBF_X_I6								 45
`define WBF_X_R7								 46
`define WBF_X_I7								 47
`define WBF_T_R0	 							 48
`define WBF_T_I0	 							 49
`define WBF_T_R1	 							 50
`define WBF_T_I1	 							 51
`define WBF_T_R2	 							 52
`define WBF_T_I2	 							 53
`define WBF_T_R3	 							 54
`define WBF_T_I3	 							 55
`define WBF_T_R4	 							 56
`define WBF_T_I4	 							 57
`define WBF_T_R5	 							 58
`define WBF_T_I5	 							 59

/*
`define WBF_X1_REEL								 22
`define WBF_X1_IMAG								 23
`define WBF_X2_REEL								 24
`define WBF_X2_IMAG								 25
`define WBF_X3_REEL								 26
`define WBF_X3_IMAG								 27
`define WBF_X4_REEL								 28
`define WBF_X4_IMAG								 29
`define WBF_X5_REEL								 30
`define WBF_X5_IMAG								 31
`define WBF_X6_REEL								 32
`define WBF_X6_IMAG								 33
`define WBF_X7_REEL								 34
`define WBF_X7_IMAG								 35
`define WBF_TEMP0_REEL 							 36
`define WBF_TEMP0_IMAG 							 37
`define WBF_TEMP1_REEL 							 38
`define WBF_TEMP1_IMAG 							 39
`define WBF_TEMP2_REEL 							 40
`define WBF_TEMP2_IMAG 							 41
`define WBF_TEMP3_REEL 							 42
`define WBF_TEMP3_IMAG 							 43
*/


`define LOW 									 1'b0
`define HIGH 									 1'b1


`define W_8_1_REEL								   16'b00000000_10110101  //  0.70703125
`define W_8_1_IMAG								 -(16'b00000000_10110101) // -j*0.70703125

`define W_8_2_IMAG								 -1

`define W_8_3_REEL								 -(16'b00000000_10110101) // -0.70703125
`define W_8_3_IMAG								 -(16'b00000000_10110101) // -j*0.70703125

`endif






