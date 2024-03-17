module fft_top(
					input clk,
					input rst,

					input start_i,
					input [1:0] fft_select_i,

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
					input [15:0] x_31_I_i,

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

					output  valid_o


	);





wire [59:0]  fft8_wr_enable_c;
wire [63:0]  fft8_alu_reg_c;
wire [4:0]   fft8_alu_mode_c;

wire [165:0] fft16_wr_enable_c;
wire [175:0] fft16_alu_reg_c;
wire [4:0]   fft16_alu_mode_c;

wire [256:0] fft32_wr_enable_c;
wire [256:0] fft32_alu_reg_c;
wire [4:0]   fft32_alu_mode_c;



wire start_fft8;
wire start_fft16;
wire start_fft32;

wire valid_fft8;
wire valid_fft16;
wire valid_fft32;

wire [15:0] fft8_X_0_R;
wire [15:0] fft8_X_0_I;
wire [15:0] fft8_X_1_R;
wire [15:0] fft8_X_1_I;
wire [15:0] fft8_X_2_R;
wire [15:0] fft8_X_2_I;
wire [15:0] fft8_X_3_R;
wire [15:0] fft8_X_3_I;
wire [15:0] fft8_X_4_R;
wire [15:0] fft8_X_4_I;
wire [15:0] fft8_X_5_R;
wire [15:0] fft8_X_5_I;
wire [15:0] fft8_X_6_R;
wire [15:0] fft8_X_6_I;
wire [15:0] fft8_X_7_R;
wire [15:0] fft8_X_7_I;

wire [15:0] fft16_X_0_R;
wire [15:0] fft16_X_0_I;
wire [15:0] fft16_X_1_R;
wire [15:0] fft16_X_1_I;
wire [15:0] fft16_X_2_R;
wire [15:0] fft16_X_2_I;
wire [15:0] fft16_X_3_R;
wire [15:0] fft16_X_3_I;
wire [15:0] fft16_X_4_R;
wire [15:0] fft16_X_4_I;
wire [15:0] fft16_X_5_R;
wire [15:0] fft16_X_5_I;
wire [15:0] fft16_X_6_R;
wire [15:0] fft16_X_6_I;
wire [15:0] fft16_X_7_R;
wire [15:0] fft16_X_7_I;
wire [15:0] fft16_X_8_R;
wire [15:0] fft16_X_8_I;
wire [15:0] fft16_X_9_R;
wire [15:0] fft16_X_9_I;
wire [15:0] fft16_X_10_R;
wire [15:0] fft16_X_10_I;
wire [15:0] fft16_X_11_R;
wire [15:0] fft16_X_11_I;
wire [15:0] fft16_X_12_R;
wire [15:0] fft16_X_12_I;
wire [15:0] fft16_X_13_R;
wire [15:0] fft16_X_13_I;
wire [15:0] fft16_X_14_R;
wire [15:0] fft16_X_14_I;
wire [15:0] fft16_X_15_R;
wire [15:0] fft16_X_15_I;

