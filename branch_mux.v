module branch_mux(input [31:0] branch_mux_in1, input [31:0] branch_mux_in2, input sel, output [31:0] branch_mux_out);

wire [31:0] branch_mux_in1, branch_mux_in2;
wire sel;
reg [31:0] branch_mux_out;

always @(*) begin
	if (sel == 1'b1) begin
		branch_mux_out = branch_mux_in2; // letting the branch pass
	end else begin
		branch_mux_out = branch_mux_in1+3'b100; // pc += 4
	end
end

endmodule
