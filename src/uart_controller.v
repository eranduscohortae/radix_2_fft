`include "constants_uart.vh"


module uart_controller(

						input clk,
						input rst,

						// Interface 
						input  [15:0] fft_R_coefficient_i,
						input  [15:0] fft_I_coefficient_i,
						input  flag_tx_start_i,
										
						output reg [15:0] fft_R_sample_o,
						output reg [15:0] fft_I_sample_o,
						output reg [1:0] fft_select_o,
						
						output reg flag_sample_valid_o,
						output reg flag_rx_finished_o,
						
						input uart_bit_i,
						output uart_bit_o
						
					  );

					  
					  
localparam LOW_1 = 1'b0;		
localparam HIGH_1 = 1'b1;


// UART Low Level Driver
wire       finished_tx      , finished_rx;
reg        finished_rx_r, finished_tx_r;

wire [7:0] uart_byte_rx;
reg [7:0]  uart_byte_rx_r, uart_byte_rx_p, uart_byte_tx_r;

reg        ena_tx_r, ena_rx_r;
wire       ena_tx, ena_rx;

reg        uart_bit_rx_r      , uart_bit_tx_r;


// Interface Data
reg [15:0] fft_R_coefficient_r, fft_I_coefficient_r, fft_R_coefficient_p, fft_I_coefficient_p;
reg [15:0] fft_R_sample_r , fft_I_sample_r, fft_R_sample_p, fft_I_sample_p;
reg flag_tx_start_r;

// Internal 
reg [4:0]  current_state, next_state;
reg byte_cnt;
wire stream_rx_finished;
wire stream_tx_finished;

wire clk_uart;
								  
								  
    pll_uart PLL(
                    .inclk0(clk),
                    .c0(clk_uart)
    );								  
								  


uart_rx  UART_RX(

					.clk_uart(clk_uart),
					.rst(rst),
					.enable_rx_i(ena_rx),

					
					.uart_byte_o(uart_byte_rx),
					.finished_rx_o(finished_rx),
					.uart_bit_i(uart_bit_i)
				);

uart_tx  UART_TX(

					.clk_uart(clk_uart),
					.rst(rst),
					.enable_tx_i(ena_tx),
					.uart_byte_i(uart_byte_tx_r),
					.finished_tx_o(finished_tx),
					.uart_bit_o(uart_bit_o)
				);



assign stream_rx_finished     = ( (fft_select_o == `SELECT_FFT8)  && (byte_cnt == 32'd8)  || 
										    (fft_select_o   == `SELECT_FFT16) && (byte_cnt == 32'd16) || 
											 (fft_select_o   == `SELECT_FFT32) && (byte_cnt == 32'd32)    );					

assign stream_tx_finished     = ( (fft_select_o == `SELECT_FFT8)  && (byte_cnt == 32'd8)  || 
											 (fft_select_o == `SELECT_FFT16)   && (byte_cnt == 32'd16) || 
											 (fft_select_o == `SELECT_FFT32)   && (byte_cnt == 32'd32)    );	
								  
								  
								  
    
    always @(posedge clk) begin
        
        if(rst) begin

            current_state 				<= `FSM_IDLE;
            fft_R_coefficient_r		<= 16'd0;
				fft_I_coefficient_r     <= 16'd0;
				fft_R_sample_r 			<= 16'd0; 
				fft_I_sample_r 			<= 16'd0;
        end
        else begin

            current_state 			   <= next_state;
				flag_tx_start_r         <= flag_tx_start_i;
				uart_byte_rx_r          <= uart_byte_rx_p;

        end
    end


    
    always @(*) begin


    	  fft_R_sample_p 	     = fft_R_sample_r;
		  fft_I_sample_p 	     = fft_I_sample_r;

		  fft_R_coefficient_p  = fft_R_coefficient_r;
		  fft_I_coefficient_p  = fft_I_coefficient_r;
		  
		  uart_byte_rx_p 		  = uart_byte_rx_r;
		  
		  finished_rx_r  		  = finished_rx;
		  finished_tx_r 		  = finished_tx;

        next_state  			  = current_state;


        flag_sample_valid_o  = LOW_1;
		  flag_rx_finished_o   = LOW_1;

        // Check for 
        if(stream_rx_finished) begin
        	next_state = `FSM_RX_STOP;
        end
        if(stream_tx_finished) begin
        	next_state = `FSM_TX_STOP;
        end


        case (current_state)

            `FSM_IDLE: begin

                fft_R_sample_r 				   = 15'd0;
                fft_I_sample_r 				   = 15'd0;
					 
					 ena_rx_r 				         = HIGH_1;
					 ena_tx_r 				         = LOW_1;

                if( (finished_rx_r == HIGH_1) && (uart_byte_rx_p == `START_BYTE) ) begin

                   	next_state 				   = `FSM_RX_FFT_SELECT;
							

                end

            end

            `FSM_RX_FFT_SELECT: begin

                if(finished_rx_r == HIGH_1) begin
                	
                	fft_select_o   			   = uart_byte_rx_p[1:0];
                	next_state     			   = `FSM_RX_SAMPLE_R_INT;
						flag_rx_finished_o       	=  HIGH_1;

                end

            end

            `FSM_RX_SAMPLE_R_INT: begin
         	
					if(finished_rx_r == HIGH_1) begin

                	fft_R_sample_p[15:8]       = uart_byte_rx_p;
                	next_state                 = `FSM_RX_SAMPLE_R_FRAC;

						end
				end

            `FSM_RX_SAMPLE_R_FRAC: begin
         	
				if(finished_rx_r == HIGH_1) begin

                	fft_R_sample_p[7:0]        = uart_byte_rx_p;
                	next_state                 = `FSM_RX_SAMPLE_I_INT;
                	
                end
            end

            `FSM_RX_SAMPLE_I_INT: begin
         	
				if(finished_rx_r == HIGH_1) begin

                	fft_I_sample_p[15:8]       = uart_byte_rx_p;
                	next_state                 = `FSM_RX_SAMPLE_I_FRAC;

                end
            end

            `FSM_RX_SAMPLE_I_FRAC: begin
         	
				if(finished_rx_r == HIGH_1) begin

                	fft_I_sample_p[7:0]        = uart_byte_rx_p;
                	next_state                 = `FSM_RX_SAMPLE_R_INT;
                	
                end
            end


            `FSM_RX_STOP: begin
                    
                if( (finished_rx_r == HIGH_1) && (uart_byte_rx_p == `STOP_BYTE) ) begin
                    flag_rx_finished_o    	 = HIGH_1;
                    next_state     			   = `FSM_TX_START;
                end

            end


            `FSM_TX_START: begin
         	
				if( (finished_tx_r == HIGH_1) && (flag_tx_start_r == HIGH_1) ) begin

                	uart_byte_tx_r             = `START_BYTE;
                	next_state                 = `FSM_RX_SAMPLE_R_INT;

                end
            end


            `FSM_TX_COEFF_R_INT: begin
         	
				if(finished_tx_r == HIGH_1) begin

                	uart_byte_tx_r             = fft_R_coefficient_p[15:8];
                	next_state                 = `FSM_TX_COEFF_R_FRAC;

                end
            end

            `FSM_TX_COEFF_R_FRAC: begin
         	
				if(finished_tx_r == HIGH_1) begin

                	uart_byte_tx_r             = fft_R_coefficient_p[7:0];
                	next_state                 = `FSM_TX_COEFF_I_INT;

                end
            end

            `FSM_TX_COEFF_I_INT: begin
         	
				if(finished_tx_r == HIGH_1) begin

                	uart_byte_tx_r             = fft_I_coefficient_p[15:8];
                	next_state                 = `FSM_TX_COEFF_I_FRAC;

                end
            end

            `FSM_TX_COEFF_I_FRAC: begin
         	
				if(finished_tx_r == HIGH_1) begin

                	uart_byte_tx_r             = fft_I_coefficient_p[7:0];
                	next_state                 = `FSM_TX_COEFF_R_INT;

                end
            end


            `FSM_TX_STOP: begin
                    
                if(finished_tx_r == HIGH_1) begin

                    uart_byte_tx_r             = `STOP_BYTE;
                    next_state     		 	   = `FSM_IDLE;
                    ena_tx_r 				   = LOW_1;
                    ena_rx_r 				   = HIGH_1;

                end

            end       

        endcase


    end

	 
assign ena_tx = ena_tx_r;
assign ena_rx = ena_rx_r;


endmodule