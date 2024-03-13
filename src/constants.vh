`ifndef _constants_vh_
`define _constants_vh_

/* ALU Mode */
`define ALUMODE_IDLE 			       			 0
`define ALUMODE_A_ADD_B  		       			 1
`define ALUMODE_A_SUB_B				   			 2
`define ALUMODE_A_ADD_C				   			 3
`define ALUMODE_A_MULT_B				   		 4

`define START_FFT8								 2'd1
`define START_FFT16								 2'd2
`define START_FFT32								 2'd3


`define LOW 									 1'b0
`define HIGH 									 1'b1


/* ************************** FFT8 *************************************/

 /* Alu Register */
`define ALUREG_8_X_R0_TO_OP_A 			   		 0
`define ALUREG_8_X_I0_TO_OP_A 			   		 1
`define ALUREG_8_X_R1_TO_OP_A 			   		 2
`define ALUREG_8_X_I1_TO_OP_A 			   		 3
`define ALUREG_8_X_R2_TO_OP_A 			   		 4
`define ALUREG_8_X_I2_TO_OP_A 			   		 5
`define ALUREG_8_X_R3_TO_OP_A 			   		 6
`define ALUREG_8_X_I3_TO_OP_A 			   		 7
`define ALUREG_8_X_R4_TO_OP_B				     8
`define ALUREG_8_X_I4_TO_OP_B				     9
`define ALUREG_8_X_R5_TO_OP_B				     10
`define ALUREG_8_X_I5_TO_OP_B				     11
`define ALUREG_8_X_R6_TO_OP_B				     12
`define ALUREG_8_X_I6_TO_OP_B				     13
`define ALUREG_8_X_R7_TO_OP_B				     14
`define ALUREG_8_X_I7_TO_OP_B				     15

`define ALUREG_8_S1_R0_TO_OP_A 					 16
`define ALUREG_8_S1_I0_TO_OP_A 					 17
`define ALUREG_8_S1_R1_TO_OP_A 					 18
`define ALUREG_8_S1_I1_TO_OP_A 					 19
`define ALUREG_8_S1_R2_TO_OP_B 					 20
`define ALUREG_8_S1_I2_TO_OP_B 					 21
`define ALUREG_8_S1_R3_TO_OP_B 					 22
`define ALUREG_8_S1_I3_TO_OP_B 					 23
`define ALUREG_8_S1_R4_TO_OP_A 					 24
`define ALUREG_8_S1_I4_TO_OP_A 					 25
`define ALUREG_8_S1_R5_TO_OP_A 					 26
`define ALUREG_8_S1_I5_TO_OP_A 					 27
`define ALUREG_8_S1_R6_TO_OP_B 					 28
`define ALUREG_8_S1_I6_TO_OP_B 					 29
`define ALUREG_8_S1_R7_TO_OP_B 					 30
`define ALUREG_8_S1_I7_TO_OP_B 					 31

`define ALUREG_8_S2_R0_TO_OP_A 					 32
`define ALUREG_8_S2_I0_TO_OP_A 					 33
`define ALUREG_8_S2_R1_TO_OP_A 					 34
`define ALUREG_8_S2_I1_TO_OP_A 					 35
`define ALUREG_8_S2_R2_TO_OP_A 					 36
`define ALUREG_8_S2_I2_TO_OP_A 					 37
`define ALUREG_8_S2_R3_TO_OP_A 					 38
`define ALUREG_8_S2_I3_TO_OP_A 					 39
`define ALUREG_8_S2_R4_TO_OP_B 					 40
`define ALUREG_8_S2_I4_TO_OP_B 					 41
`define ALUREG_8_S2_R5_TO_OP_B 					 42
`define ALUREG_8_S2_I5_TO_OP_B 					 43
`define ALUREG_8_S2_R6_TO_OP_B 					 44
`define ALUREG_8_S2_I6_TO_OP_B 					 45
`define ALUREG_8_S2_R7_TO_OP_B 					 46
`define ALUREG_8_S2_I7_TO_OP_B 					 47
`define ALUREG_W_8_1_REEL_TO_OP_A 				 48
`define ALUREG_W_8_1_IMAG_TO_OP_A 				 49
`define ALUREG_W_8_3_REEL_TO_OP_A 				 50
`define ALUREG_W_8_3_IMAG_TO_OP_A 				 51
`define ALUREG_8_T_R0_TO_OP_A 					 52
`define ALUREG_8_T_I0_TO_OP_A 					 53
`define ALUREG_8_T_R1_TO_OP_B					 54
`define ALUREG_8_T_I1_TO_OP_B 					 55
`define ALUREG_8_T_R2_TO_OP_B 					 56
`define ALUREG_8_T_I2_TO_OP_B 					 57
`define ALUREG_8_T_R3_TO_OP_A 					 58
`define ALUREG_8_T_I3_TO_OP_A 					 59
`define ALUREG_8_T_R4_TO_OP_B 					 60
`define ALUREG_8_T_I4_TO_OP_B 					 61
`define ALUREG_8_T_R5_TO_OP_B 					 62
`define ALUREG_8_T_I5_TO_OP_B 					 63



