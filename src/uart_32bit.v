module uart_streaming_rx(
    clk,
    rst,
    uart_i,
    valid_i,
    fifo_full_i,
    data_o,
    write_req_o
);

localparam SOF0 			= 4'd1;
localparam SOF1 			= 4'd2;
localparam SOF2 			= 4'd3;
localparam SOF3 			= 4'd4;
localparam STAT0 			= 4'd5;
localparam STAT1 			= 4'd6;
localparam PAYLOAD 			= 4'd7;
localparam COUNT 			= 4'd8;
localparam EOF 				= 4'd9;
localparam REAL0 			= 4'd10; // Zustände für Realteil
localparam REAL1 			= 4'd11;
localparam IMAG0 			= 4'd12; // Zustände für Imaginärteil
localparam IMAG1 			= 4'd13;
localparam OUTPUT_SAMPLE 	= 4'd14; // Zustand zur Ausgabe der 32-Bit-Daten in 8-Bit-Segmenten

input clk, rst;
input [7:0] uart_i;
input valid_i, fifo_full_i;

output reg [7:0] data_o;
output reg write_req_o;

reg [7:0] real_part0, real_part1;
reg [7:0] imag_part0, imag_part1;
reg [31:0] combined_sample; // Zum Speichern des vollständigen 32-Bit-Samples
reg [1:0] output_counter; // Zähler für die Ausgabe der 8-Bit-Segmente

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
        output_counter <= 2'd0; // Initialisieren des Ausgabezählers
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
        // Ihre bisherigen Zustandsübergänge plus die Implementierung von OUTPUT_SAMPLE
        OUTPUT_SAMPLE: begin
            if (output_counter < 4) begin
                // Auswahl des auszugebenden 8-Bit-Segments basierend auf dem output_counter
                data_o = combined_sample[8*output_counter +: 8]; // Bit-Slicing
                write_req_o = 1'b1; // Signalisieren, dass Daten zur Ausgabe bereit sind
                output_counter = output_counter + 1; // Vorbereitung auf das nächste Segment
            end else begin
                write_req_o = 1'b0; // Beendet die Ausgabe
                next_state = PAYLOAD; // Zurück zum nächsten Sample oder zum Ende des Payloads
                output_counter = 0; // Zurücksetzen des Zählers für das nächste Mal
            end
        end
        // Fügen Sie hier Ihre anderen Zustände hinzu
    endcase
end

endmodule
