module instruction_memory(pc, clk, ins_31_26, ins_25_21, ins_20_16, ins_15_11, ins_15_0, ins_5_0, ins_25_0);

input wire clk;
input wire [31:0] pc;

output reg [31:26] ins_31_26;
output reg [25:21] ins_25_21;
output reg [20:16] ins_20_16;
output reg [15:11] ins_15_11;
output reg [15:0] ins_15_0;
output reg [5:0] ins_5_0;
output reg [25:0] ins_25_0;

reg [7:0] instruction_memory [0:255];
reg [31:0] instruction;

initial begin
	$readmemb("instruction_memory_j.txt", instruction_memory);
end

always @(*) begin
	instruction[31:24] = instruction_memory[pc];
	instruction[23:16] = instruction_memory[pc+2'b01];
	instruction[15:8] = instruction_memory[pc+2'b10];
	instruction[7:0] = instruction_memory[pc+2'b11];
	ins_31_26 = instruction[31:26];
	ins_25_21 = instruction[25:21];
	ins_20_16 = instruction[20:16];
	ins_15_11 = instruction[15:11];
	ins_15_0 = instruction[15:0];
	ins_5_0 = instruction[5:0];
	ins_25_0 = instruction[25:0];
end

endmodule
