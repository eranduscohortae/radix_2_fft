module fft_mux(


				input [15:0] fft8_X_0_R_i,
				input [15:0] fft8_X_0_I_i,
				input [15:0] fft8_X_1_R_i,
				input [15:0] fft8_X_1_I_i,
				input [15:0] fft8_X_2_R_i,
				input [15:0] fft8_X_2_I_i,
				input [15:0] fft8_X_3_R_i,
				input [15:0] fft8_X_3_I_i,
				input [15:0] fft8_X_4_R_i,
				input [15:0] fft8_X_4_I_i,
				input [15:0] fft8_X_5_R_i,
				input [15:0] fft8_X_5_I_i,
				input [15:0] fft8_X_6_R_i,
				input [15:0] fft8_X_6_I_i,
				input [15:0] fft8_X_7_R_i,
				input [15:0] fft8_X_7_I_i,

				input [15:0] fft16_X_0_R_i,
				input [15:0] fft16_X_0_I_i,
				input [15:0] fft16_X_1_R_i,
				input [15:0] fft16_X_1_I_i,
				input [15:0] fft16_X_2_R_i,
				input [15:0] fft16_X_2_I_i,
				input [15:0] fft16_X_3_R_i,
				input [15:0] fft16_X_3_I_i,
				input [15:0] fft16_X_4_R_i,
				input [15:0] fft16_X_4_I_i,
				input [15:0] fft16_X_5_R_i,
				input [15:0] fft16_X_5_I_i,
				input [15:0] fft16_X_6_R_i,
				input [15:0] fft16_X_6_I_i,
				input [15:0] fft16_X_7_R_i,
				input [15:0] fft16_X_7_I_i,
				input [15:0] fft16_X_8_R_i,
				input [15:0] fft16_X_8_I_i,
				input [15:0] fft16_X_9_R_i,
				input [15:0] fft16_X_9_I_i,
				input [15:0] fft16_X_10_R_i,
				input [15:0] fft16_X_10_I_i,
				input [15:0] fft16_X_11_R_i,
				input [15:0] fft16_X_11_I_i,
				input [15:0] fft16_X_12_R_i,
				input [15:0] fft16_X_12_I_i,
				input [15:0] fft16_X_13_R_i,
				input [15:0] fft16_X_13_I_i,
				input [15:0] fft16_X_14_R_i,
				input [15:0] fft16_X_14_I_i,
				input [15:0] fft16_X_15_R_i,
				input [15:0] fft16_X_15_I_i,

				input [15:0] fft32_X_0_R_i,
				input [15:0] fft32_X_0_I_i,
				input [15:0] fft32_X_1_R_i,
				input [15:0] fft32_X_1_I_i,
				input [15:0] fft32_X_2_R_i,
				input [15:0] fft32_X_2_I_i,
				input [15:0] fft32_X_3_R_i,
				input [15:0] fft32_X_3_I_i,
				input [15:0] fft32_X_4_R_i,
				input [15:0] fft32_X_4_I_i,
				input [15:0] fft32_X_5_R_i,
				input [15:0] fft32_X_5_I_i,
				input [15:0] fft32_X_6_R_i,
				input [15:0] fft32_X_6_I_i,
				input [15:0] fft32_X_7_R_i,
				input [15:0] fft32_X_7_I_i,
				input [15:0] fft32_X_8_R_i,
				input [15:0] fft32_X_8_I_i,
				input [15:0] fft32_X_9_R_i,
				input [15:0] fft32_X_9_I_i,
				input [15:0] fft32_X_10_R_i,
				input [15:0] fft32_X_10_I_i,
				input [15:0] fft32_X_11_R_i,
				input [15:0] fft32_X_11_I_i,
				input [15:0] fft32_X_12_R_i,
				input [15:0] fft32_X_12_I_i,
				input [15:0] fft32_X_13_R_i,
				input [15:0] fft32_X_13_I_i,
				input [15:0] fft32_X_14_R_i,
				input [15:0] fft32_X_14_I_i,
				input [15:0] fft32_X_15_R_i,
				input [15:0] fft32_X_15_I_i,
				input [15:0] fft32_X_16_R_i,
				input [15:0] fft32_X_16_I_i,
				input [15:0] fft32_X_17_R_i,
				input [15:0] fft32_X_17_I_i,
				input [15:0] fft32_X_18_R_i,
				input [15:0] fft32_X_18_I_i,
				input [15:0] fft32_X_19_R_i,
				input [15:0] fft32_X_19_I_i,
				input [15:0] fft32_X_20_R_i,
				input [15:0] fft32_X_20_I_i,
				input [15:0] fft32_X_21_R_i,
				input [15:0] fft32_X_21_I_i,
				input [15:0] fft32_X_22_R_i,
				input [15:0] fft32_X_22_I_i,
				input [15:0] fft32_X_23_R_i,
				input [15:0] fft32_X_23_I_i,
				input [15:0] fft32_X_24_R_i,
				input [15:0] fft32_X_24_I_i,
				input [15:0] fft32_X_25_R_i,
				input [15:0] fft32_X_25_I_i,
				input [15:0] fft32_X_26_R_i,
				input [15:0] fft32_X_26_I_i,
				input [15:0] fft32_X_27_R_i,
				input [15:0] fft32_X_27_I_i,
				input [15:0] fft32_X_28_R_i,
				input [15:0] fft32_X_28_I_i,
				input [15:0] fft32_X_29_R_i,
				input [15:0] fft32_X_29_I_i,
				input [15:0] fft32_X_30_R_i,
				input [15:0] fft32_X_30_I_i,
				input [15:0] fft32_X_31_R_i,
				input [15:0] fft32_X_31_I_i,

				input valid_fft8,
				input valid_fft16,

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
				output [15:0] X_31_I_o,


				output valid_o


				);



