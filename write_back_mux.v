module write_back_mux(input [31:0] write_back_mux_in1, input [31:0] write_back_mux_in2, input memtoreg, output [31:0] write_back_mux_out);

wire [31:0] write_back_mux_in1, write_back_mux_in2;
wire memtoreg;
reg signed [31:0] write_back_mux_out;

always @(*) begin
	if (memtoreg == 1'b1) begin
		write_back_mux_out = write_back_mux_in1; // tipo I
	end else begin
		write_back_mux_out = write_back_mux_in2; // tipo R
	end
end

endmodule