wire [15:0] fft32_X_0_R;
wire [15:0] fft32_X_0_I;
wire [15:0] fft32_X_1_R;
wire [15:0] fft32_X_1_I;
wire [15:0] fft32_X_2_R;
wire [15:0] fft32_X_2_I;
wire [15:0] fft32_X_3_R;
wire [15:0] fft32_X_3_I;
wire [15:0] fft32_X_4_R;
wire [15:0] fft32_X_4_I;
wire [15:0] fft32_X_5_R;
wire [15:0] fft32_X_5_I;
wire [15:0] fft32_X_6_R;
wire [15:0] fft32_X_6_I;
wire [15:0] fft32_X_7_R;
wire [15:0] fft32_X_7_I;
wire [15:0] fft32_X_8_R;
wire [15:0] fft32_X_8_I;
wire [15:0] fft32_X_9_R;
wire [15:0] fft32_X_9_I;
wire [15:0] fft32_X_10_R;
wire [15:0] fft32_X_10_I;
wire [15:0] fft32_X_11_R;
wire [15:0] fft32_X_11_I;
wire [15:0] fft32_X_12_R;
wire [15:0] fft32_X_12_I;
wire [15:0] fft32_X_13_R;
wire [15:0] fft32_X_13_I;
wire [15:0] fft32_X_14_R;
wire [15:0] fft32_X_14_I;
wire [15:0] fft32_X_15_R;
wire [15:0] fft32_X_15_I;
wire [15:0] fft32_X_16_R;
wire [15:0] fft32_X_16_I;
wire [15:0] fft32_X_17_R;
wire [15:0] fft32_X_17_I;
wire [15:0] fft32_X_18_R;
wire [15:0] fft32_X_18_I;
wire [15:0] fft32_X_19_R;
wire [15:0] fft32_X_19_I;
wire [15:0] fft32_X_20_R;
wire [15:0] fft32_X_20_I;
wire [15:0] fft32_X_21_R;
wire [15:0] fft32_X_21_I;
wire [15:0] fft32_X_22_R;
wire [15:0] fft32_X_22_I;
wire [15:0] fft32_X_23_R;
wire [15:0] fft32_X_23_I;
wire [15:0] fft32_X_24_R;
wire [15:0] fft32_X_24_I;
wire [15:0] fft32_X_25_R;
wire [15:0] fft32_X_25_I;
wire [15:0] fft32_X_26_R;
wire [15:0] fft32_X_26_I;
wire [15:0] fft32_X_27_R;
wire [15:0] fft32_X_27_I;
wire [15:0] fft32_X_28_R;
wire [15:0] fft32_X_28_I;
wire [15:0] fft32_X_29_R;
wire [15:0] fft32_X_29_I;
wire [15:0] fft32_X_30_R;
wire [15:0] fft32_X_30_I;
wire [15:0] fft32_X_31_R;
wire [15:0] fft32_X_31_I;




 fft_demux DEMUX 	     (

 							.start_i(start_i),
 							.fft_select_i(fft_select_i),

 							.start_fft8_o(start_fft8),
 							.start_fft16_o(start_fft16),
 							.start_fft32_o(start_fft32)

 						 );






 fft8_controller CTRL8   (

							.clk(clk),
							.rst(rst),
							.start_i(start_fft8),

							.alu_reg_o(fft8_alu_reg_c),
							.alu_mode_o(fft8_alu_mode_c),
							.wr_enable_o(fft8_wr_enable_c),
							.busy_o(busy_o),
							.valid_o(valid_fft8)
						 );


 fft8_datapath DATAPATH8 (
 	
 							.clk(clk),
							.rst(rst),
							.start_i(start_fft8),

							.x_0_R_i(x_0_R_i),
							.x_0_I_i(x_0_I_i),
							.x_1_R_i(x_1_R_i),
							.x_1_I_i(x_1_I_i),
							.x_2_R_i(x_2_R_i),
							.x_2_I_i(x_2_I_i),
							.x_3_R_i(x_3_R_i),
							.x_3_I_i(x_3_I_i),
							.x_4_R_i(x_4_R_i),
							.x_4_I_i(x_4_I_i),
							.x_5_R_i(x_5_R_i),
							.x_5_I_i(x_5_I_i),
							.x_6_R_i(x_6_R_i),
							.x_6_I_i(x_6_I_i),
							.x_7_R_i(x_7_R_i),
							.x_7_I_i(x_7_I_i),

							.alu_reg_i(fft8_alu_reg_c),
							.alu_mode_i(fft8_alu_mode_c),
							.wr_enable_i(fft8_wr_enable_c),

							.X_0_R_o(fft8_X_0_R),
							.X_0_I_o(fft8_X_0_I),
							.X_1_R_o(fft8_X_1_R),
							.X_1_I_o(fft8_X_1_I),
							.X_2_R_o(fft8_X_2_R),
							.X_2_I_o(fft8_X_2_I),
							.X_3_R_o(fft8_X_3_R),
							.X_3_I_o(fft8_X_3_I),
							.X_4_R_o(fft8_X_4_R),
							.X_4_I_o(fft8_X_4_I),
							.X_5_R_o(fft8_X_5_R),
							.X_5_I_o(fft8_X_5_I),
							.X_6_R_o(fft8_X_6_R),
							.X_6_I_o(fft8_X_6_I),
							.X_7_R_o(fft8_X_7_R),
							.X_7_I_o(fft8_X_7_I)

 						 );


 fft16_controller CTRL16   (

							.clk(clk),
							.rst(rst),
							.start_i(start_fft16),

							.alu_reg_o(fft16_alu_reg_c),
							.alu_mode_o(fft16_alu_mode_c),
							.wr_enable_o(fft16_wr_enable_c),
							.busy_o(busy_o),
							.valid_o(valid_fft16)
						 );


 fft16_datapath DATAPATH16 (
 	
 							.clk(clk),
							.rst(rst),
							.start_i(start_fft16),

							.x_0_R_i(x_0_R_i),
							.x_0_I_i(x_0_I_i),
							.x_1_R_i(x_1_R_i),
							.x_1_I_i(x_1_I_i),
							.x_2_R_i(x_2_R_i),
							.x_2_I_i(x_2_I_i),
							.x_3_R_i(x_3_R_i),
							.x_3_I_i(x_3_I_i),
							.x_4_R_i(x_4_R_i),
							.x_4_I_i(x_4_I_i),
							.x_5_R_i(x_5_R_i),
							.x_5_I_i(x_5_I_i),
							.x_6_R_i(x_6_R_i),
							.x_6_I_i(x_6_I_i),
							.x_7_R_i(x_7_R_i),
							.x_7_I_i(x_7_I_i),
							.x_8_R_i(x_8_R_i),
							.x_8_I_i(x_8_I_i),
							.x_9_R_i(x_9_R_i),
							.x_9_I_i(x_9_I_i),
							.x_10_R_i(x_10_R_i),
							.x_10_I_i(x_10_I_i),
							.x_11_R_i(x_11_R_i),
							.x_11_I_i(x_11_I_i),
							.x_12_R_i(x_12_R_i),
							.x_12_I_i(x_12_I_i),
							.x_13_R_i(x_13_R_i),
							.x_13_I_i(x_13_I_i),
							.x_14_R_i(x_14_R_i),
							.x_14_I_i(x_14_I_i),
							.x_15_R_i(x_15_R_i),
							.x_15_I_i(x_15_I_i),

							.alu_reg_i(fft16_alu_reg_c),
							.alu_mode_i(fft16_alu_mode_c),
							.wr_enable_i(fft16_wr_enable_c),



							.X_0_R_o(fft16_X_0_R),
							.X_0_I_o(fft16_X_0_I),
							.X_1_R_o(fft16_X_1_R),
							.X_1_I_o(fft16_X_1_I),
							.X_2_R_o(fft16_X_2_R),
							.X_2_I_o(fft16_X_2_I),
							.X_3_R_o(fft16_X_3_R),
							.X_3_I_o(fft16_X_3_I),
							.X_4_R_o(fft16_X_4_R),
							.X_4_I_o(fft16_X_4_I),
							.X_5_R_o(fft16_X_5_R),
							.X_5_I_o(fft16_X_5_I),
							.X_6_R_o(fft16_X_6_R),
							.X_6_I_o(fft16_X_6_I),
							.X_7_R_o(fft16_X_7_R),
							.X_7_I_o(fft16_X_7_I),
							.X_8_R_o(fft16_X_8_R),
							.X_8_I_o(fft16_X_8_I),
							.X_9_R_o(fft16_X_9_R),
							.X_9_I_o(fft16_X_9_I),
							.X_10_R_o(fft16_X_10_R),
							.X_10_I_o(fft16_X_10_I),
							.X_11_R_o(fft16_X_11_R),
							.X_11_I_o(fft16_X_11_I),
							.X_12_R_o(fft16_X_12_R),
							.X_12_I_o(fft16_X_12_I),
							.X_13_R_o(fft16_X_13_R),
							.X_13_I_o(fft16_X_13_I),
							.X_14_R_o(fft16_X_14_R),
							.X_14_I_o(fft16_X_14_I),
							.X_15_R_o(fft16_X_15_R),
							.X_15_I_o(fft16_X_15_I)

 						 );


 fft32_controller CTRL32   (

							.clk(clk),
							.rst(rst),
							.start_i(start_fft32),

							.alu_reg_o(fft32_alu_reg_c),
							.alu_mode_o(fft32_alu_mode_c),
							.wr_enable_o(fft32_wr_enable_c),
							.busy_o(busy_o),
							.valid_o(valid_fft32)
						 );


 fft32_datapath DATAPATH32 (
 	
 							.clk(clk),
							.rst(rst),
							.start_i(start_fft32),

							.x_0_R_i(x_0_R_i),
							.x_0_I_i(x_0_I_i),
							.x_1_R_i(x_1_R_i),
							.x_1_I_i(x_1_I_i),
							.x_2_R_i(x_2_R_i),
							.x_2_I_i(x_2_I_i),
							.x_3_R_i(x_3_R_i),
							.x_3_I_i(x_3_I_i),
							.x_4_R_i(x_4_R_i),
							.x_4_I_i(x_4_I_i),
							.x_5_R_i(x_5_R_i),
							.x_5_I_i(x_5_I_i),
							.x_6_R_i(x_6_R_i),
							.x_6_I_i(x_6_I_i),
							.x_7_R_i(x_7_R_i),
							.x_7_I_i(x_7_I_i),
							.x_8_R_i(x_8_R_i),
							.x_8_I_i(x_8_I_i),
							.x_9_R_i(x_9_R_i),
							.x_9_I_i(x_9_I_i),
							.x_10_R_i(x_10_R_i),
							.x_10_I_i(x_10_I_i),
							.x_11_R_i(x_11_R_i),
							.x_11_I_i(x_11_I_i),
							.x_12_R_i(x_12_R_i),
							.x_12_I_i(x_12_I_i),
							.x_13_R_i(x_13_R_i),
							.x_13_I_i(x_13_I_i),
							.x_14_R_i(x_14_R_i),
							.x_14_I_i(x_14_I_i),
							.x_15_R_i(x_15_R_i),
							.x_15_I_i(x_15_I_i),
							.x_16_R_i(x_16_R_i),
							.x_16_I_i(x_16_I_i),
							.x_17_R_i(x_17_R_i),
							.x_17_I_i(x_17_I_i),
							.x_18_R_i(x_18_R_i),
							.x_18_I_i(x_18_I_i),
							.x_19_R_i(x_19_R_i),
							.x_19_I_i(x_19_I_i),
							.x_20_R_i(x_20_R_i),
							.x_20_I_i(x_20_I_i),
							.x_21_R_i(x_21_R_i),
							.x_21_I_i(x_21_I_i),
							.x_22_R_i(x_22_R_i),
							.x_22_I_i(x_22_I_i),
							.x_23_R_i(x_23_R_i),
							.x_23_I_i(x_23_I_i),
							.x_24_R_i(x_24_R_i),
							.x_24_I_i(x_24_I_i),
							.x_25_R_i(x_25_R_i),
							.x_25_I_i(x_25_I_i),
							.x_26_R_i(x_26_R_i),
							.x_26_I_i(x_26_I_i),
							.x_27_R_i(x_27_R_i),
							.x_27_I_i(x_27_I_i),
							.x_28_R_i(x_28_R_i),
							.x_28_I_i(x_28_I_i),
							.x_29_R_i(x_29_R_i),
							.x_29_I_i(x_29_I_i),
							.x_30_R_i(x_30_R_i),
							.x_30_I_i(x_30_I_i),
							.x_31_R_i(x_31_R_i),
							.x_31_I_i(x_31_I_i),

							.alu_reg_i(fft32_alu_reg_c),
							.alu_mode_i(fft32_alu_mode_c),
							.wr_enable_i(fft32_wr_enable_c),


							.X_0_R_o(fft32_X_0_R),
							.X_0_I_o(fft32_X_0_I),
							.X_1_R_o(fft32_X_1_R),
							.X_1_I_o(fft32_X_1_I),
							.X_2_R_o(fft32_X_2_R),
							.X_2_I_o(fft32_X_2_I),
							.X_3_R_o(fft32_X_3_R),
							.X_3_I_o(fft32_X_3_I),
							.X_4_R_o(fft32_X_4_R),
							.X_4_I_o(fft32_X_4_I),
							.X_5_R_o(fft32_X_5_R),
							.X_5_I_o(fft32_X_5_I),
							.X_6_R_o(fft32_X_6_R),
							.X_6_I_o(fft32_X_6_I),
							.X_7_R_o(fft32_X_7_R),
							.X_7_I_o(fft32_X_7_I),
							.X_8_R_o(fft32_X_8_R),
							.X_8_I_o(fft32_X_8_I),
							.X_9_R_o(fft32_X_9_R),
							.X_9_I_o(fft32_X_9_I),
							.X_10_R_o(fft32_X_10_R),
							.X_10_I_o(fft32_X_10_I),
							.X_11_R_o(fft32_X_11_R),
							.X_11_I_o(fft32_X_11_I),
							.X_12_R_o(fft32_X_12_R),
							.X_12_I_o(fft32_X_12_I),
							.X_13_R_o(fft32_X_13_R),
							.X_13_I_o(fft32_X_13_I),
							.X_14_R_o(fft32_X_14_R),
							.X_14_I_o(fft32_X_14_I),
							.X_15_R_o(fft32_X_15_R),
							.X_15_I_o(fft32_X_15_I),
							.X_16_R_o(fft32_X_16_R),
							.X_16_I_o(fft32_X_16_I),
							.X_17_R_o(fft32_X_17_R),
							.X_17_I_o(fft32_X_17_I),
							.X_18_R_o(fft32_X_18_R),
							.X_18_I_o(fft32_X_18_I),
							.X_19_R_o(fft32_X_19_R),
							.X_19_I_o(fft32_X_19_I),
							.X_20_R_o(fft32_X_20_R),
							.X_20_I_o(fft32_X_20_I),
							.X_21_R_o(fft32_X_21_R),
							.X_21_I_o(fft32_X_21_I),
							.X_22_R_o(fft32_X_22_R),
							.X_22_I_o(fft32_X_22_I),
							.X_23_R_o(fft32_X_23_R),
							.X_23_I_o(fft32_X_23_I),
							.X_24_R_o(fft32_X_24_R),
							.X_24_I_o(fft32_X_24_I),
							.X_25_R_o(fft32_X_25_R),
							.X_25_I_o(fft32_X_25_I),
							.X_26_R_o(fft32_X_26_R),
							.X_26_I_o(fft32_X_26_I),
							.X_27_R_o(fft32_X_27_R),
							.X_27_I_o(fft32_X_27_I),
							.X_28_R_o(fft32_X_28_R),
							.X_28_I_o(fft32_X_28_I),
							.X_29_R_o(fft32_X_29_R),
							.X_29_I_o(fft32_X_29_I),
							.X_30_R_o(fft32_X_30_R),
							.X_30_I_o(fft32_X_30_I),
							.X_31_R_o(fft32_X_31_R),
							.X_31_I_o(fft32_X_31_I)

 						 );





 fft_mux MUX 			 (

 							.valid_fft8(valid_fft8),
							.valid_fft16(valid_fft16),
							.valid_fft32(valid_fft32),


 							.fft8_X_0_R_i(fft8_X_0_R),
							.fft8_X_0_I_i(fft8_X_0_I),
							.fft8_X_1_R_i(fft8_X_1_R),
							.fft8_X_1_I_i(fft8_X_1_I),
							.fft8_X_2_R_i(fft8_X_2_R),
							.fft8_X_2_I_i(fft8_X_2_I),
							.fft8_X_3_R_i(fft8_X_3_R),
							.fft8_X_3_I_i(fft8_X_3_I),
							.fft8_X_4_R_i(fft8_X_4_R),
							.fft8_X_4_I_i(fft8_X_4_I),
							.fft8_X_5_R_i(fft8_X_5_R),
							.fft8_X_5_I_i(fft8_X_5_I),
							.fft8_X_6_R_i(fft8_X_6_R),
							.fft8_X_6_I_i(fft8_X_6_I),
							.fft8_X_7_R_i(fft8_X_7_R),
							.fft8_X_7_I_i(fft8_X_7_I),


							.fft16_X_0_R_i(fft16_X_0_R),
							.fft16_X_0_I_i(fft16_X_0_I),
							.fft16_X_1_R_i(fft16_X_1_R),
							.fft16_X_1_I_i(fft16_X_1_I),
							.fft16_X_2_R_i(fft16_X_2_R),
							.fft16_X_2_I_i(fft16_X_2_I),
							.fft16_X_3_R_i(fft16_X_3_R),
							.fft16_X_3_I_i(fft16_X_3_I),
							.fft16_X_4_R_i(fft16_X_4_R),
							.fft16_X_4_I_i(fft16_X_4_I),
							.fft16_X_5_R_i(fft16_X_5_R),
							.fft16_X_5_I_i(fft16_X_5_I),
							.fft16_X_6_R_i(fft16_X_6_R),
							.fft16_X_6_I_i(fft16_X_6_I),
							.fft16_X_7_R_i(fft16_X_7_R),
							.fft16_X_7_I_i(fft16_X_7_I),
							.fft16_X_8_R_i(fft16_X_8_R),
							.fft16_X_8_I_i(fft16_X_8_I),
							.fft16_X_9_R_i(fft16_X_9_R),
							.fft16_X_9_I_i(fft16_X_9_I),
							.fft16_X_10_R_i(fft16_X_10_R),
							.fft16_X_10_I_i(fft16_X_10_I),
							.fft16_X_11_R_i(fft16_X_11_R),
							.fft16_X_11_I_i(fft16_X_11_I),
							.fft16_X_12_R_i(fft16_X_12_R),
							.fft16_X_12_I_i(fft16_X_12_I),	
							.fft16_X_13_R_i(fft16_X_13_R),
							.fft16_X_13_I_i(fft16_X_13_I),
							.fft16_X_14_R_i(fft16_X_14_R),
							.fft16_X_14_I_i(fft16_X_14_I),
							.fft16_X_15_R_i(fft16_X_15_R),
							.fft16_X_15_I_i(fft16_X_15_I),


							.fft32_X_0_R_i(fft32_X_0_R),
							.fft32_X_0_I_i(fft32_X_0_I),
							.fft32_X_1_R_i(fft32_X_1_R),
							.fft32_X_1_I_i(fft32_X_1_I),
							.fft32_X_2_R_i(fft32_X_2_R),
							.fft32_X_2_I_i(fft32_X_2_I),
							.fft32_X_3_R_i(fft32_X_3_R),
							.fft32_X_3_I_i(fft32_X_3_I),
							.fft32_X_4_R_i(fft32_X_4_R),
							.fft32_X_4_I_i(fft32_X_4_I),
							.fft32_X_5_R_i(fft32_X_5_R),
							.fft32_X_5_I_i(fft32_X_5_I),
							.fft32_X_6_R_i(fft32_X_6_R),
							.fft32_X_6_I_i(fft32_X_6_I),
							.fft32_X_7_R_i(fft32_X_7_R),
							.fft32_X_7_I_i(fft32_X_7_I),
							.fft32_X_8_R_i(fft32_X_8_R),
							.fft32_X_8_I_i(fft32_X_8_I),
							.fft32_X_9_R_i(fft32_X_9_R),
							.fft32_X_9_I_i(fft32_X_9_I),
							.fft32_X_10_R_i(fft32_X_10_R),
							.fft32_X_10_I_i(fft32_X_10_I),
							.fft32_X_11_R_i(fft32_X_11_R),
							.fft32_X_11_I_i(fft32_X_11_I),
							.fft32_X_12_R_i(fft32_X_12_R),
							.fft32_X_12_I_i(fft32_X_12_I),
							.fft32_X_13_R_i(fft32_X_13_R),
							.fft32_X_13_I_i(fft32_X_13_I),
							.fft32_X_14_R_i(fft32_X_14_R),
							.fft32_X_14_I_i(fft32_X_14_I),
							.fft32_X_15_R_i(fft32_X_15_R),
							.fft32_X_15_I_i(fft32_X_15_I),
							.fft32_X_16_R_i(fft32_X_16_R),
							.fft32_X_16_I_i(fft32_X_16_I),
							.fft32_X_17_R_i(fft32_X_17_R),
							.fft32_X_17_I_i(fft32_X_17_I),
							.fft32_X_18_R_i(fft32_X_18_R),
							.fft32_X_18_I_i(fft32_X_18_I),
							.fft32_X_19_R_i(fft32_X_19_R),
							.fft32_X_19_I_i(fft32_X_19_I),
							.fft32_X_20_R_i(fft32_X_20_R),
							.fft32_X_20_I_i(fft32_X_20_I),
							.fft32_X_21_R_i(fft32_X_21_R),
							.fft32_X_21_I_i(fft32_X_21_I),
							.fft32_X_22_R_i(fft32_X_22_R),
							.fft32_X_22_I_i(fft32_X_22_I),
							.fft32_X_23_R_i(fft32_X_23_R),
							.fft32_X_23_I_i(fft32_X_23_I),
							.fft32_X_24_R_i(fft32_X_24_R),
							.fft32_X_24_I_i(fft32_X_24_I),
							.fft32_X_25_R_i(fft32_X_25_R),
							.fft32_X_25_I_i(fft32_X_25_I),
							.fft32_X_26_R_i(fft32_X_26_R),
							.fft32_X_26_I_i(fft32_X_26_I),
							.fft32_X_27_R_i(fft32_X_27_R),
							.fft32_X_27_I_i(fft32_X_27_I),
							.fft32_X_28_R_i(fft32_X_28_R),
							.fft32_X_28_I_i(fft32_X_28_I),
							.fft32_X_29_R_i(fft32_X_29_R),
							.fft32_X_29_I_i(fft32_X_29_I),
							.fft32_X_30_R_i(fft32_X_30_R),
							.fft32_X_30_I_i(fft32_X_30_I),
							.fft32_X_31_R_i(fft32_X_31_R),
							.fft32_X_31_I_i(fft32_X_31_I),

							.X_0_R_o(X_0_R_o),
							.X_0_I_o(X_0_I_o),
							.X_1_R_o(X_1_R_o),
							.X_1_I_o(X_1_I_o),
							.X_2_R_o(X_2_R_o),
							.X_2_I_o(X_2_I_o),
							.X_3_R_o(X_3_R_o),
							.X_3_I_o(X_3_I_o),
							.X_4_R_o(X_4_R_o),
							.X_4_I_o(X_4_I_o),
							.X_5_R_o(X_5_R_o),
							.X_5_I_o(X_5_I_o),
							.X_6_R_o(X_6_R_o),
							.X_6_I_o(X_6_I_o),
							.X_7_R_o(X_7_R_o),
							.X_7_I_o(X_7_I_o),
							.X_8_R_o(X_8_R_o),
							.X_8_I_o(X_8_I_o),
							.X_9_R_o(X_9_R_o),
							.X_9_I_o(X_9_I_o),
							.X_10_R_o(X_10_R_o),
							.X_10_I_o(X_10_I_o),
							.X_11_R_o(X_11_R_o),
							.X_11_I_o(X_11_I_o),
							.X_12_R_o(X_12_R_o),
							.X_12_I_o(X_12_I_o),
							.X_13_R_o(X_13_R_o),
							.X_13_I_o(X_13_I_o),
							.X_14_R_o(X_14_R_o),
							.X_14_I_o(X_14_I_o),
							.X_15_R_o(X_15_R_o),
							.X_15_I_o(X_15_I_o),
							.X_16_R_o(X_16_R_o),
							.X_16_I_o(X_16_I_o),
							.X_17_R_o(X_17_R_o),
							.X_17_I_o(X_17_I_o),
							.X_18_R_o(X_18_R_o),
							.X_18_I_o(X_18_I_o),
							.X_19_R_o(X_19_R_o),
							.X_19_I_o(X_19_I_o),
							.X_20_R_o(X_20_R_o),
							.X_20_I_o(X_20_I_o),
							.X_21_R_o(X_21_R_o),
							.X_21_I_o(X_21_I_o),
							.X_22_R_o(X_22_R_o),
							.X_22_I_o(X_22_I_o),
							.X_23_R_o(X_23_R_o),
							.X_23_I_o(X_23_I_o),
							.X_24_R_o(X_24_R_o),
							.X_24_I_o(X_24_I_o),
							.X_25_R_o(X_25_R_o),
							.X_25_I_o(X_25_I_o),
							.X_26_R_o(X_26_R_o),
							.X_26_I_o(X_26_I_o),
							.X_27_R_o(X_27_R_o),
							.X_27_I_o(X_27_I_o),
							.X_28_R_o(X_28_R_o),
							.X_28_I_o(X_28_I_o),
							.X_29_R_o(X_29_R_o),
							.X_29_I_o(X_29_I_o),
							.X_30_R_o(X_30_R_o),
							.X_30_I_o(X_30_I_o),
							.X_31_R_o(X_31_R_o),
							.X_31_I_o(X_31_I_o),

							.valid_o(valid_o)

						);







endmodule 


