`include "constants_uart.vh"


module uart_tx(
				input clk_uart,
				input rst,
				input enable_tx_i,
				input [7:0] uart_byte_i,

				output reg uart_bit_o,
				output finished_tx_o
			  );


localparam LOW_1 = 1'b0;		
localparam HIGH_1 = 1'b1;

// Declaration FSM
reg [4:0] current_state, next_state;
reg enable_tx_r;


// Declaration
reg uart_bit_r;
reg [7:0] uart_data_r, uart_byte_r, uart_byte_p; // uart_byte_p = persistent register
reg finished_tx_r;


	

	    // FSM States
    always @(posedge clk_uart) begin
        
        if(rst) begin

            current_state <= `FSM_IDLE;
            uart_bit_r    <= LOW_1;
            enable_tx_r   <= LOW_1;
            uart_data_r   <= 8'd0;

        end
        else begin

            current_state <= next_state;
            uart_data_r   <= uart_byte_i;
            uart_byte_r   <= uart_byte_p;
            enable_tx_r   <= enable_tx_i;

        end

    end


    // UART FSM
    always @(*) begin

        uart_byte_p    = uart_byte_r;
        next_state     = current_state;
        uart_bit_r     = HIGH_1;
        finished_tx_r  = LOW_1;

        case (current_state)

            `FSM_IDLE: begin

                uart_byte_p = 8'd0;

                if(enable_tx_i == LOW_1) begin

                    uart_byte_p  = uart_data_r;
                    uart_bit_o   = LOW_1;
                    next_state   = `FSM_WI;

                end

            end

            `FSM_WI: begin

                next_state     = `FSM_B0;

            end

            `FSM_B0: begin
         
                uart_bit_o     = uart_byte_p[0];
                next_state     = `FSM_W0;

            end

            `FSM_W0: begin
                next_state     = `FSM_B1;
            end

            `FSM_B1: begin

                uart_bit_o     = uart_byte_p[1];
                next_state     = `FSM_W1;

            end

            `FSM_W1: begin
                next_state     = `FSM_B2;
            end

            `FSM_B2: begin

                uart_bit_o     = uart_byte_p[2];
                next_state     = `FSM_W2;

            end

            `FSM_W2: begin
                next_state     = `FSM_B3;
            end

            `FSM_B3: begin

                uart_bit_o     = uart_byte_p[3];
                next_state     = `FSM_W3;

            end

            `FSM_W3: begin 
                next_state     = `FSM_B4;
            end

            `FSM_B4: begin
         
                uart_bit_o     = uart_byte_p[4];
                next_state     = `FSM_W4;
            end

            `FSM_W4: begin
                next_state     = `FSM_B5;
            end

            `FSM_B5: begin

                uart_bit_o     = uart_byte_p[5];
                next_state     = `FSM_W5;

            end

            `FSM_W5: begin
                next_state     = `FSM_B6;
            end

            `FSM_B6: begin

                uart_bit_o     = uart_byte_p[6];
                next_state     = `FSM_W6;

            end

            `FSM_W6: begin
                next_state     = `FSM_B7;
            end

            `FSM_B7: begin

                uart_bit_o     = uart_byte_p[7];
                next_state     = `FSM_W7;

            end

            `FSM_W7: begin
                next_state     = `FSM_STOP;
            end

				
            `FSM_STOP: begin
				
					 uart_bit_o     = HIGH_1;
                next_state     = `FSM_STOP2;
    
            end

            `FSM_STOP2: begin
                    
                if(uart_bit_r == HIGH_1) begin
                    finished_tx_r    = HIGH_1;
                end

                next_state           = `FSM_IDLE;

            end

        endcase


    end
	

	
	
assign finished_tx_o = finished_tx_r;


				











endmodule