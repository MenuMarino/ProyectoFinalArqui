module reg_file_mux(input [20:16] reg_file_mux_in1, input [15:11] reg_file_mux_in2, input regdst, output [4:0] reg_file_mux_out);

wire [20:16] reg_file_mux_in1;
wire [15:11] reg_file_mux_in2;
wire regdst;
reg [4:0] reg_file_mux_out;

always @(*) begin
	if (regdst == 1'b1) begin
		reg_file_mux_out = reg_file_mux_in2; // rd (I-type)
	end else begin
		reg_file_mux_out = reg_file_mux_in1; // rt (R-type)
	end
end

endmodule
