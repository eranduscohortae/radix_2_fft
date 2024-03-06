module fft_tb;


localparam X0_R = 16'b00000100_00000000; // 4;
localparam X0_I = 16'b00000011_00000000; // 3;
localparam X1_R = 16'b00001000_00000000; // 8;
localparam X1_I = 16'b00001001_00000000; // 9;
localparam X2_R = 16'b00001100_00000000; // 12;
localparam X2_I = 16'b00001111_00000000; // 15;
localparam X3_R = 16'b00001100_00000000; // 12;
localparam X3_I = 16'b00010000_00000000; // 16;
localparam X4_R = 16'b00010010_00000000; // 18;
localparam X4_I = 16'b00010000_00000000; // 16;
localparam X5_R = 16'b00001110_00000000; // 14;
localparam X5_I = 16'b00001100_00000000; // 12;
localparam X6_R = 16'b00001011_00000000; // 11;
localparam X6_I = 16'b00000111_00000000; // 7;
localparam X7_R = 16'b00000101_00000000; // 5;
localparam X7_I = 16'b00000010_00000000; // 2;

localparam HIGH = 1'b1;
localparam LOW = 1'b0;

localparam Y_FILE = "ydata.txt";

localparam FPOINT_SHIFT = 2.0**-8;

reg clk;
reg rst;
reg start_r;
wire busy;
wire valid;

integer fd_y;

reg [15:0]  xdata_R_0,
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

wire [15:0] Xdata_R_0,
		    Xdata_I_0,
		    Xdata_R_1,
		    Xdata_I_1,
		    Xdata_R_2,
		    Xdata_I_2,
		    Xdata_R_3,
		    Xdata_I_3,
		    Xdata_R_4,
		    Xdata_I_4,
		    Xdata_R_5,
		    Xdata_I_5,
		    Xdata_R_6,
		    Xdata_I_6,
		    Xdata_R_7,
		    Xdata_I_7;




 fft_top FFT  (

				.clk(clk),
				.rst(rst),
				.start_i(start_r),

				.x_0_R_i(xdata_R_0),
				.x_0_I_i(xdata_I_0),
				.x_1_R_i(xdata_R_1),
				.x_1_I_i(xdata_I_1),
				.x_2_R_i(xdata_R_2),
				.x_2_I_i(xdata_I_2),
				.x_3_R_i(xdata_R_3),
				.x_3_I_i(xdata_I_3),
				.x_4_R_i(xdata_R_4),
				.x_4_I_i(xdata_I_4),
				.x_5_R_i(xdata_R_5),
				.x_5_I_i(xdata_I_5),
				.x_6_R_i(xdata_R_6),
				.x_6_I_i(xdata_I_6),
				.x_7_R_i(xdata_R_7),
				.x_7_I_i(xdata_I_7),

				.X_0_R_o(Xdata_R_0),
				.X_0_I_o(Xdata_I_0),
				.X_1_R_o(Xdata_R_1),
				.X_1_I_o(Xdata_I_1),
				.X_2_R_o(Xdata_R_2),
				.X_2_I_o(Xdata_I_2),
				.X_3_R_o(Xdata_R_3),
				.X_3_I_o(Xdata_I_3),
				.X_4_R_o(Xdata_R_4),
				.X_4_I_o(Xdata_I_4),
				.X_5_R_o(Xdata_R_5),
				.X_5_I_o(Xdata_I_5),
				.X_6_R_o(Xdata_R_6),
				.X_6_I_o(Xdata_I_6),
				.X_7_R_o(Xdata_R_7),
				.X_7_I_o(Xdata_I_7),

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

	xdata_R_0  = 0;
	xdata_I_0  = 0;
	xdata_R_1  = 0;
	xdata_I_1  = 0;
	xdata_R_2  = 0;
	xdata_I_2  = 0;
	xdata_R_3  = 0;
	xdata_I_3  = 0;
	xdata_R_4  = 0;
	xdata_I_4  = 0;
	xdata_R_5  = 0;
	xdata_I_5  = 0;
	xdata_R_6  = 0;
	xdata_I_6  = 0;
	xdata_R_7  = 0;
	xdata_I_7  = 0;

	fd_y = $fopen(Y_FILE, "w");


	# 2
	rst = LOW;
	xdata_R_0  = X0_R;
	xdata_I_0  = X0_I;
	xdata_R_1  = X1_R;
	xdata_I_1  = X1_I;
	xdata_R_2  = X2_R;
	xdata_I_2  = X2_I;
	xdata_R_3  = X3_R;
	xdata_I_3  = X3_I;
	xdata_R_4  = X4_R;
	xdata_I_4  = X4_I;
	xdata_R_5  = X5_R;
	xdata_I_5  = X5_I;
	xdata_R_6  = X6_R;
	xdata_I_6  = X6_I;
	xdata_R_7  = X7_R;
	xdata_I_7  = X7_I;


	# 2
	start_r = HIGH;
	# 2
	start_r = LOW;

end

always @(posedge clk) begin
	
	if(valid) begin

		$fwrite(fd_y, "%f  %f\n", $signed(Xdata_R_0)*FPOINT_SHIFT, $signed(Xdata_I_0)*FPOINT_SHIFT );
		$fwrite(fd_y, "%f  %f\n", $signed(Xdata_R_1)*FPOINT_SHIFT, $signed(Xdata_I_1)*FPOINT_SHIFT );
		$fwrite(fd_y, "%f  %f\n", $signed(Xdata_R_2)*FPOINT_SHIFT, $signed(Xdata_I_2)*FPOINT_SHIFT );
		$fwrite(fd_y, "%f  %f\n", $signed(Xdata_R_3)*FPOINT_SHIFT, $signed(Xdata_I_3)*FPOINT_SHIFT );
		$fwrite(fd_y, "%f  %f\n", $signed(Xdata_R_4)*FPOINT_SHIFT, $signed(Xdata_I_4)*FPOINT_SHIFT );
		$fwrite(fd_y, "%f  %f\n", $signed(Xdata_R_5)*FPOINT_SHIFT, $signed(Xdata_I_5)*FPOINT_SHIFT );
		$fwrite(fd_y, "%f  %f\n", $signed(Xdata_R_6)*FPOINT_SHIFT, $signed(Xdata_I_6)*FPOINT_SHIFT );
		$fwrite(fd_y, "%f   %f\n", $signed(Xdata_R_7)*FPOINT_SHIFT, $signed(Xdata_I_7)*FPOINT_SHIFT );


		$finish;


	end



end



endmodule