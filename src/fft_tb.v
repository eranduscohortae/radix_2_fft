module fft_tb;




/*
localparam X0_R  = 16'b00000011_11100000; // 3.875
localparam X0_I  = -16'b00000101_10100000; // -5.625i
localparam X1_R  = 16'b00000100_10110000; // 4.6875
localparam X1_I  = 16'b00000100_11100000; // 4.875i
localparam X2_R  = -16'b00000110_01100000; // -6.375
localparam X2_I  = 16'b00000101_11100000; // 5.875i
localparam X3_R  = 16'b00001101_10000000; // 13.5
localparam X3_I  = 16'b00001001_10100000; // 9.625i
localparam X4_R  = -16'b00001000_11100000; // -8.875
localparam X4_I  = 16'b00001110_01100000; // 14.375i
localparam X5_R  = 16'b00000110_01110000; // 6.4375
localparam X5_I  = 16'b00000011_11000000; // 3.75i
localparam X6_R  = 16'b00000011_10100000; // 3.625
localparam X6_I  = 16'b00000111_10000000; // 7.5i
localparam X7_R  = 16'b00000110_01100000; // 6.375
localparam X7_I  = 16'b00000011_01000000; // 3.25i
*/

localparam X0_R  = 16'b00000001_00000000; // 1;
localparam X0_I  = 16'b00000010_00000000; // 2;

localparam X1_R  = 16'b00000011_00000000; // 3;
localparam X1_I  = 16'b00000100_00000000; // 4;

localparam X2_R  = 16'b00000101_00000000; // 5;
localparam X2_I  = 16'b00000010_00000000; // 2;

localparam X3_R  = 16'b00000110_00000000; // 6;
localparam X3_I  = 16'b00000101_00000000; // 5;

localparam X4_R  = 16'b00000011_00000000; // 3;
localparam X4_I  = 16'b00000101_00000000; // 5;

localparam X5_R  = 16'b00000011_00000000; // 3;
localparam X5_I  = 16'b00000111_00000000; // 7;

localparam X6_R  = 16'b00000010_00000000; // 2;
localparam X6_I  = 16'b00000100_00000000; // 4;

localparam X7_R  = 16'b00000001_00000000; // 1;
localparam X7_I  = 16'b00001000_00000000; // 8;

localparam X8_R  = 16'b00000001_00000000; // 1;
localparam X8_I  = 16'b00000111_00000000; // 7;

localparam X9_R  = 16'b00000011_00000000; // 3;
localparam X9_I  = 16'b00000100_00000000; // 4;

localparam X10_R = 16'b00000100_00000000; // 4;
localparam X10_I = 16'b00000011_00000000; // 3;

localparam X11_R = 16'b00000101_00000000; // 5;
localparam X11_I = 16'b00000010_00000000; // 2;

localparam X12_R = 16'b00000110_00000000; // 6;
localparam X12_I = 16'b00000010_00000000; // 2;

localparam X13_R = 16'b00001001_00000000; // 9;
localparam X13_I = 16'b00000011_00000000; // 3;

localparam X14_R = 16'b00000011_00000000; // 3;
localparam X14_I = 16'b00000011_00000000; // 3;

localparam X15_R = 16'b00000010_00000000; // 2;
localparam X15_I = 16'b00000010_00000000; // 2;

localparam X16_R =  16'b0000001_00000000; // 1;
localparam X16_I = 16'b00000100_00000000; // 4;

localparam X17_R = 16'b00000010_00000000; // 2;
localparam X17_I = 16'b00000011_00000000; // 3;

localparam X18_R = 16'b00000100_00000000; // 4;
localparam X18_I = 16'b00000101_00000000; // 5;

localparam X19_R = 16'b00000011_00000000; // 3;
localparam X19_I = 16'b00000001_00000000; // 1;

localparam X20_R = 16'b00000101_00000000; // 5;
localparam X20_I = 16'b00000001_00000000; // 1;

localparam X21_R = 16'b00000111_00000000; // 7;
localparam X21_I = 16'b00001000_00000000; // 8;

localparam X22_R = 16'b00000001_00000000; // 1;
localparam X22_I = 16'b00000110_00000000; // 6;