// mux3 X_R0(.fft_select_i(fft_select_i), .in_0_i(),in_1_i(), in_2_i(), .out(X_0_R_o));

assign X_0_R_o   =   fft8_X_0_R_i   | fft16_X_0_R_i;// | fft32_X_0_R_i;
assign X_0_I_o   =   fft8_X_0_I_i   | fft16_X_0_I_i;//| fft32_X_0_I_i;
assign X_1_R_o   =   fft8_X_1_R_i   | fft16_X_1_R_i;// | fft32_X_1_R_i;
assign X_1_I_o   =   fft8_X_1_I_i   | fft16_X_1_I_i;// | fft32_X_1_I_i;
assign X_2_R_o   =   fft8_X_2_R_i   | fft16_X_2_R_i;// | fft32_X_2_R_i;
assign X_2_I_o   =   fft8_X_2_I_i   | fft16_X_2_I_i;// | fft32_X_2_I_i;
assign X_3_R_o   =   fft8_X_3_R_i   | fft16_X_3_R_i;// | fft32_X_3_R_i;
assign X_3_I_o   =   fft8_X_3_I_i   | fft16_X_3_I_i;// | fft32_X_3_I_i;
assign X_4_R_o   =   fft8_X_4_R_i   | fft16_X_4_R_i;// | fft32_X_4_R_i;
assign X_4_I_o   =   fft8_X_4_I_i   | fft16_X_4_I_i;// | fft32_X_4_I_i;
assign X_5_R_o   =   fft8_X_5_R_i   | fft16_X_5_R_i;// | fft32_X_5_R_i;
assign X_5_I_o   =   fft8_X_5_I_i   | fft16_X_5_I_i;// | fft32_X_5_I_i;
assign X_6_R_o   =   fft8_X_6_R_i   | fft16_X_6_R_i;// | fft32_X_6_R_i;
assign X_6_I_o   =   fft8_X_6_I_i   | fft16_X_6_I_i;// | fft32_X_6_I_i;
assign X_7_R_o   =   fft8_X_7_R_i   | fft16_X_7_R_i;// | fft32_X_7_R_i;
assign X_7_I_o   =   fft8_X_7_I_i   | fft16_X_7_I_i;// | fft32_X_7_I_i;

