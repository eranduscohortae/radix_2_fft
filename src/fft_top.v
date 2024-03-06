module fft_top(
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

					output  valid_o,
					output  busy_o

	);





wire [59:0] wr_enable_c;
wire [63:0] alu_reg_c;
wire [4:0]  alu_mode_c;






 fft8_controller CTRL8   (

							.clk(clk),
							.rst(rst),
							.start_i(start_i),

							.alu_reg_o(alu_reg_c),
							.alu_mode_o(alu_mode_c),
							.wr_enable_o(wr_enable_c),
							.busy_o(busy_o),
							.valid_o(valid_o)
						 );


 fft8_datapath DATAPATH8 (
 	
 							.clk(clk),
							.rst(rst),
							.start_i(start_i),

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

							.alu_reg_i(alu_reg_c),
							.alu_mode_i(alu_mode_c),
							.wr_enable_i(wr_enable_c),

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
							.X_7_I_o(X_7_I_o)

 						 );





endmodule 