localparam X23_R = 16'b00001000_00000000; // 8;
localparam X23_I = 16'b00000010_00000000; // 2;

localparam X24_R = 16'b00000110_00000000; // 6;
localparam X24_I = 16'b00000111_00000000; // 7;

localparam X25_R = 16'b00001000_00000000; // 8;
localparam X25_I = 16'b00000001_00000000; // 1;

localparam X26_R = 16'b00000110_00000000; // 6;
localparam X26_I = 16'b00000111_00000000; // 7;

localparam X27_R = 16'b00000101_00000000; // 5;
localparam X27_I = 16'b00000011_00000000; // 3;

localparam X28_R = 16'b00000111_00000000; // 7;
localparam X28_I = 16'b00000101_00000000; // 5;

localparam X29_R = 16'b00001000_00000000; // 8;
localparam X29_I = 16'b00000001_00000000; // 1;

localparam X30_R = 16'b00000101_00000000; // 5;
localparam X30_I = 16'b00000011_00000000; // 3;

localparam X31_R = 16'b00001000_00000000; // 8;
localparam X31_I = 16'b00000011_00000000; // 3;






localparam HIGH = 1'b1;
localparam LOW = 1'b0;

localparam Y_FILE = "ydata.txt";

localparam FPOINT_SHIFT = 2.0**-8;

