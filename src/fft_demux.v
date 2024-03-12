`include "constants.vh"

module fft_demux(	
					input start_i,
					input [1:0] fft_select_i,

					output start_fft8_o,
					output start_fft16_o,
					output start_fft32_o

					);


reg start_fft8_r, start_fft16_r, start_fft32_r;



always @(*) begin
	
	case(fft_select_i) 
			
		`START_FFT8: begin
			start_fft8_r  = `HIGH;
			start_fft16_r = `LOW;
			start_fft32_r = `LOW;
		end


		`START_FFT16: begin
			start_fft8_r  = `LOW;
			start_fft16_r = `HIGH;
			start_fft32_r = `LOW;
		end

		`START_FFT32: begin
			start_fft8_r  = `LOW;
			start_fft16_r = `LOW;
			start_fft32_r = `HIGH;
		end

		default: begin
			start_fft8_r  = `LOW;
			start_fft16_r = `LOW;
			start_fft32_r = `LOW;
		end 


	endcase

end


assign start_fft8_o  = start_fft8_r;
assign start_fft16_o = start_fft16_r;
assign start_fft32_o = start_fft32_r;



endmodule