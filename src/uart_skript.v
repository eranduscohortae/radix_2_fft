module uart_streaming_rx(
	clk,
	rst,
	uart_i,
	valid_i,
	fifo_full_i,
	data_o,
	write_req_o
);


localparam SOF0 	= 		4'd1;
localparam SOF1 	= 		4'd2;
localparam SOF2 	= 		4'd3;
localparam SOF3 	= 		4'd4;
localparam STAT0 	= 		4'd5;
localparam STAT1 	= 		4'd6;
localparam PAYLOAD 	= 		4'd7;
localparam COUNT 	= 		4'd8;
localparam EOF 		= 		4'd9;

input clk, rst;
input [7:0] uart_i;
input valid_i, fifo_full_i;

output reg [7:0] data_o;
output reg write_req_o;

reg [3:0] current_state, next_state;
reg [7:0] uart_r;
reg valid_r, fifo_full_r;
reg [15:0] status_info_r, status_info_temp;
wire [4:0] type_field;
wire [10:0] len_field;
reg [10:0] byte_counter_r, byte_counter_temp;

assign type_field = status_info_r[15:11];
assign len_field = status_info_r[10:0];

/// Sequential Logic //////////

always @ (posedge clk) begin
	if(rst) begin // synchronous reset
		uart_r <= 8'd0;
		valid_r <= 1'd0;
		fifo_full_r <= 1'd0;
		current_state <= SOF0;
		status_info_r <= 16'd0;
		byte_counter_r <= 11'd1;
	end
	else begin
		uart_r <= uart_i;
		valid_r <= valid_i;
		fifo_full_r <= fifo_full_i;
		current_state <= next_state;
		status_info_r <= status_info_temp;
		byte_counter_r <= byte_counter_temp;
	end
end


/// Combinational Logic //////////


always @ (*) begin
	next_state = current_state;
	data_o = 8'd0;
	write_req_o = 1'd0;
	status_info_temp = status_info_r;
	byte_counter_temp = byte_counter_r;
	
	case(current_state)
		SOF0: if(valid_r && uart_r == 8'h2E) begin next_state = SOF1; end
		SOF1: if(valid_r && uart_r == 8'h16) begin next_state = SOF2; end
		SOF2: if(valid_r && uart_r == 8'hD2) begin next_state = SOF3; end
		SOF3: if(valid_r && uart_r == 8'h04) begin next_state = STAT0;
											byte_counter_temp = 11'd1; end
											
											
		STAT0: if(valid_r) begin next_state = STAT1;
										status_info_temp[7:0] = uart_r; end
										
										
		STAT1: if(valid_r) begin next_state = PAYLOAD;
				status_info_temp[15:8] = uart_r; end
		
		COUNT: if(valid_r) begin next_state = EOF; end
		EOF: if(valid_r) begin next_state = SOF0; end
		
		PAYLOAD: begin
			if(valid_r && (len_field == 11'd0)) begin
				next_state = EOF;
			end
			else begin
				if(valid_r) begin
					byte_counter_temp = byte_counter_r + 'd1;
					data_o = uart_r;
					write_req_o = 1'd1;
					if(byte_counter_r == len_field) begin
							next_state = COUNT;
					end
				end
			end
		end
	endcase
	
end

endmodule