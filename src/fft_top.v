module fft_top(
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





wire valid_c;
wire [25:0] wr_enable_c;
wire [5:0]  valid_states_c;
wire [7:0]  check_c;
wire [47:0] alu_reg_c;
wire [7:0]  alu_mode_c;






 fft8_controller CTRL8   (

							.clk(clk),
							.rst(rst),
							.start_i(start_i),

							.valid_i(valid_o),
							.valid_states_i(valid_states_c),
							.check_o(check_c),
							.alu_reg_o(alu_reg_c),
							.alu_mode_o(alu_mode_c),
							.wr_enable_o(wr_enable_c),
							.busy_o(busy_o)
						 );


 fft8_datapath DATAPATH8 (
 	
 							.clk(clk),
							.rst(rst),
							.start_i(start_i),

							.x_0_i(x_0_i),
							.x_1_i(x_1_i),
							.x_2_i(x_2_i),
							.x_3_i(x_3_i),
							.x_4_i(x_4_i),
							.x_5_i(x_5_i),	
							.x_6_i(x_6_i),
							.x_7_i(x_7_i),

							.check_i(check_c),
							.alu_reg_i(alu_reg_c),
							.alu_mode_i(alu_mode_c),
							.wr_enable_i(wr_enable_c),

							.valid_o(valid_c),
							.valid_states_o(valid_states_c),

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