/* Write Back Flags */
`define WBF_8_S1_R0 							     0
`define WBF_8_S1_I0 							     1
`define WBF_8_S1_R1 							     2
`define WBF_8_S1_I1 							     3
`define WBF_8_S1_R2 							     4
`define WBF_8_S1_I2 							     5
`define WBF_8_S1_R3 							     6
`define WBF_8_S1_I3 							     7
`define WBF_8_S1_R4 							     8
`define WBF_8_S1_I4 							     9
`define WBF_8_S1_R5 							     10
`define WBF_8_S1_I5 							     11
`define WBF_8_S1_R6 							     12
`define WBF_8_S1_I6 							     13
`define WBF_8_S1_R7 							     14
`define WBF_8_S1_I7 							     15

`define WBF_8_S2_R0 							     16
`define WBF_8_S2_I0 							     17
`define WBF_8_S2_R1 							     18
`define WBF_8_S2_I1 							     19
`define WBF_8_S2_R2 							     20
`define WBF_8_S2_I2 							     21
`define WBF_8_S2_R3 							     22
`define WBF_8_S2_I3 							     23
`define WBF_8_S2_R4 							     24
`define WBF_8_S2_I4 							     25
`define WBF_8_S2_R5 							     26
`define WBF_8_S2_I5 							     27
`define WBF_8_S2_R6 							     28
`define WBF_8_S2_I6 							     29
`define WBF_8_S2_R7 							     30
`define WBF_8_S2_I7 							     31

`define WBF_8_X_R0								 32
`define WBF_8_X_I0								 33
`define WBF_8_X_R1								 34
`define WBF_8_X_I1								 35
`define WBF_8_X_R2								 36
`define WBF_8_X_I2								 37
`define WBF_8_X_R3								 38
`define WBF_8_X_I3								 39
`define WBF_8_X_R4								 40
`define WBF_8_X_I4								 41
`define WBF_8_X_R5								 42
`define WBF_8_X_I5								 43
`define WBF_8_X_R6								 44
`define WBF_8_X_I6								 45
`define WBF_8_X_R7								 46
`define WBF_8_X_I7								 47
`define WBF_8_T_R0	 							 48
`define WBF_8_T_I0	 							 49
`define WBF_8_T_R1	 							 50
`define WBF_8_T_I1	 							 51
`define WBF_8_T_R2	 							 52
`define WBF_8_T_I2	 							 53
`define WBF_8_T_R3	 							 54
`define WBF_8_T_I3	 							 55
`define WBF_8_T_R4	 							 56
`define WBF_8_T_I4	 							 57
`define WBF_8_T_R5	 							 58
`define WBF_8_T_I5	 							 59


