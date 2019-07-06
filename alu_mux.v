module alu_mux(input [31:0] alu_mux_in1, input [31:0] alu_mux_in2, input alusrc, output [31:0] alu_mux_out);

wire [31:0] alu_mux_in1, alu_mux_in2;
wire alusrc;
reg [31:0] alu_mux_out;

always @(*) begin
	if (alusrc == 1'b1) begin
		alu_mux_out = alu_mux_in2; // ~tipo R
	end else begin
		alu_mux_out = alu_mux_in1; // tipo R
	end
end

endmodule
