`include "constants.vh"

module fft_alu(
					input wire clk,
					input wire rst,


					input wire signed [15:0] op_a_i,
					input wire signed [15:0] op_b_i,
					input wire signed [15:0] op_c_i,
					input wire [3:0] alu_mode_i,


					output reg signed [15:0] res_o

			  );


reg [31:0] reg_temp;

always @(*) begin
	
	case(alu_mode_i)

		`ALUMODE_IDLE: begin
			res_o = 'd0;		// muss nicht, kann aber
		end

		`ALUMODE_A_ADD_B: begin
			res_o = op_a_i + op_b_i;
		end

		`ALUMODE_A_SUB_B: begin
			res_o = op_a_i - op_b_i;
		end

		`ALUMODE_A_SIGN_B: begin
			res_o = (op_b_i) ? -op_a_i : op_a_i;
		end

		`ALUMODE_A_ADDSUB_C: begin
			res_o = op_a_i + op_c_i;
		end

		`ALUMODE_A_MULT_B: begin
			res_o = op_a_i * op_b_i;
		end

	endcase

end


endmodule 