assign X_8_R_o   =   fft16_X_8_R_i;//  | fft32_X_8_R_i;
assign X_8_I_o   =   fft16_X_8_I_i;//  | fft32_X_8_I_i;
assign X_9_R_o   =   fft16_X_9_R_i;// | fft32_X_9_R_i;
assign X_9_I_o   =   fft16_X_9_I_i;//  | fft32_X_9_I_i;
assign X_10_R_o  =   fft16_X_10_R_i;// | fft32_X_10_R_i;
assign X_10_I_o  =   fft16_X_10_I_i;// | fft32_X_10_I_i;
assign X_11_R_o  =   fft16_X_11_R_i;// | fft32_X_11_R_i;
assign X_11_I_o  =   fft16_X_11_I_i;// | fft32_X_11_I_i;
assign X_12_R_o  =   fft16_X_12_R_i;// | fft32_X_12_R_i;
assign X_12_I_o  =   fft16_X_12_I_i;// | fft32_X_12_I_i;
assign X_13_R_o  =   fft16_X_13_R_i;// | fft32_X_13_R_i;
assign X_13_I_o  =   fft16_X_13_I_i;// | fft32_X_13_I_i;
assign X_14_R_o  =   fft16_X_14_R_i;// | fft32_X_14_R_i;
assign X_14_I_o  =   fft16_X_14_I_i;// | fft32_X_14_I_i;
assign X_15_R_o  =   fft16_X_15_R_i;// | fft32_X_15_R_i;
assign X_15_I_o  =   fft16_X_15_I_i;// | fft32_X_15_I_i;

assign X_16_R_o  =   fft32_X_16_R_i;
assign X_16_I_o  =   fft32_X_16_I_i;
assign X_17_R_o  =   fft32_X_17_R_i;
assign X_17_I_o  =   fft32_X_17_I_i;
assign X_18_R_o  =   fft32_X_18_R_i;
assign X_18_I_o  =   fft32_X_18_I_i;
assign X_19_R_o  =   fft32_X_19_R_i;
assign X_19_I_o  =   fft32_X_19_I_i;
assign X_20_R_o  =   fft32_X_20_R_i;
assign X_20_I_o  =   fft32_X_20_I_i;
assign X_21_R_o  =   fft32_X_21_R_i;
assign X_21_I_o  =   fft32_X_21_I_i;
assign X_22_R_o  =   fft32_X_22_R_i;
assign X_22_I_o  =   fft32_X_22_I_i;
assign X_23_R_o  =   fft32_X_23_R_i;
assign X_23_I_o  =   fft32_X_23_I_i;
assign X_24_R_o  =   fft32_X_24_R_i;
assign X_24_I_o  =   fft32_X_24_I_i;
assign X_25_R_o  =   fft32_X_25_R_i;
assign X_25_I_o  =   fft32_X_25_I_i;
assign X_26_R_o  =   fft32_X_26_R_i;
assign X_26_I_o  =   fft32_X_26_I_i;
assign X_27_R_o  =   fft32_X_27_R_i;
assign X_27_I_o  =   fft32_X_27_I_i;
assign X_28_R_o  =   fft32_X_28_R_i;
assign X_28_I_o  =   fft32_X_28_I_i;
assign X_29_R_o  =   fft32_X_29_R_i;
assign X_29_I_o  =   fft32_X_29_I_i;
assign X_30_R_o  =   fft32_X_30_R_i;
assign X_30_I_o  =   fft32_X_30_I_i;
assign X_31_R_o  =   fft32_X_31_R_i;
assign X_31_I_o  =   fft32_X_31_I_i;

assign valid_o   = valid_fft8 | valid_fft16;


endmodule