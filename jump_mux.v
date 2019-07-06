module jump_mux(input [31:0] ra, input [31:0] jump_mux_pc, input [25:0] jump_mux_in1, input [31:0] jump_mux_in2, input [1:0] jump_sel, output [31:0] jump_mux_out);
// jump_sel es igual al Jump seteado por el Control
wire [31:0] ra;
wire [25:0] jump_mux_in1;
wire [31:0] jump_mux_in2;
wire [1:0] jump_sel;
wire [31:0] jump_mux_pc;
reg [31:0] jump_mux_out;
reg [31:0] jump_mux_pc4;
reg [31:0] jump_address;
reg [31:0] jal;

always @(*) begin
	jump_mux_pc4 = jump_mux_pc+3'd4;
	jump_address[31:28] = jump_mux_pc4[31:28];
	jump_address[27:0] = jump_mux_in1 << 2;
	if (jump_sel == 2'b11) begin // j
		jump_mux_out = jump_address;
	end else if (jump_sel == 2'b10) begin // jr
		jump_mux_out = ra;
	end else if (jump_sel == 2'b01) begin // jal
		jal[31:0] = jump_mux_in1 << 2;
		jump_mux_out = jal;
	end else begin // branch
		jump_mux_out = jump_mux_in2; 
	end
end

endmodule
