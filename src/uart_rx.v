`include "constants_uart.vh"

module uart_rx(     input  clk_uart,
                    input  rst,
                    input  enable_rx_i,
                    input  uart_bit_i,
                    output reg [7:0] uart_byte_o,
                    output finished_rx_o  
              );


localparam LOW_1 = 1'b0;		
localparam HIGH_1 = 1'b1;				  
				  

// Declaration FSM
reg [5:0] current_state, next_state;
reg enable_rx_r;

// Declaration
reg uart_bit_r;
reg [7:0] uart_byte_r, uart_byte_p; // uart_byte_p = persistent register


reg finished_rx_r;



    // FSM States
    always @(posedge clk_uart) begin
        
        if(rst) begin

            current_state <= `FSM_IDLE;
            uart_bit_r    <= LOW_1;
            enable_rx_r   <= LOW_1;
            uart_byte_p   <= 8'd0;

        end
        else begin

            current_state <= next_state;
            uart_bit_r    <= uart_bit_i;
            uart_byte_p   <= uart_byte_r;
            enable_rx_r   <= enable_rx_i;

        end
    end


    // UART FSM
    always @(*) begin

        uart_byte_o 			= uart_byte_r;
		  uart_byte_p 			= uart_byte_r;

        next_state  			= current_state;
        finished_rx_r      = LOW_1;



        case (current_state)

            `FSM_IDLE: begin

                uart_byte_r = 8'd0;
					 finished_rx_r  = LOW_1;
                if(uart_bit_r == LOW_1) begin
                    next_state = `FSM_WI;
                end

            end

            `FSM_WI: begin
                next_state     = `FSM_B0;
            end

            `FSM_B0: begin
         
                uart_byte_p[0] = uart_bit_r;
                next_state     = `FSM_W0;
            end

            `FSM_W0: begin
                next_state     = `FSM_B1;
            end

            `FSM_B1: begin

                uart_byte_p[1] = uart_bit_r;
                next_state     = `FSM_W1;

            end

            `FSM_W1: begin
                next_state     = `FSM_B2;
            end

            `FSM_B2: begin

                uart_byte_p[2] = uart_bit_r;
                next_state     = `FSM_W2;

            end

            `FSM_W2: begin
                next_state     = `FSM_B3;
            end

            `FSM_B3: begin

                uart_byte_p[3] = uart_bit_r;
                next_state     = `FSM_W3;

            end

            `FSM_W3: begin 
                next_state     = `FSM_B4;
            end

            `FSM_B4: begin
         
                uart_byte_p[4] = uart_bit_r;
                next_state     = `FSM_W4;
            end

            `FSM_W4: begin
                next_state     = `FSM_B5;
            end

            `FSM_B5: begin

                uart_byte_p[5] = uart_bit_r;
                next_state     = `FSM_W5;

            end

            `FSM_W5: begin
                next_state     = `FSM_B6;
            end

            `FSM_B6: begin

                uart_byte_p[6] = uart_bit_r;
                next_state     = `FSM_W6;

            end

            `FSM_W6: begin
                next_state     = `FSM_B7;
            end

            `FSM_B7: begin

                uart_byte_p[7] = uart_bit_r;
                next_state     = `FSM_W7;

            end

            `FSM_W7: begin
                next_state     = `FSM_B7;
            end

            `FSM_STOP: begin
                    
                if(uart_bit_r == HIGH_1) begin
                    finished_rx_r    = HIGH_1;
                end

                next_state     = `FSM_IDLE;
    
                

            end

        endcase


    end


assign finished_rx_o = finished_rx_r;

endmodule