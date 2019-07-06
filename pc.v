module pc(pc4, clk, pc_out);

input wire [31:0] pc4;
input wire clk;
output reg [31:0] pc_out;

always @(posedge clk) begin
	pc_out = pc4;	
end

endmodule
