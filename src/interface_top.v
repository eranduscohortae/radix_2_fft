`include "constants_uart.vh"


module interface_top(
								input clk,
				
							   input uart_bit_i,
								output uart_bit_o				
					  );

					  
					  
localparam LOW_1 = 1'b0;		
localparam HIGH_1 = 1'b1;				

reg [15:0]  x_0_R_r ,  x_0_I_r,
   		   x_1_R_r ,  x_1_I_r, 
   		   x_2_R_r ,  x_2_I_r, 
   		   x_3_R_r ,  x_3_I_r, 
   		   x_4_R_r ,  x_4_I_r, 
   		   x_5_R_r ,  x_5_I_r,
   		   x_6_R_r ,  x_6_I_r, 
   		   x_7_R_r ,  x_7_I_r,
   		   x_8_R_r ,  x_8_I_r, 
   		   x_9_R_r ,  x_9_I_r, 
   		   x_10_R_r, x_10_I_r,
   		   x_11_R_r, x_11_I_r,
   		   x_12_R_r, x_12_I_r,
   		   x_13_R_r, x_13_I_r,
   		   x_14_R_r, x_14_I_r,
   		   x_15_R_r, x_15_I_r,
   		   x_16_R_r, x_16_I_r,
   		   x_17_R_r, x_17_I_r,
   		   x_18_R_r, x_18_I_r,
   		   x_19_R_r, x_19_I_r,
   		   x_20_R_r, x_20_I_r,
   		   x_21_R_r, x_21_I_r,
   		   x_22_R_r, x_22_I_r,
   		   x_23_R_r, x_23_I_r,
   		   x_24_R_r, x_24_I_r,
   		   x_25_R_r, x_25_I_r,
   		   x_26_R_r, x_26_I_r,
   		   x_27_R_r, x_27_I_r,
   		   x_28_R_r, x_28_I_r,
   		   x_29_R_r, x_29_I_r,
   		   x_30_R_r, x_30_I_r,
   		   x_31_R_r, x_31_I_r;

wire [15:0] X_0_R ,  X_0_I,
   		   X_1_R ,  X_1_I,
   		   X_2_R ,  X_2_I,
   		   X_3_R ,  X_3_I,
   		   X_4_R ,  X_4_I,
   		   X_5_R ,  X_5_I,
   		   X_6_R ,  X_6_I,
   		   X_7_R ,  X_7_I,
   		   X_8_R ,  X_8_I,
   		   X_9_R ,  X_9_I,
   		   X_10_R,  X_10_I,
   		   X_11_R,  X_11_I,
   		   X_12_R,  X_12_I,
   		   X_13_R,  X_13_I,
   		   X_14_R,  X_14_I,
   		   X_15_R,  X_15_I,
   		   X_16_R,  X_16_I,
   		   X_17_R,  X_17_I,
   		   X_18_R,  X_18_I,
   		   X_19_R,  X_19_I,
   		   X_20_R,  X_20_I,
   		   X_21_R,  X_21_I,
   		   X_22_R,  X_22_I,
   		   X_23_R,  X_23_I,
   		   X_24_R,  X_24_I,
   		   X_25_R,  X_25_I,
   		   X_26_R,  X_26_I,
   		   X_27_R,  X_27_I,
   		   X_28_R,  X_28_I,
   		   X_29_R,  X_29_I,
   		   X_30_R,  X_30_I,
   		   X_31_R,  X_31_I;				
				
				
reg [15:0]  X_0_R_r ,  X_0_I_r,
   		   X_1_R_r ,  X_1_I_r,
   		   X_2_R_r ,  X_2_I_r,
   		   X_3_R_r ,  X_3_I_r,
   		   X_4_R_r ,  X_4_I_r,
   		   X_5_R_r ,  X_5_I_r,
   		   X_6_R_r ,  X_6_I_r,
   		   X_7_R_r ,  X_7_I_r,
   		   X_8_R_r ,  X_8_I_r,
   		   X_9_R_r ,  X_9_I_r,
   		   X_10_R_r,  X_10_I_r,
   		   X_11_R_r,  X_11_I_r,
   		   X_12_R_r,  X_12_I_r,
   		   X_13_R_r,  X_13_I_r,
   		   X_14_R_r,  X_14_I_r,
   		   X_15_R_r,  X_15_I_r,
   		   X_16_R_r,  X_16_I_r,
   		   X_17_R_r,  X_17_I_r,
   		   X_18_R_r,  X_18_I_r,
   		   X_19_R_r,  X_19_I_r,
   		   X_20_R_r,  X_20_I_r,
   		   X_21_R_r,  X_21_I_r,
   		   X_22_R_r,  X_22_I_r,
   		   X_23_R_r,  X_23_I_r,
   		   X_24_R_r,  X_24_I_r,
   		   X_25_R_r,  X_25_I_r,
   		   X_26_R_r,  X_26_I_r,
   		   X_27_R_r,  X_27_I_r,
   		   X_28_R_r,  X_28_I_r,
   		   X_29_R_r,  X_29_I_r,
   		   X_30_R_r,  X_30_I_r,
   		   X_31_R_r,  X_31_I_r;
	




	

// Data to transfer
wire [15:0] fft_R_sample, fft_I_sample;				
reg  [15:0] fft_R_sample_r, fft_I_sample_r,fft_R_sample_p, fft_I_sample_p;

wire [15:0] fft_R_coefficient, fft_I_coefficient;
reg  [15:0] fft_R_coefficient_r, fft_I_coefficient_r;



// Flags UART INTERFACE
wire flag_rx_finished;
reg  flag_rx_finished_r;

wire flag_sample_valid;
reg  flag_sample_valid_r;

wire flag_tx_start;
reg  flag_tx_start_r;


// Flags FFT
wire flag_fft_start;
reg  flag_fft_start_r;

wire flag_fft_finished;
reg  flag_fft_finished_r;


// 


reg rst;

// FFT Selection
wire fft_select;
reg [1:0] fft_select_r, fft_select_p, fft_select_input_r;

// FSM 
reg [6:0] current_state, next_state;

  
	 
	 
	 
	 
	 uart_controller UART_CTRL(
										
											.clk(clk),
											.rst(rst),
											
											// Data to transfer
											.fft_R_coefficient_i(fft_R_coefficient),
											.fft_I_coefficient_i(fft_I_coefficient),
											.fft_R_sample_o(fft_R_sample),
											.fft_I_sample_o(fft_I_sample),
											
											// Flags
											.flag_rx_finished_r(flag_rx_finished),
											.flag_sample_valid_o(flag_sample_valid),
											.flag_fft_start_o(flag_tx_start),
											
											// Selection FFT
											.fft_select_o(fft_select),
											
											// UART Wiring
											.uart_bit_i(uart_bit_i),
											.uart_bit_o(uart_bit_o)
										
										);
										
										
	 fft_top       FFT         (
	 
											.clk(clk),
											.rst(rst),
											
											
											.start_i(),
											.fft_select_i(fft_select),
											.fft_start_o(flag_fft_start),
											.valid_o(flag_fft_finished),
											
											.x_0_R_i(x_0_R_r),
											.x_0_I_i(x_0_I_r),
											.x_1_R_i(x_1_R_r),
											.x_1_I_i(x_1_I_r),
											.x_2_R_i(x_2_R_r),
											.x_2_I_i(x_2_I_r),
											.x_3_R_i(x_3_R_r),
											.x_3_I_i(x_3_I_r),
											.x_4_R_i(x_4_R_r),
											.x_4_I_i(x_4_I_r),
											.x_5_R_i(x_5_R_r),
											.x_5_I_i(x_5_I_r),
											.x_6_R_i(x_6_R_r),
											.x_6_I_i(x_6_I_r),
											.x_7_R_i(x_7_R_r),
											.x_7_I_i(x_7_I_r),
											.x_8_R_i(x_8_R_r),
											.x_8_I_i(x_8_I_r),
											.x_9_R_i(x_9_R_r),
											.x_9_I_i(x_9_I_r),
											.x_10_R_i(x_10_R_r),
											.x_10_I_i(x_10_I_r),
											.x_11_R_i(x_11_R_r),
											.x_11_I_i(x_11_I_r),
											.x_12_R_i(x_12_R_r),
											.x_12_I_i(x_12_I_r),
											.x_13_R_i(x_13_R_r),
											.x_13_I_i(x_13_I_r),
											.x_14_R_i(x_14_R_r),
											.x_14_I_i(x_14_I_r),
											.x_15_R_i(x_15_R_r),
											.x_15_I_i(x_15_I_r),
											.x_16_R_i(x_16_R_r),
											.x_16_I_i(x_16_I_r),
											.x_17_R_i(x_17_R_r),
											.x_17_I_i(x_17_I_r),
											.x_18_R_i(x_18_R_r),
											.x_18_I_i(x_18_I_r),
											.x_19_R_i(x_19_R_r),
											.x_19_I_i(x_19_I_r),
											.x_20_R_i(x_20_R_r),
											.x_20_I_i(x_20_I_r),
											.x_21_R_i(x_21_R_r),
											.x_21_I_i(x_21_I_r),
											.x_22_R_i(x_22_R_r),
											.x_22_I_i(x_22_I_r),
											.x_23_R_i(x_23_R_r),
											.x_23_I_i(x_23_I_r),
											.x_24_R_i(x_24_R_r),
											.x_24_I_i(x_24_I_r),
											.x_25_R_i(x_25_R_r),
											.x_25_I_i(x_25_I_r),
											.x_26_R_i(x_26_R_r),
											.x_26_I_i(x_26_I_r),
											.x_27_R_i(x_27_R_r),
											.x_27_I_i(x_27_I_r),
											.x_28_R_i(x_28_R_r),
											.x_28_I_i(x_28_I_r),
											.x_29_R_i(x_29_R_r),
											.x_29_I_i(x_29_I_r),
											.x_30_R_i(x_30_R_r),
											.x_30_I_i(x_30_I_r),
											.x_31_R_i(x_31_R_r),
											.x_31_I_i(x_31_I_r),
											
											
											.X_0_R_o(X_0_R),
											.X_0_I_o(X_0_I),
											.X_1_R_o(X_1_R),
											.X_1_I_o(X_1_I),
											.X_2_R_o(X_2_R),
											.X_2_I_o(X_2_I),
											.X_3_R_o(X_3_R),
											.X_3_I_o(X_3_I),
											.X_4_R_o(X_4_R),
											.X_4_I_o(X_4_I),
											.X_5_R_o(X_5_R),
											.X_5_I_o(X_5_I),
											.X_6_R_o(X_6_R),
											.X_6_I_o(X_6_I),
											.X_7_R_o(X_7_R),
											.X_7_I_o(X_7_I),
											.X_8_R_o(X_8_R),
											.X_8_I_o(X_8_I),
											.X_9_R_o(X_9_R),
											.X_9_I_o(X_9_I),
											.X_10_R_o(X_10_R),
											.X_10_I_o(X_10_I),
											.X_11_R_o(X_11_R),
											.X_11_I_o(X_11_I),
											.X_12_R_o(X_12_R),
											.X_12_I_o(X_12_I),
											.X_13_R_o(X_13_R),
											.X_13_I_o(X_13_I),
											.X_14_R_o(X_14_R),
											.X_14_I_o(X_14_I),
											.X_15_R_o(X_15_R),
											.X_15_I_o(X_15_I),
											.X_16_R_o(X_16_R),
											.X_16_I_o(X_16_I),
											.X_17_R_o(X_17_R),
											.X_17_I_o(X_17_I),
											.X_18_R_o(X_18_R),
											.X_18_I_o(X_18_I),
											.X_19_R_o(X_19_R),
											.X_19_I_o(X_19_I),
											.X_20_R_o(X_20_R),
											.X_20_I_o(X_20_I),
											.X_21_R_o(X_21_R),
											.X_21_I_o(X_21_I),
											.X_22_R_o(X_22_R),
											.X_22_I_o(X_22_I),
											.X_23_R_o(X_23_R),
											.X_23_I_o(X_23_I),
											.X_24_R_o(X_24_R),
											.X_24_I_o(X_24_I),
											.X_25_R_o(X_25_R),
											.X_25_I_o(X_25_I),
											.X_26_R_o(X_26_R),
											.X_26_I_o(X_26_I),
											.X_27_R_o(X_27_R),
											.X_27_I_o(X_27_I),
											.X_28_R_o(X_28_R),
											.X_28_I_o(X_28_I),
											.X_29_R_o(X_29_R),
											.X_29_I_o(X_29_I),
											.X_30_R_o(X_30_R),
											.X_30_I_o(X_30_I),
											.X_31_R_o(X_31_R),
											.X_31_I_o(X_31_I)
											
							
										);




    // FSM States
    always @(posedge clk) begin
        
        if(rst) begin

            current_state 			<= `FSM_IDLE;	
				rst 							<= rst;
	

				

        end
        else begin
				
				// FSM
            current_state 			   <= next_state;
				
				// UART_INTERFACE
				flag_sample_valid_r     <= flag_sample_valid;
				flag_rx_finished_r      <= flag_rx_finished;
				
				// Select FFT
				fft_select_r            <= fft_select_p;
				fft_select_input_r      <= fft_select;
				
				
				// Datapath
				fft_R_sample_r          <= fft_R_sample;
				fft_I_sample_r          <= fft_I_sample;
				fft_R_coefficient_r     <= fft_R_coefficient;
				fft_I_coefficient_r     <= fft_I_coefficient;
				
				// 
				
				
        end
    end
    // UART FSM
    always @(*) begin

        next_state  		 = current_state;
		  fft_select_p     = fft_select_r;
		  flag_tx_start_r  = LOW_1;
		  
		  
		  

        case (current_state)

            `FSM_IDLE: begin

                if(flag_rx_finished_r == HIGH_1) begin

                   	next_state 			= `FSM_SAMPLE_0;
							fft_select_p 		= fft_select_input_r;

                end

            end


            `FSM_SAMPLE_0: begin
         	
					if(flag_sample_valid_r == HIGH_1) begin

						x_0_R_r 		         	= fft_R_sample_r;
						x_0_I_r         	   	= fft_I_sample_r;
                	next_state      	   	= `FSM_SAMPLE_1;

               end
            end

            `FSM_SAMPLE_1: begin
         	
					if(flag_sample_valid_r == HIGH_1) begin

						x_1_R_r 		       		= fft_R_sample_r;
						x_1_I_r         	  		= fft_I_sample_r;
                	next_state      	   	= `FSM_SAMPLE_2;


                end
            end

            `FSM_SAMPLE_2: begin
         	
				if(flag_sample_valid_r == HIGH_1) begin

					x_2_R_r 		       = fft_R_sample_r;
					x_2_I_r         	   = fft_I_sample_r;
                	next_state      	   = `FSM_SAMPLE_3;

                end
            end

            `FSM_SAMPLE_3: begin
         	
				if(flag_sample_valid_r == HIGH_1) begin

					x_3_R_r 		       = fft_R_sample_r;
					x_3_I_r         	   = fft_I_sample_r;
                	next_state      	   = `FSM_SAMPLE_4;

                end
            end

            `FSM_SAMPLE_4: begin
         	
				if(flag_sample_valid_r == HIGH_1) begin

					x_4_R_r 		       = fft_R_sample_r;
					x_4_I_r         	   = fft_I_sample_r;
                	next_state      	   = `FSM_SAMPLE_5;

                end
            end

            `FSM_SAMPLE_5: begin
         	
				if(flag_sample_valid_r == HIGH_1) begin

					x_5_R_r 		       = fft_R_sample_r;
					x_5_I_r         	   = fft_I_sample_r;
                	next_state      	   = `FSM_SAMPLE_6;

                end
            end

            `FSM_SAMPLE_6: begin
         	
				if(flag_sample_valid_r == HIGH_1) begin

					x_6_R_r 		            = fft_R_sample_r;
					x_6_I_r         	      = fft_I_sample_r;
                	next_state      	   = `FSM_SAMPLE_7;

                end
            end

            `FSM_SAMPLE_7: begin
         	
					if(flag_sample_valid_r == HIGH_1) begin

						x_7_R_r 		         =  fft_R_sample_r;
						x_7_I_r         	   =  fft_I_sample_r;
					
					/*
						if(fft_select_r == SELECT_FFT8) begin
							next_state    	   = `FSM_SAMPLE_8;
						end
						else begin
							next_state    	   = `FSM_SAMPLE_9;
						end

					*/
                
					end
				end
				


            `FSM_SAMPLE_8: begin
         	
					if(flag_sample_valid_r == HIGH_1) begin

						x_8_R_r 		       =  fft_R_sample_r;
						x_8_I_r         	   =  fft_I_sample_r;
						next_state      	   = `FSM_SAMPLE_3;

                end
            end
				
				
				

            `FSM_SAMPLE_9: begin
         	
					if(flag_sample_valid_r == HIGH_1) begin

						x_9_R_r 		       =  fft_R_sample_r;
						x_9_I_r         	   =  fft_I_sample_r;
						next_state      	   = `FSM_SAMPLE_1;

                end
            end

            `FSM_SAMPLE_10: begin
         	
					if(flag_sample_valid_r == HIGH_1) begin

						x_10_R_r 		       = fft_R_sample_r;
						x_10_I_r         	   =  fft_I_sample_r;
						next_state      	   = `FSM_SAMPLE_11;
						rst                = HIGH_1;

                end
            end

        endcase


    end



assign flag_tx_start     = flag_tx_start_r;
assign flag_fft_start  = flag_fft_start_r;



endmodule