`define W_8_1_REEL								   16'b00000000_10110101  //  0.70703125
`define W_8_1_IMAG								 -(16'b00000000_10110101) // -j*0.70703125

`define W_8_2_IMAG								 -1

`define W_8_3_REEL								 -(16'b00000000_10110101) // -0.70703125
`define W_8_3_IMAG								 -(16'b00000000_10110101) // -j*0.70703125
/* *********************************************************************/



/* ************************** FFT16 *************************************/
 /* Alu Register */
`define ALUREG_16_X_R0_TO_OP_A 			   		 0
`define ALUREG_16_X_I0_TO_OP_A 			   		 1
`define ALUREG_16_X_R1_TO_OP_A 			   		 2
`define ALUREG_16_X_I1_TO_OP_A 			   		 3
`define ALUREG_16_X_R2_TO_OP_A 			   		 4
`define ALUREG_16_X_I2_TO_OP_A 			   		 5
`define ALUREG_16_X_R3_TO_OP_A 			   		 6
`define ALUREG_16_X_I3_TO_OP_A 			   		 7
`define ALUREG_16_X_R4_TO_OP_A				     8
`define ALUREG_16_X_I4_TO_OP_A				     9
`define ALUREG_16_X_R5_TO_OP_A				     10
`define ALUREG_16_X_I5_TO_OP_A				     11
`define ALUREG_16_X_R6_TO_OP_A				     12
`define ALUREG_16_X_I6_TO_OP_A				     13
`define ALUREG_16_X_R7_TO_OP_A				     14
`define ALUREG_16_X_I7_TO_OP_A				     15
`define ALUREG_16_X_R8_TO_OP_B 			   		 16
`define ALUREG_16_X_I8_TO_OP_B 			   		 17
`define ALUREG_16_X_R9_TO_OP_B 			   		 18
`define ALUREG_16_X_I9_TO_OP_B 			   		 19
`define ALUREG_16_X_R10_TO_OP_B 			   	 20
`define ALUREG_16_X_I10_TO_OP_B 			   	 21
`define ALUREG_16_X_R11_TO_OP_B 			   	 22
`define ALUREG_16_X_I11_TO_OP_B 			   	 23
`define ALUREG_16_X_R12_TO_OP_B				     24
`define ALUREG_16_X_I12_TO_OP_B				     25
`define ALUREG_16_X_R13_TO_OP_B				     26
`define ALUREG_16_X_I13_TO_OP_B				     27
`define ALUREG_16_X_R14_TO_OP_B				     28
`define ALUREG_16_X_I14_TO_OP_B				     29
`define ALUREG_16_X_R15_TO_OP_B				     30
`define ALUREG_16_X_I15_TO_OP_B				     31

`define ALUREG_16_S1_R0_TO_OP_A 				 32
`define ALUREG_16_S1_I0_TO_OP_A 				 33
`define ALUREG_16_S1_R1_TO_OP_A 				 34
`define ALUREG_16_S1_I1_TO_OP_A 				 35
`define ALUREG_16_S1_R2_TO_OP_B 				 36
`define ALUREG_16_S1_I2_TO_OP_B 				 37
`define ALUREG_16_S1_R3_TO_OP_B 				 38
`define ALUREG_16_S1_I3_TO_OP_B 				 39
`define ALUREG_16_S1_R4_TO_OP_A 				 40
`define ALUREG_16_S1_I4_TO_OP_A 				 41
`define ALUREG_16_S1_R5_TO_OP_A 				 42
`define ALUREG_16_S1_I5_TO_OP_A 				 43
`define ALUREG_16_S1_R6_TO_OP_B 				 44
`define ALUREG_16_S1_I6_TO_OP_B 				 45
`define ALUREG_16_S1_R7_TO_OP_B 				 46
`define ALUREG_16_S1_I7_TO_OP_B 				 47
`define ALUREG_16_S1_R8_TO_OP_A 				 48
`define ALUREG_16_S1_I8_TO_OP_A 				 49
`define ALUREG_16_S1_R9_TO_OP_A 				 50
`define ALUREG_16_S1_I9_TO_OP_A 				 51
`define ALUREG_16_S1_R10_TO_OP_B 				 52
`define ALUREG_16_S1_I10_TO_OP_B 				 53
`define ALUREG_16_S1_R11_TO_OP_B 				 54
`define ALUREG_16_S1_I11_TO_OP_B 				 55
`define ALUREG_16_S1_R12_TO_OP_A 				 56
`define ALUREG_16_S1_I12_TO_OP_A 				 57
`define ALUREG_16_S1_R13_TO_OP_A 				 58
`define ALUREG_16_S1_I13_TO_OP_A 				 59
`define ALUREG_16_S1_R14_TO_OP_B 				 60
`define ALUREG_16_S1_I14_TO_OP_B 				 61
`define ALUREG_16_S1_R15_TO_OP_B 				 62
`define ALUREG_16_S1_I15_TO_OP_B 				 63

`define ALUREG_16_S2_R0_TO_OP_A 				 64
`define ALUREG_16_S2_I0_TO_OP_A 				 65
`define ALUREG_16_S2_R1_TO_OP_A 				 66
`define ALUREG_16_S2_I1_TO_OP_A 				 67
`define ALUREG_16_S2_R2_TO_OP_A 				 68
`define ALUREG_16_S2_I2_TO_OP_A 				 69
`define ALUREG_16_S2_R3_TO_OP_A 				 70
`define ALUREG_16_S2_I3_TO_OP_A 				 71
`define ALUREG_16_S2_R4_TO_OP_B 				 72
`define ALUREG_16_S2_I4_TO_OP_B 				 73
`define ALUREG_16_S2_R5_TO_OP_B 				 74
`define ALUREG_16_S2_I5_TO_OP_B 				 75
`define ALUREG_16_S2_R6_TO_OP_B 				 76
`define ALUREG_16_S2_I6_TO_OP_B 				 77
`define ALUREG_16_S2_R7_TO_OP_B 				 78
`define ALUREG_16_S2_I7_TO_OP_B 				 79
`define ALUREG_16_S2_R8_TO_OP_A 				 80
`define ALUREG_16_S2_I8_TO_OP_A 				 81
`define ALUREG_16_S2_R9_TO_OP_A 				 82
`define ALUREG_16_S2_I9_TO_OP_A 				 83
`define ALUREG_16_S2_R10_TO_OP_A 				 84
`define ALUREG_16_S2_I10_TO_OP_A 				 85
`define ALUREG_16_S2_R11_TO_OP_A 				 86
`define ALUREG_16_S2_I11_TO_OP_A 				 87
`define ALUREG_16_S2_R12_TO_OP_B 				 88
`define ALUREG_16_S2_I12_TO_OP_B 				 89
`define ALUREG_16_S2_R13_TO_OP_B 				 90
`define ALUREG_16_S2_I13_TO_OP_B 				 91
`define ALUREG_16_S2_R14_TO_OP_B 				 92
`define ALUREG_16_S2_I14_TO_OP_B 				 93
`define ALUREG_16_S2_R15_TO_OP_B 				 94
`define ALUREG_16_S2_I15_TO_OP_B 				 95

`define ALUREG_W_16_1_REEL_TO_OP_A 		     	 96
`define ALUREG_W_16_1_IMAG_TO_OP_A 		     	 97
`define ALUREG_W_16_2_REEL_TO_OP_A 		     	 98
`define ALUREG_W_16_2_IMAG_TO_OP_A 		     	 99
`define ALUREG_W_16_3_REEL_TO_OP_A 		     	 100
`define ALUREG_W_16_3_IMAG_TO_OP_A 		     	 101
`define ALUREG_W_16_5_REEL_TO_OP_A 		     	 102
`define ALUREG_W_16_5_IMAG_TO_OP_A 		     	 103
`define ALUREG_W_16_6_REEL_TO_OP_A 		     	 104
`define ALUREG_W_16_6_IMAG_TO_OP_A 		     	 105
`define ALUREG_W_16_7_REEL_TO_OP_A 		     	 106
`define ALUREG_W_16_7_IMAG_TO_OP_A 		     	 107

`define ALUREG_16_T_R0_TO_OP_A 					 108
`define ALUREG_16_T_I0_TO_OP_A 					 109
`define ALUREG_16_T_R1_TO_OP_B					 110
`define ALUREG_16_T_I1_TO_OP_B 					 111
`define ALUREG_16_T_R2_TO_OP_B 					 112
`define ALUREG_16_T_I2_TO_OP_B 					 113
`define ALUREG_16_T_R3_TO_OP_A 					 114
`define ALUREG_16_T_I3_TO_OP_A 					 115
`define ALUREG_16_T_R4_TO_OP_B 					 116
`define ALUREG_16_T_I4_TO_OP_B 					 117
`define ALUREG_16_T_R5_TO_OP_B 					 118
`define ALUREG_16_T_I5_TO_OP_B 					 119
`define ALUREG_16_T_R6_TO_OP_A 					 120
`define ALUREG_16_T_I6_TO_OP_A 					 121
`define ALUREG_16_T_R7_TO_OP_B					 122
`define ALUREG_16_T_I7_TO_OP_B 					 123
`define ALUREG_16_T_R8_TO_OP_B 					 124
`define ALUREG_16_T_I8_TO_OP_B 					 125
`define ALUREG_16_T_R9_TO_OP_A 					 126
`define ALUREG_16_T_I9_TO_OP_A 					 127
`define ALUREG_16_T_R10_TO_OP_B 				 128
`define ALUREG_16_T_I10_TO_OP_B 				 129
`define ALUREG_16_T_R11_TO_OP_B 				 130
`define ALUREG_16_T_I11_TO_OP_B 				 131
`define ALUREG_16_T_R12_TO_OP_A 				 132
`define ALUREG_16_T_I12_TO_OP_A      			 133
`define ALUREG_16_T_R13_TO_OP_B 				 134
`define ALUREG_16_T_I13_TO_OP_B 				 135
`define ALUREG_16_T_R14_TO_OP_B 				 136
`define ALUREG_16_T_I14_TO_OP_B 				 137
`define ALUREG_16_T_R15_TO_OP_A 				 138
`define ALUREG_16_T_I15_TO_OP_A 				 139
`define ALUREG_16_T_R16_TO_OP_B 				 140
`define ALUREG_16_T_I16_TO_OP_B 				 141
`define ALUREG_16_T_R17_TO_OP_B 				 142
`define ALUREG_16_T_I17_TO_OP_B 				 143

`define ALUREG_16_S3_R0_TO_OP_A 				 144
`define ALUREG_16_S3_I0_TO_OP_A 				 145
`define ALUREG_16_S3_R1_TO_OP_A 				 146
`define ALUREG_16_S3_I1_TO_OP_A 				 147
`define ALUREG_16_S3_R2_TO_OP_A 				 148
`define ALUREG_16_S3_I2_TO_OP_A 				 149
`define ALUREG_16_S3_R3_TO_OP_A 				 150
`define ALUREG_16_S3_I3_TO_OP_A 				 151
`define ALUREG_16_S3_R4_TO_OP_A 				 152
`define ALUREG_16_S3_I4_TO_OP_A 				 153
`define ALUREG_16_S3_R5_TO_OP_A 				 154
`define ALUREG_16_S3_I5_TO_OP_A 				 155
`define ALUREG_16_S3_R6_TO_OP_A 				 156
`define ALUREG_16_S3_I6_TO_OP_A 				 157
`define ALUREG_16_S3_R7_TO_OP_A 				 158
`define ALUREG_16_S3_I7_TO_OP_A 				 159
`define ALUREG_16_S3_R8_TO_OP_B 				 160
`define ALUREG_16_S3_I8_TO_OP_B 				 161
`define ALUREG_16_S3_R9_TO_OP_B 				 162
`define ALUREG_16_S3_I9_TO_OP_B 				 163
`define ALUREG_16_S3_R10_TO_OP_B 				 164
`define ALUREG_16_S3_I10_TO_OP_B 				 165
`define ALUREG_16_S3_R11_TO_OP_B 				 166
`define ALUREG_16_S3_I11_TO_OP_B 				 167
`define ALUREG_16_S3_R12_TO_OP_B 				 168
`define ALUREG_16_S3_I12_TO_OP_B 				 169
`define ALUREG_16_S3_R13_TO_OP_B 				 170
`define ALUREG_16_S3_I13_TO_OP_B 				 171
`define ALUREG_16_S3_R14_TO_OP_B 				 172
`define ALUREG_16_S3_I14_TO_OP_B 				 173
`define ALUREG_16_S3_R15_TO_OP_B 				 174
`define ALUREG_16_S3_I15_TO_OP_B 				 175

`define WBF_16_S1_R0 							 0
`define WBF_16_S1_I0 							 1
`define WBF_16_S1_R1 							 2
`define WBF_16_S1_I1 							 3
`define WBF_16_S1_R2 							 4
`define WBF_16_S1_I2 							     5
`define WBF_16_S1_R3 							     6
`define WBF_16_S1_I3 							     7
`define WBF_16_S1_R4 							     8
`define WBF_16_S1_I4 							     9
`define WBF_16_S1_R5 							     10
`define WBF_16_S1_I5 							     11
`define WBF_16_S1_R6 							     12
`define WBF_16_S1_I6 							     13
`define WBF_16_S1_R7 							     14
`define WBF_16_S1_I7 							     15
`define WBF_16_S1_R8 							     16
`define WBF_16_S1_I8 							     17
`define WBF_16_S1_R9 							     18
`define WBF_16_S1_I9 							     19
`define WBF_16_S1_R10 							     20
`define WBF_16_S1_I10							     21
`define WBF_16_S1_R11							     22
`define WBF_16_S1_I11							     23
`define WBF_16_S1_R12							     24
`define WBF_16_S1_I12							     25
`define WBF_16_S1_R13						         26
`define WBF_16_S1_I13							     27
`define WBF_16_S1_R14							     28
`define WBF_16_S1_I14							     29
`define WBF_16_S1_R15							     30
`define WBF_16_S1_I15							     31

`define WBF_16_S2_R0 							     32
`define WBF_16_S2_I0 							     33
`define WBF_16_S2_R1 							     34
`define WBF_16_S2_I1 							     35
`define WBF_16_S2_R2 							     36
`define WBF_16_S2_I2 							     37
`define WBF_16_S2_R3 							     38
`define WBF_16_S2_I3 							     39
`define WBF_16_S2_R4 							     40
`define WBF_16_S2_I4 							     41
`define WBF_16_S2_R5 							     42
`define WBF_16_S2_I5 							     43
`define WBF_16_S2_R6 							     44
`define WBF_16_S2_I6 							     45
`define WBF_16_S2_R7 							     46
`define WBF_16_S2_I7 							     47
`define WBF_16_S2_R8 							     48
`define WBF_16_S2_I8 							     49
`define WBF_16_S2_R9 							     50
`define WBF_16_S2_I9 							     51
`define WBF_16_S2_R10 							     52
`define WBF_16_S2_I10							     53
`define WBF_16_S2_R11 							     54
`define WBF_16_S2_I11 							     55
`define WBF_16_S2_R12 							     56
`define WBF_16_S2_I12 							     57
`define WBF_16_S2_R13 							     58
`define WBF_16_S2_I13 							     59
`define WBF_16_S2_R14 							     60
`define WBF_16_S2_I14 							     61
`define WBF_16_S2_R15 							     62
`define WBF_16_S2_I15 							     63

`define WBF_16_S3_R0 							     64
`define WBF_16_S3_I0 							     65
`define WBF_16_S3_R1 							     66
`define WBF_16_S3_I1 							     67
`define WBF_16_S3_R2 							     68
`define WBF_16_S3_I2 							     69
`define WBF_16_S3_R3 							     70
`define WBF_16_S3_I3 							     71
`define WBF_16_S3_R4 							     72
`define WBF_16_S3_I4 							     73
`define WBF_16_S3_R5 							     74
`define WBF_16_S3_I5 							     75
`define WBF_16_S3_R6 							     76
`define WBF_16_S3_I6 							     77
`define WBF_16_S3_R7 							     78
`define WBF_16_S3_I7 							     79
`define WBF_16_S3_R8 							     80
`define WBF_16_S3_I8 							     81
`define WBF_16_S3_R9 							     82
`define WBF_16_S3_I9 							     83
`define WBF_16_S3_R10 							     84
`define WBF_16_S3_I10							     85
`define WBF_16_S3_R11 							     86
`define WBF_16_S3_I11 							     87
`define WBF_16_S3_R12 							     88
`define WBF_16_S3_I12 							     89
`define WBF_16_S3_R13 							     90
`define WBF_16_S3_I13 							     91
`define WBF_16_S3_R14 							     92
`define WBF_16_S3_I14 							     93
`define WBF_16_S3_R15 							     94
`define WBF_16_S3_I15 							     95

`define WBF_16_T_R0	 							     96
`define WBF_16_T_I0	 								 97
`define WBF_16_T_R1	 								 98
`define WBF_16_T_I1	 							 	 99
`define WBF_16_T_R2	 							 	 100
`define WBF_16_T_I2	 							     101
`define WBF_16_T_R3	 							  	 102
`define WBF_16_T_I3	 							     103
`define WBF_16_T_R4	 							 	 104
`define WBF_16_T_I4	 							 	 105
`define WBF_16_T_R5	 							 	 106
`define WBF_16_T_I5	 							 	 107
`define WBF_16_T_R6	 							     108
`define WBF_16_T_I6	 								 109
`define WBF_16_T_R7	 								 110
`define WBF_16_T_I7	 							 	 111
`define WBF_16_T_R8	 							 	 112
`define WBF_16_T_I8	 							     113
`define WBF_16_T_R9	 							  	 114
`define WBF_16_T_I9	 							     115
`define WBF_16_T_R10 							 	 116
`define WBF_16_T_I10 							 	 117
`define WBF_16_T_R11 							 	 118
`define WBF_16_T_I11 							 	 119

`define WBF_16_T2_R1	 						     120
`define WBF_16_T2_I1	 							 121
`define WBF_16_T_R12	 							 122
`define WBF_16_T_I12	 						 	 123
`define WBF_16_T_R13 							 	 124
`define WBF_16_T_I13 							 	 125
`define WBF_16_T_R14 							 	 126
`define WBF_16_T_I14 							 	 127
`define WBF_16_T_R15	 							 128
`define WBF_16_T_I15	 						 	 129
`define WBF_16_T_R16 							 	 130
`define WBF_16_T_I16 							 	 131
`define WBF_16_T_R17 							 	 132
`define WBF_16_T_I17 							 	 133

`define WBF_16_X_R0								 	 134
`define WBF_16_X_I0								 	 135
`define WBF_16_X_R1								 	 136
`define WBF_16_X_I1								 	 137
`define WBF_16_X_R2								 	 138
`define WBF_16_X_I2								 	 139
`define WBF_16_X_R3								 	 140
`define WBF_16_X_I3								 	 141
`define WBF_16_X_R4								 	 142
`define WBF_16_X_I4								 	 143
`define WBF_16_X_R5								 	 144
`define WBF_16_X_I5								 	 145
`define WBF_16_X_R6								 	 146
`define WBF_16_X_I6								 	 147
`define WBF_16_X_R7								 	 148
`define WBF_16_X_I7								 	 149
`define WBF_16_X_R8								 	 150
`define WBF_16_X_I8								 	 151
`define WBF_16_X_R9								 	 152
`define WBF_16_X_I9								 	 153
`define WBF_16_X_R10							 	 154
`define WBF_16_X_I10							 	 155
`define WBF_16_X_R11							 	 156
`define WBF_16_X_I11							 	 157
`define WBF_16_X_R12							 	 158
`define WBF_16_X_I12							 	 159
`define WBF_16_X_R13							 	 160
`define WBF_16_X_I13							 	 161
`define WBF_16_X_R14							 	 162
`define WBF_16_X_I14							 	 163
`define WBF_16_X_R15							 	 164
`define WBF_16_X_I15							 	 165





`define W_16_1_REEL								   16'b00000000_11101100  //  0.921875
`define W_16_1_IMAG								 -(16'b00000000_01100010) // -j*0.3828125

`define W_16_2_REEL								   16'b00000000_10110101  //  0.70703125
`define W_16_2_IMAG								 -(16'b00000000_10110101) // -j*0.70703125

`define W_16_3_REEL								   16'b00000000_01100010  //  0.3828125
`define W_16_3_IMAG								 -(16'b00000000_11101100) // -j* 0.921875

`define W_16_5_REEL								 -(16'b00000000_01100010) //  0.3828125
`define W_16_5_IMAG								 -(16'b00000000_11101100) // -j* 0.921875

`define W_16_6_REEL								 -(16'b00000000_10110101) // -0.70703125
`define W_16_6_IMAG								 -(16'b00000000_10110101) // -j*0.70703125

`define W_16_7_REEL								 -(16'b00000000_11101100) // -0.921875
`define W_16_7_IMAG								 -(16'b00000000_01100010) // -j*0.3828125


`endif






