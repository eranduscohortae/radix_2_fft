module fft_tb;


localparam X0 = 65;
localparam X1 = 87;
localparam X2 = 147;
localparam X3 = 234;
localparam X4 = 120;
localparam X5 = 110;
localparam X6 = 90;
localparam X7 = 158;

localparam HIGH = 1'b1;
localparam LOW = 1'b0;


reg clk;
reg rst;
reg start_r;
wire busy;
wire valid;


reg [15:0]  xdata_0,
		    xdata_1,
		    xdata_2,
		    xdata_3,
		    xdata_4,
		    xdata_5,
		    xdata_6,
		    xdata_7;

wire [15:0] xdata_R_0,
		    xdata_I_0,
		    xdata_R_1,
		    xdata_I_1,
		    xdata_R_2,
		    xdata_I_2,
		    xdata_R_3,
		    xdata_I_3,
		    xdata_R_4,
		    xdata_I_4,
		    xdata_R_5,
		    xdata_I_5,
		    xdata_R_6,
		    xdata_I_6,
		    xdata_R_7,
		    xdata_I_7;




 fft_top FFT  (

				.clk(clk),
				.rst(rst),
				.start_i(start_r),

				.x_0_i(xdata_0),
				.x_1_i(xdata_1),
				.x_2_i(xdata_2),
				.x_3_i(xdata_3),
				.x_4_i(xdata_4),
				.x_5_i(xdata_5),
				.x_6_i(xdata_6),
				.x_7_i(xdata_7),

				.X_0_R_o(xdata_R_0),
				.X_0_I_o(xdata_I_0),
				.X_1_R_o(xdata_R_1),
				.X_1_I_o(xdata_I_1),
				.X_2_R_o(xdata_R_2),
				.X_2_I_o(xdata_I_2),
				.X_3_R_o(xdata_R_3),
				.X_3_I_o(xdata_I_3),
				.X_4_R_o(xdata_R_4),
				.X_4_I_o(xdata_I_4),
				.X_5_R_o(xdata_R_5),
				.X_5_I_o(xdata_I_5),
				.X_6_R_o(xdata_R_6),
				.X_6_I_o(xdata_I_6),
				.X_7_R_o(xdata_R_7),
				.X_7_I_o(xdata_I_7),

				.valid_o(valid),
				.busy_o(busy)


			  );




always begin
	
	#1 clk <= ~clk;

end


initial begin
	
	clk        = HIGH;
	rst        = HIGH;
	start_r    = LOW;

	xdata_0    = 0;
	xdata_1    = 0;
	xdata_2    = 0;
	xdata_3    = 0;
	xdata_4    = 0;
	xdata_5    = 0;
	xdata_6    = 0;
	xdata_7    = 0;

	# 2
	rst = LOW;
	xdata_0    = X0;
	xdata_1    = X1;
	xdata_2    = X2;
	xdata_3    = X3;
	xdata_4    = X4;
	xdata_5    = X5;
	xdata_6    = X6;
	xdata_7    = X7;

	# 2
	start_r = HIGH;
	# 2
	start_r = LOW;




end


endmodule