reg clk;
reg rst;
reg start_r;
wire busy;
wire valid;
reg [1:0] fft_select_r;

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
		    xdata_I_7,
		    xdata_R_8,
			xdata_I_8,
			xdata_R_9,
		    xdata_I_9,
		    xdata_R_10,
		    xdata_I_10,
		    xdata_R_11,
		    xdata_I_11,
		    xdata_R_12,
			xdata_I_12,
			xdata_R_13,
		    xdata_I_13,
		    xdata_R_14,
		    xdata_I_14,
		    xdata_R_15,
		    xdata_I_15,
		    xdata_R_16,
			xdata_I_16,
			xdata_R_17,
		    xdata_I_17,
		    xdata_R_18,
		    xdata_I_18,
		    xdata_R_19,
		    xdata_I_19,
		    xdata_R_20,
			xdata_I_20,
			xdata_R_21,
		    xdata_I_21,
		    xdata_R_22,
		    xdata_I_22,
		    xdata_R_23,
		    xdata_I_23,
		    xdata_R_24,
			xdata_I_24,
			xdata_R_25,
		    xdata_I_25,
		    xdata_R_26,
		    xdata_I_26,
		    xdata_R_27,
		    xdata_I_27,
		    xdata_R_28,
			xdata_I_28,
			xdata_R_29,
		    xdata_I_29,
		    xdata_R_30,
		    xdata_I_30,
		    xdata_R_31,
		    xdata_I_31;

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
		    Xdata_I_7,
		    Xdata_R_8,
		    Xdata_I_8,
		    Xdata_R_9,
		    Xdata_I_9,
		    Xdata_R_10,
		    Xdata_I_10,
		    Xdata_R_11,
		    Xdata_I_11,
		    Xdata_R_12,
		    Xdata_I_12,
		    Xdata_R_13,
		    Xdata_I_13,
		    Xdata_R_14,
		    Xdata_I_14,
		    Xdata_R_15,
		    Xdata_I_15,
		    Xdata_R_16,
		    Xdata_I_16,
		    Xdata_R_17,
		    Xdata_I_17,
		    Xdata_R_18,
		    Xdata_I_18,
		    Xdata_R_19,
		    Xdata_I_19,
		    Xdata_R_20,
		    Xdata_I_20,
		    Xdata_R_21,
		    Xdata_I_21,
		    Xdata_R_22,
		    Xdata_I_22,
		    Xdata_R_23,
		    Xdata_I_23,
		    Xdata_R_24,
		    Xdata_I_24,
		    Xdata_R_25,
		    Xdata_I_25,
		    Xdata_R_26,
		    Xdata_I_26,
		    Xdata_R_27,
		    Xdata_I_27,
		    Xdata_R_28,
		    Xdata_I_28,
		    Xdata_R_29,
		    Xdata_I_29,
		    Xdata_R_30,
		    Xdata_I_30,
		    Xdata_R_31,
		    Xdata_I_31;




 fft_top FFT  (

				.clk(clk),
				.rst(rst),
				.start_i(start_r),
				.fft_select_i(fft_select_r),

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
				.x_8_R_i(xdata_R_8),
				.x_8_I_i(xdata_I_8),
				.x_9_R_i(xdata_R_9),
				.x_9_I_i(xdata_I_9),
				.x_10_R_i(xdata_R_10),
				.x_10_I_i(xdata_I_10),
				.x_11_R_i(xdata_R_11),
				.x_11_I_i(xdata_I_11),
				.x_12_R_i(xdata_R_12),
				.x_12_I_i(xdata_I_12),
				.x_13_R_i(xdata_R_13),
				.x_13_I_i(xdata_I_13),
				.x_14_R_i(xdata_R_14),
				.x_14_I_i(xdata_I_14),
				.x_15_R_i(xdata_R_15),
				.x_15_I_i(xdata_I_15),
				.x_16_R_i(xdata_R_16),
				.x_16_I_i(xdata_I_16),
				.x_17_R_i(xdata_R_17),
				.x_17_I_i(xdata_I_17),
				.x_18_R_i(xdata_R_18),
				.x_18_I_i(xdata_I_18),
				.x_19_R_i(xdata_R_19),
				.x_19_I_i(xdata_I_19),
				.x_20_R_i(xdata_R_20),
				.x_20_I_i(xdata_I_20),
				.x_21_R_i(xdata_R_21),
				.x_21_I_i(xdata_I_21),
				.x_22_R_i(xdata_R_22),
				.x_22_I_i(xdata_I_22),
				.x_23_R_i(xdata_R_23),
				.x_23_I_i(xdata_I_23),
				.x_24_R_i(xdata_R_24),
				.x_24_I_i(xdata_I_24),
				.x_25_R_i(xdata_R_25),
				.x_25_I_i(xdata_I_25),
				.x_26_R_i(xdata_R_26),
				.x_26_I_i(xdata_I_26),
				.x_27_R_i(xdata_R_27),
				.x_27_I_i(xdata_I_27),
				.x_28_R_i(xdata_R_28),
				.x_28_I_i(xdata_I_28),
				.x_29_R_i(xdata_R_29),
				.x_29_I_i(xdata_I_29),
				.x_30_R_i(xdata_R_30),
				.x_30_I_i(xdata_I_30),
				.x_31_R_i(xdata_R_31),
				.x_31_I_i(xdata_I_31),				

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
				.X_8_R_o(Xdata_R_8),
				.X_8_I_o(Xdata_I_8),
				.X_9_R_o(Xdata_R_9),
				.X_9_I_o(Xdata_I_9),
				.X_10_R_o(Xdata_R_10),
				.X_10_I_o(Xdata_I_10),
				.X_11_R_o(Xdata_R_11),
				.X_11_I_o(Xdata_I_11),
				.X_12_R_o(Xdata_R_12),
				.X_12_I_o(Xdata_I_12),
				.X_13_R_o(Xdata_R_13),
				.X_13_I_o(Xdata_I_13),
				.X_14_R_o(Xdata_R_14),
				.X_14_I_o(Xdata_I_14),
				.X_15_R_o(Xdata_R_15),
				.X_15_I_o(Xdata_I_15),
				.X_16_R_o(Xdata_R_16),
				.X_16_I_o(Xdata_I_16),
				.X_17_R_o(Xdata_R_17),
				.X_17_I_o(Xdata_I_17),
				.X_18_R_o(Xdata_R_18),
				.X_18_I_o(Xdata_I_18),
				.X_19_R_o(Xdata_R_19),
				.X_19_I_o(Xdata_I_19),
				.X_20_R_o(Xdata_R_20),
				.X_20_I_o(Xdata_I_20),
				.X_21_R_o(Xdata_R_21),
				.X_21_I_o(Xdata_I_21),
				.X_22_R_o(Xdata_R_22),
				.X_22_I_o(Xdata_I_22),
				.X_23_R_o(Xdata_R_23),
				.X_23_I_o(Xdata_I_23),
				.X_24_R_o(Xdata_R_24),
				.X_24_I_o(Xdata_I_24),
				.X_25_R_o(Xdata_R_25),
				.X_25_I_o(Xdata_I_25),
				.X_26_R_o(Xdata_R_26),
				.X_26_I_o(Xdata_I_26),
				.X_27_R_o(Xdata_R_27),
				.X_27_I_o(Xdata_I_27),
				.X_28_R_o(Xdata_R_28),
				.X_28_I_o(Xdata_I_28),
				.X_29_R_o(Xdata_R_29),
				.X_29_I_o(Xdata_I_29),
				.X_30_R_o(Xdata_R_30),
				.X_30_I_o(Xdata_I_30),
				.X_31_R_o(Xdata_R_31),
				.X_31_I_o(Xdata_I_31),

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

	xdata_R_0   = 0;
	xdata_I_0   = 0;
	xdata_R_1   = 0;
	xdata_I_1   = 0;
	xdata_R_2   = 0;
	xdata_I_2   = 0;
	xdata_R_3   = 0;
	xdata_I_3   = 0;
	xdata_R_4   = 0;
	xdata_I_4   = 0;
	xdata_R_5   = 0;
	xdata_I_5   = 0;
	xdata_R_6   = 0;
	xdata_I_6   = 0;
	xdata_R_7   = 0;
	xdata_I_7   = 0;
	xdata_R_8   = 0;
	xdata_I_8   = 0;
	xdata_R_9   = 0;
	xdata_I_9   = 0;
	xdata_R_10  = 0;
	xdata_I_10  = 0;
	xdata_R_11  = 0;
	xdata_I_11  = 0;
	xdata_R_12  = 0;
	xdata_I_12  = 0;
	xdata_R_13  = 0;
	xdata_I_13  = 0;
	xdata_R_14  = 0;
	xdata_I_14  = 0;
	xdata_R_15  = 0;
	xdata_I_15  = 0;
	xdata_R_16  = 0;
	xdata_I_16  = 0;
	xdata_R_17  = 0;
	xdata_I_17  = 0;
	xdata_R_18  = 0;
	xdata_I_18  = 0;
	xdata_R_19  = 0;
	xdata_I_19  = 0;
	xdata_R_20  = 0;
	xdata_I_20  = 0;
	xdata_R_21  = 0;
	xdata_I_21  = 0;
	xdata_R_22  = 0;
	xdata_I_22  = 0;
	xdata_R_23  = 0;
	xdata_I_23  = 0;
	xdata_R_24  = 0;
	xdata_I_24  = 0;
	xdata_R_25  = 0;
	xdata_I_25  = 0;
	xdata_R_26  = 0;
	xdata_I_26  = 0;
	xdata_R_27  = 0;
	xdata_I_27  = 0;
	xdata_R_28  = 0;
	xdata_I_28  = 0;
	xdata_R_29  = 0;
	xdata_I_29  = 0;
	xdata_R_30  = 0;
	xdata_I_30  = 0;
	xdata_R_31  = 0;
	xdata_I_31  = 0;


	fft_select_r = 0;

	fd_y = $fopen(Y_FILE, "w");


	# 2
	rst = LOW;
	xdata_R_0   = X0_R;
	xdata_I_0   = X0_I;
	xdata_R_1   = X1_R;
	xdata_I_1   = X1_I;
	xdata_R_2   = X2_R;
	xdata_I_2   = X2_I;
	xdata_R_3   = X3_R;
	xdata_I_3   = X3_I;
	xdata_R_4   = X4_R;
	xdata_I_4   = X4_I;
	xdata_R_5   = X5_R;
	xdata_I_5   = X5_I;
	xdata_R_6   = X6_R;
	xdata_I_6   = X6_I;
	xdata_R_7   = X7_R;
	xdata_I_7   = X7_I;
	xdata_R_8   = X8_R;
	xdata_I_8   = X8_I;
	xdata_R_9   = X9_R;
	xdata_I_9   = X9_I;
	xdata_R_10  = X10_R;
	xdata_I_10  = X10_I;
	xdata_R_11  = X11_R;
	xdata_I_11  = X11_I;
	xdata_R_12  = X12_R;
	xdata_I_12  = X12_I;
	xdata_R_13  = X13_R;
	xdata_I_13  = X13_I;
	xdata_R_14  = X14_R;
	xdata_I_14  = X14_I;
	xdata_R_15  = X15_R;
	xdata_I_15  = X15_I;
	xdata_R_16  = X16_R;
	xdata_I_16  = X16_I;
	xdata_R_17  = X17_R;
	xdata_I_17  = X17_I;
	xdata_R_18  = X18_R;
	xdata_I_18  = X18_I;
	xdata_R_19  = X19_R;
	xdata_I_19  = X19_I;
	xdata_R_20  = X20_R;
	xdata_I_20  = X20_I;
	xdata_R_21  = X21_R;
	xdata_I_21  = X21_I;
	xdata_R_22  = X22_R;
	xdata_I_22  = X22_I;
	xdata_R_23  = X23_R;
	xdata_I_23  = X23_I;
	xdata_R_24  = X24_R;
	xdata_I_24  = X24_I;
	xdata_R_25  = X25_R;
	xdata_I_25  = X25_I;
	xdata_R_26  = X26_R;
	xdata_I_26  = X26_I;
	xdata_R_27  = X27_R;
	xdata_I_27  = X27_I;
	xdata_R_28  = X28_R;
	xdata_I_28  = X28_I;
	xdata_R_29  = X29_R;
	xdata_I_29  = X29_I;
	xdata_R_30  = X30_R;
	xdata_I_30  = X30_I;
	xdata_R_31  = X31_R;
	xdata_I_31  = X31_I;


	fft_select_r = 2'd3;

	# 2
	start_r = HIGH;
	# 2
	start_r = LOW;

end

always @(posedge clk) begin
	
	if(valid) begin

		$fwrite(fd_y, "0.  %f  %f\n" , $signed(Xdata_R_0)*FPOINT_SHIFT  ,  $signed(Xdata_I_0)*FPOINT_SHIFT  );
		$fwrite(fd_y, "1.  %f  %f\n" , $signed(Xdata_R_1)*FPOINT_SHIFT  ,  $signed(Xdata_I_1)*FPOINT_SHIFT  );
		$fwrite(fd_y, "2.  %f  %f\n" , $signed(Xdata_R_2)*FPOINT_SHIFT  ,  $signed(Xdata_I_2)*FPOINT_SHIFT  );
		$fwrite(fd_y, "3.  %f  %f\n" , $signed(Xdata_R_3)*FPOINT_SHIFT  ,  $signed(Xdata_I_3)*FPOINT_SHIFT  );
		$fwrite(fd_y, "4.  %f  %f\n" , $signed(Xdata_R_4)*FPOINT_SHIFT  ,  $signed(Xdata_I_4)*FPOINT_SHIFT  );
		$fwrite(fd_y, "5.  %f  %f\n" , $signed(Xdata_R_5)*FPOINT_SHIFT  ,  $signed(Xdata_I_5)*FPOINT_SHIFT  );
		$fwrite(fd_y, "6.  %f  %f\n" , $signed(Xdata_R_6)*FPOINT_SHIFT  ,  $signed(Xdata_I_6)*FPOINT_SHIFT  );
		$fwrite(fd_y, "7.  %f  %f\n" , $signed(Xdata_R_7)*FPOINT_SHIFT  ,  $signed(Xdata_I_7)*FPOINT_SHIFT  );
		$fwrite(fd_y, "8.  %f  %f\n" , $signed(Xdata_R_8)*FPOINT_SHIFT  ,  $signed(Xdata_I_8)*FPOINT_SHIFT  );
		$fwrite(fd_y, "9.  %f  %f\n" , $signed(Xdata_R_9)*FPOINT_SHIFT  ,  $signed(Xdata_I_9)*FPOINT_SHIFT  );
		$fwrite(fd_y, "10. %f  %f\n" , $signed(Xdata_R_10)*FPOINT_SHIFT ,  $signed(Xdata_I_10)*FPOINT_SHIFT );
		$fwrite(fd_y, "11. %f  %f\n" , $signed(Xdata_R_11)*FPOINT_SHIFT ,  $signed(Xdata_I_11)*FPOINT_SHIFT );
		$fwrite(fd_y, "12. %f  %f\n" , $signed(Xdata_R_12)*FPOINT_SHIFT ,  $signed(Xdata_I_12)*FPOINT_SHIFT );
		$fwrite(fd_y, "13. %f  %f\n" , $signed(Xdata_R_13)*FPOINT_SHIFT ,  $signed(Xdata_I_13)*FPOINT_SHIFT );
		$fwrite(fd_y, "14. %f  %f\n" , $signed(Xdata_R_14)*FPOINT_SHIFT ,  $signed(Xdata_I_14)*FPOINT_SHIFT );
		$fwrite(fd_y, "15. %f  %f\n" , $signed(Xdata_R_15)*FPOINT_SHIFT ,  $signed(Xdata_I_15)*FPOINT_SHIFT );
		$fwrite(fd_y, "16. %f  %f\n" , $signed(Xdata_R_16)*FPOINT_SHIFT ,  $signed(Xdata_I_16)*FPOINT_SHIFT );
		$fwrite(fd_y, "17. %f  %f\n" , $signed(Xdata_R_17)*FPOINT_SHIFT ,  $signed(Xdata_I_17)*FPOINT_SHIFT );
		$fwrite(fd_y, "18. %f  %f\n" , $signed(Xdata_R_18)*FPOINT_SHIFT ,  $signed(Xdata_I_18)*FPOINT_SHIFT );
		$fwrite(fd_y, "19. %f  %f\n" , $signed(Xdata_R_19)*FPOINT_SHIFT ,  $signed(Xdata_I_19)*FPOINT_SHIFT );
		$fwrite(fd_y, "20. %f  %f\n" , $signed(Xdata_R_20)*FPOINT_SHIFT ,  $signed(Xdata_I_20)*FPOINT_SHIFT );
		$fwrite(fd_y, "21. %f  %f\n" , $signed(Xdata_R_21)*FPOINT_SHIFT ,  $signed(Xdata_I_21)*FPOINT_SHIFT );
		$fwrite(fd_y, "22. %f  %f\n" , $signed(Xdata_R_22)*FPOINT_SHIFT ,  $signed(Xdata_I_22)*FPOINT_SHIFT );
		$fwrite(fd_y, "23. %f  %f\n" , $signed(Xdata_R_23)*FPOINT_SHIFT ,  $signed(Xdata_I_23)*FPOINT_SHIFT );
		$fwrite(fd_y, "24. %f  %f\n" , $signed(Xdata_R_24)*FPOINT_SHIFT ,  $signed(Xdata_I_24)*FPOINT_SHIFT );
		$fwrite(fd_y, "25. %f  %f\n" , $signed(Xdata_R_25)*FPOINT_SHIFT ,  $signed(Xdata_I_25)*FPOINT_SHIFT );
		$fwrite(fd_y, "26. %f  %f\n" , $signed(Xdata_R_26)*FPOINT_SHIFT ,  $signed(Xdata_I_26)*FPOINT_SHIFT );
		$fwrite(fd_y, "27. %f  %f\n" , $signed(Xdata_R_27)*FPOINT_SHIFT ,  $signed(Xdata_I_27)*FPOINT_SHIFT );
		$fwrite(fd_y, "28. %f  %f\n" , $signed(Xdata_R_28)*FPOINT_SHIFT ,  $signed(Xdata_I_28)*FPOINT_SHIFT );
		$fwrite(fd_y, "29. %f  %f\n" , $signed(Xdata_R_29)*FPOINT_SHIFT ,  $signed(Xdata_I_29)*FPOINT_SHIFT );
		$fwrite(fd_y, "30. %f  %f\n" , $signed(Xdata_R_30)*FPOINT_SHIFT ,  $signed(Xdata_I_30)*FPOINT_SHIFT );
		$fwrite(fd_y, "31. %f  %f\n" , $signed(Xdata_R_31)*FPOINT_SHIFT ,  $signed(Xdata_I_31)*FPOINT_SHIFT );

		$finish;


	end



end



endmodule