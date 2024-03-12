`include "constants.vh"

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
							input [15:0] x_16_R_i, 
							input [15:0] x_16_I_i,
							input [15:0] x_17_R_i, 	
							input [15:0] x_17_I_i,
							input [15:0] x_18_R_i, 
							input [15:0] x_18_I_i,
							input [15:0] x_19_R_i, 
							input [15:0] x_19_I_i,
							input [15:0] x_20_R_i, 
							input [15:0] x_20_I_i,
							input [15:0] x_21_R_i, 
							input [15:0] x_21_I_i,
							input [15:0] x_22_R_i, 
							input [15:0] x_22_I_i,
							input [15:0] x_23_R_i, 
							input [15:0] x_23_I_i,
							input [15:0] x_24_R_i, 
							input [15:0] x_24_I_i,
							input [15:0] x_25_R_i, 
							input [15:0] x_25_I_i,
							input [15:0] x_26_R_i, 
							input [15:0] x_26_I_i,
							input [15:0] x_27_R_i, 
							input [15:0] x_27_I_i,
							input [15:0] x_28_R_i, 
							input [15:0] x_28_I_i,
							input [15:0] x_29_R_i, 
							input [15:0] x_29_I_i,
							input [15:0] x_30_R_i, 
							input [15:0] x_30_I_i,
							input [15:0] x_31_R_i, 
							input [15:0] x_31_I_i;


							input [150:0] alu_reg_i,
							input [4:0] alu_mode_i,
							input [127:0] wr_enable_i,

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
							output [15:0] X_15_I_o,
							output [15:0] X_16_R_o, 
							output [15:0] X_16_I_o,
							output [15:0] X_17_R_o, 
							output [15:0] X_17_I_o,
							output [15:0] X_18_R_o, 
							output [15:0] X_18_I_o,
							output [15:0] X_19_R_o, 
							output [15:0] X_19_I_o,
							output [15:0] X_20_R_o, 
							output [15:0] X_20_I_o,
							output [15:0] X_21_R_o, 
							output [15:0] X_21_I_o,
							output [15:0] X_22_R_o, 
							output [15:0] X_22_I_o,
							output [15:0] X_23_R_o, 
							output [15:0] X_23_I_o,
							output [15:0] X_24_R_o, 
							output [15:0] X_24_I_o,
							output [15:0] X_25_R_o, 
							output [15:0] X_25_I_o,
							output [15:0] X_26_R_o, 
							output [15:0] X_26_I_o,
							output [15:0] X_27_R_o, 
							output [15:0] X_27_I_o,
							output [15:0] X_28_R_o, 
							output [15:0] X_28_I_o,
							output [15:0] X_29_R_o, 
							output [15:0] X_29_I_o,
							output [15:0] X_30_R_o, 
							output [15:0] X_30_I_o,
							output [15:0] X_31_R_o, 
							output [15:0] X_31_I_o;

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
		   X_16_R_r, X_16_I_r, X_16_R_p, X_16_I_p,
           X_17_R_r, X_17_I_r, X_17_R_p, X_17_I_p,
           X_18_R_r, X_18_I_r, X_18_R_p, X_18_I_p,
           X_19_R_r, X_19_I_r, X_19_R_p, X_19_I_p,
           X_20_R_r, X_20_I_r, X_20_R_p, X_20_I_p,
           X_21_R_r, X_21_I_r, X_21_R_p, X_21_I_p,
           X_22_R_r, X_22_I_r, X_22_R_p, X_22_I_p,
           X_23_R_r, X_23_I_r, X_23_R_p, X_23_I_p,
           X_24_R_r, X_24_I_r, X_24_R_p, X_24_I_p,
           X_25_R_r, X_25_I_r, X_25_R_p, X_25_I_p,
           X_26_R_r, X_26_I_r, X_26_R_p, X_26_I_p,
           X_27_R_r, X_27_I_r, X_27_R_p, X_27_I_p,
           X_28_R_r, X_28_I_r, X_28_R_p, X_28_I_p,
           X_29_R_r, X_29_I_r, X_29_R_p, X_29_I_p,
           X_30_R_r, X_30_I_r, X_30_R_p, X_30_I_p,
           X_31_R_r, X_31_I_r, X_31_R_p, X_31_I_p;



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
		   S1_R16_r, S1_I16_r, S1_R16_p, S1_I16_p,
           S1_R17_r, S1_I17_r, S1_R17_p, S1_I17_p,
           S1_R18_r, S1_I18_r, S1_R18_p, S1_I18_p,
           S1_R19_r, S1_I19_r, S1_R19_p, S1_I19_p,
           S1_R20_r, S1_I20_r, S1_R20_p, S1_I20_p,
           S1_R21_r, S1_I21_r, S1_R21_p, S1_I21_p,
           S1_R22_r, S1_I22_r, S1_R22_p, S1_I22_p,
           S1_R23_r, S1_I23_r, S1_R23_p, S1_I23_p,
           S1_R24_r, S1_I24_r, S1_R24_p, S1_I24_p,
           S1_R25_r, S1_I25_r, S1_R25_p, S1_I25_p,
           S1_R26_r, S1_I26_r, S1_R26_p, S1_I26_p,
           S1_R27_r, S1_I27_r, S1_R27_p, S1_I27_p,
           S1_R28_r, S1_I28_r, S1_R28_p, S1_I28_p,
           S1_R29_r, S1_I29_r, S1_R29_p, S1_I29_p,
           S1_R30_r, S1_I30_r, S1_R30_p, S1_I30_p,
           S1_R31_r, S1_I31_r, S1_R31_p, S1_I31_p;


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
		   S2_R16_r, S2_I16_r, S2_R16_p, S2_I16_p,
           S2_R17_r, S2_I17_r, S2_R17_p, S2_I17_p,
           S2_R18_r, S2_I18_r, S2_R18_p, S2_I18_p,
           S2_R19_r, S2_I19_r, S2_R19_p, S2_I19_p,
           S2_R20_r, S2_I20_r, S2_R20_p, S2_I20_p,
           S2_R21_r, S2_I21_r, S2_R21_p, S2_I21_p,
           S2_R22_r, S2_I22_r, S2_R22_p, S2_I22_p,
           S2_R23_r, S2_I23_r, S2_R23_p, S2_I23_p,
           S2_R24_r, S2_I24_r, S2_R24_p, S2_I24_p,
           S2_R25_r, S2_I25_r, S2_R25_p, S2_I25_p,
           S2_R26_r, S2_I26_r, S2_R26_p, S2_I26_p,
           S2_R27_r, S2_I27_r, S2_R27_p, S2_I27_p,
           S2_R28_r, S2_I28_r, S2_R28_p, S2_I28_p,
           S2_R29_r, S2_I29_r, S2_R29_p, S2_I29_p,
           S2_R30_r, S2_I30_r, S2_R30_p, S2_I30_p,
           S2_R31_r, S2_I31_r, S2_R31_p, S2_I31_p;

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
		   S3_R16_r, S3_I16_r, S3_R16_p, S3_I16_p,
           S3_R17_r, S3_I17_r, S3_R17_p, S3_I17_p,
           S3_R18_r, S3_I18_r, S3_R18_p, S3_I18_p,
           S3_R19_r, S3_I19_r, S3_R19_p, S3_I19_p,
           S3_R20_r, S3_I20_r, S3_R20_p, S3_I20_p,
           S3_R21_r, S3_I21_r, S3_R21_p, S3_I21_p,
           S3_R22_r, S3_I22_r, S3_R22_p, S3_I22_p,
           S3_R23_r, S3_I23_r, S3_R23_p, S3_I23_p,
           S3_R24_r, S3_I24_r, S3_R24_p, S3_I24_p,
           S3_R25_r, S3_I25_r, S3_R25_p, S3_I25_p,
           S3_R26_r, S3_I26_r, S3_R26_p, S3_I26_p,
           S3_R27_r, S3_I27_r, S3_R27_p, S3_I27_p,
           S3_R28_r, S3_I28_r, S3_R28_p, S3_I28_p,
           S3_R29_r, S3_I29_r, S3_R29_p, S3_I29_p,
           S3_R30_r, S3_I30_r, S3_R30_p, S3_I30_p,
           S3_R31_r, S3_I31_r, S3_R31_p, S3_I31_p;

		   S4_R0_r,  S4_I0_r,  S4_R0_p,  S4_I0_p,
		   S4_R1_r,  S4_I1_r,  S4_R1_p,  S4_I1_p,
		   S4_R2_r,  S4_I2_r,  S4_R2_p,  S4_I2_p,
		   S4_R3_r,  S4_I3_r,  S4_R3_p,  S4_I3_p,
		   S4_R4_r,  S4_I4_r,  S4_R4_p,  S4_I4_p,
		   S4_R5_r,  S4_I5_r,  S4_R5_p,  S4_I5_p,
		   S4_R6_r,  S4_I6_r,  S4_R6_p,  S4_I6_p,
		   S4_R7_r,  S4_I7_r,  S4_R7_p,  S4_I7_p,
		   S4_R8_r,  S4_I8_r,  S4_R8_p,  S4_I8_p,
		   S4_R9_r,  S4_I9_r,  S4_R9_p,  S4_I9_p,
		   S4_R10_r, S4_I10_r, S4_R10_p, S4_I10_p,
		   S4_R11_r, S4_I11_r, S4_R11_p, S4_I11_p,
		   S4_R12_r, S4_I12_r, S4_R12_p, S4_I12_p,
		   S4_R13_r, S4_I13_r, S4_R13_p, S4_I13_p,
		   S4_R14_r, S4_I14_r, S4_R14_p, S4_I14_p,
		   S4_R15_r, S4_I15_r, S4_R15_p, S4_I15_p;
		   S4_R16_r, S4_I16_r, S4_R16_p, S4_I16_p,
           S4_R17_r, S4_I17_r, S4_R17_p, S4_I17_p,
           S4_R18_r, S4_I18_r, S4_R18_p, S4_I18_p,
           S4_R19_r, S4_I19_r, S4_R19_p, S4_I19_p,
           S4_R20_r, S4_I20_r, S4_R20_p, S4_I20_p,
           S4_R21_r, S4_I21_r, S4_R21_p, S4_I21_p,
           S4_R22_r, S4_I22_r, S4_R22_p, S4_I22_p,
           S4_R23_r, S4_I23_r, S4_R23_p, S4_I23_p,
           S4_R24_r, S4_I24_r, S4_R24_p, S4_I24_p,
           S4_R25_r, S4_I25_r, S4_R25_p, S4_I25_p,
           S4_R26_r, S4_I26_r, S4_R26_p, S4_I26_p,
           S4_R27_r, S4_I27_r, S4_R27_p, S4_I27_p,
           S4_R28_r, S4_I28_r, S4_R28_p, S4_I28_p,
           S4_R29_r, S4_I29_r, S4_R29_p, S4_I29_p,
           S4_R30_r, S4_I30_r, S4_R30_p, S4_I30_p,
           S4_R31_r, S4_I31_r, S4_R31_p, S4_I31_p;

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
		   x_16_R_r,   x_16_I_r,  x_16_R_p,   x_16_I_p,
           x_17_R_r,   x_17_I_r,  x_17_R_p,   x_17_I_p,
           x_18_R_r,   x_18_I_r,  x_18_R_p,   x_18_I_p,
           x_19_R_r,   x_19_I_r,  x_19_R_p,   x_19_I_p,
           x_20_R_r,   x_20_I_r,  x_20_R_p,   x_20_I_p,
           x_21_R_r,   x_21_I_r,  x_21_R_p,   x_21_I_p,
           x_22_R_r,   x_22_I_r,  x_22_R_p,   x_22_I_p,
           x_23_R_r,   x_23_I_r,  x_23_R_p,   x_23_I_p,
           x_24_R_r,   x_24_I_r,  x_24_R_p,   x_24_I_p,
           x_25_R_r,   x_25_I_r,  x_25_R_p,   x_25_I_p,
           x_26_R_r,   x_26_I_r,  x_26_R_p,   x_26_I_p,
           x_27_R_r,   x_27_I_r,  x_27_R_p,   x_27_I_p,
           x_28_R_r,   x_28_I_r,  x_28_R_p,   x_28_I_p,
           x_29_R_r,   x_29_I_r,  x_29_R_p,   x_29_I_p,
           x_30_R_r,   x_30_I_r,  x_30_R_p,   x_30_I_p,
           x_31_R_r,   x_31_I_r,  x_31_R_p,   x_31_I_p;


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
		   x16_R, x16_I,
           x17_R, x17_I,
           x18_R, x18_I,
           x19_R, x19_I,
           x20_R, x20_I,
           x21_R, x21_I,
           x22_R, x22_I,
           x23_R, x23_I,
           x24_R, x24_I,
           x25_R, x25_I,
           x26_R, x26_I,
           x27_R, x27_I,
           x28_R, x28_I,
           x29_R, x29_I,
           x30_R, x30_I,
           x31_R, x31_I;



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
 		   	 T_R11_r, T_I11_r, T_R11_p, T_I11_p;
			 T_R12_r, T_I12_r, T_R12_p, T_I12_p,
			 T_R13_r, T_I13_r, T_R13_p, T_I13_p,
			 T_R14_r, T_I14_r, T_R14_p, T_I14_p,
			 T_R15_r, T_I15_r, T_R15_p, T_I15_p;
			 T_R16_r, T_I16_r, T_R16_p, T_I16_p,
			 T_R17_r, T_I17_r, T_R17_p, T_I17_p,
			 T_R18_r, T_I18_r, T_R18_p, T_I18_p,
			 T_R19_r, T_I19_r, T_R19_p, T_I19_p,
			 T_R20_r, T_I20_r, T_R20_p, T_I20_p,
			 T_R21_r, T_I21_r, T_R21_p, T_I21_p,
			 T_R22_r, T_I22_r, T_R22_p, T_I22_p,
			 T_R23_r, T_I23_r, T_R23_p, T_I23_p;



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
		X_16_R_r 		<= 16'd0;
		X_16_I_r 		<= 16'd0;
		X_17_R_r 		<= 16'd0;
		X_17_I_r 		<= 16'd0;
		X_18_R_r 		<= 16'd0;
		X_18_I_r 		<= 16'd0;
		X_19_R_r 		<= 16'd0;
		X_19_I_r 		<= 16'd0;
		X_20_R_r 		<= 16'd0;
		X_20_I_r 		<= 16'd0;		
		X_21_R_r 		<= 16'd0;
		X_21_I_r 		<= 16'd0;
		X_22_R_r 		<= 16'd0;
		X_22_I_r 		<= 16'd0;
		X_23_R_r 		<= 16'd0;
		X_23_I_r 		<= 16'd0;
		X_24_R_r 		<= 16'd0;
		X_24_I_r 		<= 16'd0;
		X_25_R_r 		<= 16'd0;
		X_25_I_r 		<= 16'd0;
		X_26_R_r 		<= 16'd0;
		X_26_I_r 		<= 16'd0;
		X_27_R_r 		<= 16'd0;
		X_27_I_r 		<= 16'd0;		
		X_28_R_r 		<= 16'd0;
		X_28_I_r 		<= 16'd0;
		X_29_R_r 		<= 16'd0;
		X_29_I_r 		<= 16'd0;
		X_30_R_r 		<= 16'd0;
		X_30_I_r 		<= 16'd0;
		X_31_R_r 		<= 16'd0;
		X_31_I_r 		<= 16'd0;


		X_0_R_p 		<= 16'd0;
		X_0_I_p 		<= 16'd0;
		X_1_R_p 		<= 16'd0;
		X_1_I_p 		<= 16'd0;
		X_2_R_p 		<= 16'd0;
		X_2_I_p 		<= 16'd0;
		X_3_R_p 		<= 16'd0;
		X_3_I_p 		<= 16'd0;
		X_4_R_p 		<= 16'd0;
		X_4_I_p 		<= 16'd0;		
		X_5_R_p 		<= 16'd0;
		X_5_I_p 		<= 16'd0;
		X_6_R_p 		<= 16'd0;
		X_6_I_p 		<= 16'd0;
		X_7_R_p 		<= 16'd0;
		X_7_I_p 		<= 16'd0;
		X_8_R_p 		<= 16'd0;
		X_8_I_p 		<= 16'd0;
		X_9_R_p 		<= 16'd0;
		X_9_I_p 		<= 16'd0;
		X_10_R_p 		<= 16'd0;
		X_10_I_p 		<= 16'd0;
		X_11_R_p 		<= 16'd0;
		X_11_I_p 		<= 16'd0;
		X_12_R_p 		<= 16'd0;
		X_12_I_p 		<= 16'd0;		
		X_13_R_p 		<= 16'd0;
		X_13_I_p 		<= 16'd0;
		X_14_R_p 		<= 16'd0;
		X_14_I_p 		<= 16'd0;
		X_15_R_p 		<= 16'd0;
		X_15_I_p 		<= 16'd0;
		X_16_R_p 		<= 16'd0;
		X_16_I_p 		<= 16'd0;
		X_17_R_p 		<= 16'd0;
		X_17_I_p 		<= 16'd0;
		X_18_R_p 		<= 16'd0;
		X_18_I_p 		<= 16'd0;
		X_19_R_p 		<= 16'd0;
		X_19_I_p 		<= 16'd0;
		X_20_R_p 		<= 16'd0;
		X_20_I_p 		<= 16'd0;		
		X_21_R_p 		<= 16'd0;
		X_21_I_p 		<= 16'd0;
		X_22_R_p 		<= 16'd0;
		X_22_I_p 		<= 16'd0;
		X_23_R_p 		<= 16'd0;
		X_23_I_p 		<= 16'd0;
		X_24_R_p 		<= 16'd0;
		X_24_I_p 		<= 16'd0;
		X_25_R_p 		<= 16'd0;
		X_25_I_p 		<= 16'd0;
		X_26_R_p 		<= 16'd0;
		X_26_I_p 		<= 16'd0;
		X_27_R_p 		<= 16'd0;
		X_27_I_p 		<= 16'd0;		
		X_28_R_p 		<= 16'd0;
		X_28_I_p 		<= 16'd0;
		X_29_R_p 		<= 16'd0;
		X_29_I_p 		<= 16'd0;
		X_30_R_p 		<= 16'd0;
		X_30_I_p 		<= 16'd0;
		X_31_R_p 		<= 16'd0;
		X_31_I_p 		<= 16'd0;


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
		S1_R16_r 		<= 16'd0;
		S1_I16_r  		<= 16'd0;
		S1_R17_r 		<= 16'd0;
		S1_I17_r  		<= 16'd0;
		S1_R18_r 		<= 16'd0;
		S1_I18_r  		<= 16'd0;
		S1_R19_r 		<= 16'd0;
		S1_I19_r  		<= 16'd0;
		S1_R20_r 		<= 16'd0;
		S1_I20_r  		<= 16'd0;
		S1_R21_r 		<= 16'd0;
		S1_I21_r  		<= 16'd0;
		S1_R22_r 		<= 16'd0;
		S1_I22_r  		<= 16'd0;
		S1_R23_r 		<= 16'd0;
		S1_I23_r  		<= 16'd0;
		S1_R24_r 		<= 16'd0;
		S1_I24_r  		<= 16'd0;
		S1_R25_r 		<= 16'd0;
		S1_I25_r  		<= 16'd0;
		S1_R26_r 		<= 16'd0;
		S1_I26_r  		<= 16'd0;
		S1_R27_r 		<= 16'd0;
		S1_I27_r  		<= 16'd0;
		S1_R28_r 		<= 16'd0;
		S1_I28_r  		<= 16'd0;
		S1_R29_r 		<= 16'd0;
		S1_I29_r  		<= 16'd0;
		S1_R30_r 		<= 16'd0;
		S1_I30_r  		<= 16'd0;
		S1_R31_r 		<= 16'd0;
		S1_I31_r  		<= 16'd0;


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
		S1_R16_p 		<= 16'd0;
		S1_I16_p  		<= 16'd0;
		S1_R17_p 		<= 16'd0;
		S1_I17_p  		<= 16'd0;
		S1_R18_p 		<= 16'd0;
		S1_I18_p  		<= 16'd0;
		S1_R19_p 		<= 16'd0;
		S1_I19_p  		<= 16'd0;
		S1_R20_p 		<= 16'd0;
		S1_I20_p  		<= 16'd0;
		S1_R21_p 		<= 16'd0;
		S1_I21_p  		<= 16'd0;
		S1_R22_p 		<= 16'd0;
		S1_I22_p  		<= 16'd0;
		S1_R23_p 		<= 16'd0;
		S1_I23_p  		<= 16'd0;
		S1_R24_p 		<= 16'd0;
		S1_I24_p  		<= 16'd0;
		S1_R25_p 		<= 16'd0;
		S1_I25_p  		<= 16'd0;
		S1_R26_p 		<= 16'd0;
		S1_I26_p  		<= 16'd0;
		S1_R27_p 		<= 16'd0;
		S1_I27_p  		<= 16'd0;
		S1_R28_p 		<= 16'd0;
		S1_I28_p  		<= 16'd0;
		S1_R29_p 		<= 16'd0;
		S1_I29_p  		<= 16'd0;
		S1_R30_p 		<= 16'd0;
		S1_I30_p  		<= 16'd0;
		S1_R31_p 		<= 16'd0;
		S1_I31_p  		<= 16'd0;		

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
		S2_R16_r 		<= 16'd0;
		S2_I16_r  		<= 16'd0;
		S2_R17_r 		<= 16'd0;
		S2_I17_r  		<= 16'd0;
		S2_R18_r 		<= 16'd0;
		S2_I18_r  		<= 16'd0;
		S2_R19_r 		<= 16'd0;
		S2_I19_r  		<= 16'd0;
		S2_R20_r 		<= 16'd0;
		S2_I20_r  		<= 16'd0;
		S2_R21_r 		<= 16'd0;
		S2_I21_r  		<= 16'd0;
		S2_R22_r 		<= 16'd0;
		S2_I22_r  		<= 16'd0;
		S2_R23_r 		<= 16'd0;
		S2_I23_r  		<= 16'd0;
		S2_R24_r 		<= 16'd0;
		S2_I24_r  		<= 16'd0;
		S2_R25_r 		<= 16'd0;
		S2_I25_r  		<= 16'd0;
		S2_R26_r 		<= 16'd0;
		S2_I26_r  		<= 16'd0;
		S2_R27_r 		<= 16'd0;
		S2_I27_r  		<= 16'd0;
		S2_R28_r 		<= 16'd0;
		S2_I28_r  		<= 16'd0;
		S2_R29_r 		<= 16'd0;
		S2_I29_r  		<= 16'd0;
		S2_R30_r 		<= 16'd0;
		S2_I30_r  		<= 16'd0;
		S2_R31_r 		<= 16'd0;
		S2_I31_r  		<= 16'd0;

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
		S2_R16_p 		<= 16'd0;
		S2_I16_p  		<= 16'd0;
		S2_R17_p 		<= 16'd0;
		S2_I17_p  		<= 16'd0;
		S2_R18_p 		<= 16'd0;
		S2_I18_p  		<= 16'd0;
		S2_R19_p 		<= 16'd0;
		S2_I19_p  		<= 16'd0;
		S2_R20_p 		<= 16'd0;
		S2_I20_p  		<= 16'd0;
		S2_R21_p 		<= 16'd0;
		S2_I21_p  		<= 16'd0;
		S2_R22_p 		<= 16'd0;
		S2_I22_p  		<= 16'd0;
		S2_R23_p 		<= 16'd0;
		S2_I23_p  		<= 16'd0;
		S2_R24_p 		<= 16'd0;
		S2_I24_p  		<= 16'd0;
		S2_R25_p 		<= 16'd0;
		S2_I25_p  		<= 16'd0;
		S2_R26_p 		<= 16'd0;
		S2_I26_p  		<= 16'd0;
		S2_R27_p 		<= 16'd0;
		S2_I27_p  		<= 16'd0;
		S2_R28_p 		<= 16'd0;
		S2_I28_p  		<= 16'd0;
		S2_R29_p 		<= 16'd0;
		S2_I29_p  		<= 16'd0;
		S2_R30_p 		<= 16'd0;
		S2_I30_p  		<= 16'd0;
		S2_R31_p 		<= 16'd0;
		S2_I31_p  		<= 16'd0;

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
		S3_R16_p 		<= 16'd0;
		S3_I16_p  		<= 16'd0;
		S3_R17_p 		<= 16'd0;
		S3_I17_p  		<= 16'd0;
		S3_R18_p 		<= 16'd0;
		S3_I18_p  		<= 16'd0;
		S3_R19_p 		<= 16'd0;
		S3_I19_p  		<= 16'd0;
		S3_R20_p 		<= 16'd0;
		S3_I20_p  		<= 16'd0;
		S3_R21_p 		<= 16'd0;
		S3_I21_p  		<= 16'd0;
		S3_R22_p 		<= 16'd0;
		S3_I22_p  		<= 16'd0;
		S3_R23_p 		<= 16'd0;
		S3_I23_p  		<= 16'd0;
		S3_R24_p 		<= 16'd0;
		S3_I24_p  		<= 16'd0;
		S3_R25_p 		<= 16'd0;
		S3_I25_p  		<= 16'd0;
		S3_R26_p 		<= 16'd0;
		S3_I26_p  		<= 16'd0;
		S3_R27_p 		<= 16'd0;
		S3_I27_p  		<= 16'd0;
		S3_R28_p 		<= 16'd0;
		S3_I28_p  		<= 16'd0;
		S3_R29_p 		<= 16'd0;
		S3_I29_p  		<= 16'd0;
		S3_R30_p 		<= 16'd0;
		S3_I30_p  		<= 16'd0;
		S3_R31_p 		<= 16'd0;
		S3_I31_p  		<= 16'd0;

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
		S3_R16_r 		<= 16'd0;
		S3_I16_r  		<= 16'd0;
		S3_R17_r 		<= 16'd0;
		S3_I17_r  		<= 16'd0;
		S3_R18_r 		<= 16'd0;
		S3_I18_r  		<= 16'd0;
		S3_R19_r 		<= 16'd0;
		S3_I19_r  		<= 16'd0;
		S3_R20_r 		<= 16'd0;
		S3_I20_r  		<= 16'd0;
		S3_R21_r 		<= 16'd0;
		S3_I21_r  		<= 16'd0;
		S3_R22_r 		<= 16'd0;
		S3_I22_r  		<= 16'd0;
		S3_R23_r 		<= 16'd0;
		S3_I23_r  		<= 16'd0;
		S3_R24_r 		<= 16'd0;
		S3_I24_r  		<= 16'd0;
		S3_R25_r 		<= 16'd0;
		S3_I25_r  		<= 16'd0;
		S3_R26_r 		<= 16'd0;
		S3_I26_r  		<= 16'd0;
		S3_R27_r 		<= 16'd0;
		S3_I27_r  		<= 16'd0;
		S3_R28_r 		<= 16'd0;
		S3_I28_r  		<= 16'd0;
		S3_R29_r 		<= 16'd0;
		S3_I29_r  		<= 16'd0;
		S3_R30_r 		<= 16'd0;
		S3_I30_r  		<= 16'd0;
		S3_R31_r 		<= 16'd0;
		S3_I31_r  		<= 16'd0;
		
		S4_R0_p 		<= 16'd0;
		S4_I0_p	  		<= 16'd0;
		S4_R1_p 		<= 16'd0;
		S4_I1_p	  		<= 16'd0;
		S4_R2_p 		<= 16'd0;
		S4_I2_p	  		<= 16'd0;
		S4_R3_p 		<= 16'd0;
		S4_I3_p	  		<= 16'd0;
		S4_R4_p 		<= 16'd0;
		S4_I4_p	  		<= 16'd0;
		S4_R5_p 		<= 16'd0;
		S4_I5_p	  		<= 16'd0;
		S4_R6_p 		<= 16'd0;
		S4_I6_p	  		<= 16'd0;
		S4_R7_p 		<= 16'd0;
		S4_I7_p	  		<= 16'd0;
		S4_R8_p 		<= 16'd0;
		S4_I8_p	  		<= 16'd0;
		S4_R9_p 		<= 16'd0;
		S4_I9_p	  		<= 16'd0;
		S4_R10_p 		<= 16'd0;
		S4_I10_p	  	<= 16'd0;
		S4_R11_p 		<= 16'd0;
		S4_I11_p	  	<= 16'd0;
		S4_R12_p 		<= 16'd0;
		S4_I12_p	  	<= 16'd0;
		S4_R13_p 		<= 16'd0;
		S4_I13_p	  	<= 16'd0;
		S4_R14_p 		<= 16'd0;
		S4_I14_p	  	<= 16'd0;
		S4_R15_p 		<= 16'd0;
		S4_I15_p	  	<= 16'd0;
		S4_R16_p 		<= 16'd0;
		S4_I16_p  		<= 16'd0;
		S4_R17_p 		<= 16'd0;
		S4_I17_p  		<= 16'd0;
		S4_R18_p 		<= 16'd0;
		S4_I18_p  		<= 16'd0;
		S4_R19_p 		<= 16'd0;
		S4_I19_p  		<= 16'd0;
		S4_R20_p 		<= 16'd0;
		S4_I20_p  		<= 16'd0;
		S4_R21_p 		<= 16'd0;
		S4_I21_p  		<= 16'd0;
		S4_R22_p 		<= 16'd0;
		S4_I22_p  		<= 16'd0;
		S4_R23_p 		<= 16'd0;
		S4_I23_p  		<= 16'd0;
		S4_R24_p 		<= 16'd0;
		S4_I24_p  		<= 16'd0;
		S4_R25_p 		<= 16'd0;
		S4_I25_p  		<= 16'd0;
		S4_R26_p 		<= 16'd0;
		S4_I26_p  		<= 16'd0;
		S4_R27_p 		<= 16'd0;
		S4_I27_p  		<= 16'd0;
		S4_R28_p 		<= 16'd0;
		S4_I28_p  		<= 16'd0;
		S4_R29_p 		<= 16'd0;
		S4_I29_p  		<= 16'd0;
		S4_R30_p 		<= 16'd0;
		S4_I30_p  		<= 16'd0;
		S4_R31_p 		<= 16'd0;
		S4_I31_p  		<= 16'd0;

		S4_R0_r 		<= 16'd0;
		S4_I0_r	  		<= 16'd0;
		S4_R1_r 		<= 16'd0;
		S4_I1_r	  		<= 16'd0;
		S4_R2_r 		<= 16'd0;
		S4_I2_r	  		<= 16'd0;
		S4_R3_r 		<= 16'd0;
		S4_I3_r	  		<= 16'd0;
		S4_R4_r 		<= 16'd0;
		S4_I4_r	  		<= 16'd0;
		S4_R5_r 		<= 16'd0;
		S4_I5_r	  		<= 16'd0;
		S4_R6_r 		<= 16'd0;
		S4_I6_r	  		<= 16'd0;
		S4_R7_r 		<= 16'd0;
		S4_I7_r	  		<= 16'd0;
		S4_R8_r 		<= 16'd0;
		S4_I8_r	  		<= 16'd0;
		S4_R9_r 		<= 16'd0;
		S4_I9_r	  		<= 16'd0;
		S4_R10_r 		<= 16'd0;
		S4_I10_r	  	<= 16'd0;
		S4_R11_r 		<= 16'd0;
		S4_I11_r	  	<= 16'd0;
		S4_R12_r 		<= 16'd0;
		S4_I12_r	  	<= 16'd0;
		S4_R13_r 		<= 16'd0;
		S4_I13_r	  	<= 16'd0;
		S4_R14_r 		<= 16'd0;
		S4_I14_r	  	<= 16'd0;
		S4_R15_r 		<= 16'd0;
		S4_I15_r	  	<= 16'd0;
		S4_R16_r 		<= 16'd0;
		S4_I16_r  		<= 16'd0;
		S4_R17_r 		<= 16'd0;
		S4_I17_r  		<= 16'd0;
		S4_R18_r 		<= 16'd0;
		S4_I18_r  		<= 16'd0;
		S4_R19_r 		<= 16'd0;
		S4_I19_r  		<= 16'd0;
		S4_R20_r 		<= 16'd0;
		S4_I20_r  		<= 16'd0;
		S4_R21_r 		<= 16'd0;
		S4_I21_r  		<= 16'd0;
		S4_R22_r 		<= 16'd0;
		S4_I22_r  		<= 16'd0;
		S4_R23_r 		<= 16'd0;
		S4_I23_r  		<= 16'd0;
		S4_R24_r 		<= 16'd0;
		S4_I24_r  		<= 16'd0;
		S4_R25_r 		<= 16'd0;
		S4_I25_r  		<= 16'd0;
		S4_R26_r 		<= 16'd0;
		S4_I26_r  		<= 16'd0;
		S4_R27_r 		<= 16'd0;
		S4_I27_r  		<= 16'd0;
		S4_R28_r 		<= 16'd0;
		S4_I28_r  		<= 16'd0;
		S4_R29_r 		<= 16'd0;
		S4_I29_r  		<= 16'd0;
		S4_R30_r 		<= 16'd0;
		S4_I30_r  		<= 16'd0;
		S4_R31_r 		<= 16'd0;
		S4_I31_r  		<= 16'd0;

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
		x_16_R_r 		<= 16'd0;
		x_16_I_r 		<= 16'd0;
		x_17_R_r 		<= 16'd0;
		x_17_I_r 		<= 16'd0;
		x_18_R_r 		<= 16'd0;
		x_18_I_r 		<= 16'd0;
		x_19_R_r 		<= 16'd0;
		x_19_I_r 		<= 16'd0;
		x_20_R_r 		<= 16'd0;
		x_20_I_r 		<= 16'd0;		
		x_21_R_r 		<= 16'd0;
		x_21_I_r 		<= 16'd0;
		x_22_R_r 		<= 16'd0;
		x_22_I_r 		<= 16'd0;
		x_23_R_r 		<= 16'd0;
		x_23_I_r 		<= 16'd0;
		x_24_R_r 		<= 16'd0;
		x_24_I_r 		<= 16'd0;
		x_25_R_r 		<= 16'd0;
		x_25_I_r 		<= 16'd0;
		x_26_R_r 		<= 16'd0;
		x_26_I_r 		<= 16'd0;
		x_27_R_r 		<= 16'd0;
		x_27_I_r 		<= 16'd0;		
		x_28_R_r 		<= 16'd0;
		x_28_I_r 		<= 16'd0;
		x_29_R_r 		<= 16'd0;
		x_29_I_r 		<= 16'd0;
		x_30_R_r 		<= 16'd0;
		x_30_I_r 		<= 16'd0;
		x_31_R_r 		<= 16'd0;
		x_31_I_r 		<= 16'd0;

		x_0_R_p 		<= 16'd0;
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
		x_8_R_p 		<= 16'd0;
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
		x_16_R_p 		<= 16'd0;
		x_16_I_p 		<= 16'd0;
		x_17_R_p 		<= 16'd0;
		x_17_I_p 		<= 16'd0;
		x_18_R_p 		<= 16'd0;
		x_18_I_p 		<= 16'd0;
		x_19_R_p 		<= 16'd0;
		x_19_I_p 		<= 16'd0;
		x_20_R_p 		<= 16'd0;
		x_20_I_p 		<= 16'd0;		
		x_21_R_p 		<= 16'd0;
		x_21_I_p 		<= 16'd0;
		x_22_R_p 		<= 16'd0;
		x_22_I_p 		<= 16'd0;
		x_23_R_p 		<= 16'd0;
		x_23_I_p 		<= 16'd0;
		x_24_R_p 		<= 16'd0;
		x_24_I_p 		<= 16'd0;
		x_25_R_p 		<= 16'd0;
		x_25_I_p 		<= 16'd0;
		x_26_R_p 		<= 16'd0;
		x_26_I_p 		<= 16'd0;
		x_27_R_p 		<= 16'd0;
		x_27_I_p 		<= 16'd0;		
		x_28_R_p 		<= 16'd0;
		x_28_I_p 		<= 16'd0;
		x_29_R_p 		<= 16'd0;
		x_29_I_p 		<= 16'd0;
		x_30_R_p 		<= 16'd0;
		x_30_I_p 		<= 16'd0;
		x_31_R_p 		<= 16'd0;
		x_31_I_p 		<= 16'd0;


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
		T_R18_r  		<= 16'd0;
		T_I18_r  		<= 16'd0;
		T_R18_p 		<= 16'd0;
		T_I18_p  		<= 16'd0;
		T_R19_r  		<= 16'd0;
		T_I19_r  		<= 16'd0;
		T_R19_p 		<= 16'd0;
		T_I19_p  		<= 16'd0;
		T_R20_r  		<= 16'd0;
		T_I20_r  		<= 16'd0;
		T_R20_p 		<= 16'd0;
		T_I20_p  		<= 16'd0;
		T_R21_r  		<= 16'd0;
		T_I21_r  		<= 16'd0;
		T_R21_p 		<= 16'd0;
		T_I21_p  		<= 16'd0;
		T_R22_r  		<= 16'd0;
		T_I22_r  		<= 16'd0;
		T_R22_p 		<= 16'd0;
		T_I22_p  		<= 16'd0;
		T_R23_r  		<= 16'd0;
		T_I23_r  		<= 16'd0;
		T_R23_p 		<= 16'd0;
		T_I23_p  		<= 16'd0;



		start_r			<= 0;



	end
	
	/* TODO + Zeile 75-77 */
	
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

/*

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

	
	*/
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
	else if(alu_reg_i[`ALUREG_W_16_2_REEL_TO_OP_A]) begin
		alu_op_a = `W_16_2_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_16_2_IMAG_TO_OP_A]) begin
		alu_op_a = `W_16_2_IMAG;
	end
	else if(alu_reg_i[`ALUREG_W_16_6_REEL_TO_OP_A]) begin
		alu_op_a = `W_16_6_REEL;
	end
	else if(alu_reg_i[`ALUREG_W_16_6_IMAG_TO_OP_A]) begin
		alu_op_a = `W_16_6_IMAG;
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

	/*
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


	*/



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


	/*
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

	*/







	


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