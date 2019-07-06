module sign_extend(input [15:0] sign_extend_in, output [31:0] sign_extend_out);

wire [15:0] sign_extend_in;
reg signed [31:0] sign_extend_out;

always @(*) begin
	sign_extend_out[31:0] = $signed(sign_extend_in);
end

endmodule
