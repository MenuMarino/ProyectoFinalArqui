module reg_file(pc, reg_ins_31_26, clk, regwrite, reg_file_in1, reg_file_in2, reg_file_in3, reg_file_in4, reg_file_out1, reg_file_out2);

input wire [31:0] pc;
input wire [31:26] reg_ins_31_26; // opcode
input wire clk;
input wire regwrite;
input wire [4:0] reg_file_in1; // op 1
input wire [4:0] reg_file_in2; // op 2
input wire [4:0] reg_file_in3; // reg_file_mux_out
input wire [31:0] reg_file_in4; // write data

output reg signed [31:0] reg_file_out1;
output reg signed [31:0] reg_file_out2;

reg [31:0] reg_file [0:31];

initial begin
	$readmemb("reg_file.txt", reg_file);
end

always @(posedge clk) begin
	if (reg_ins_31_26 == 6'b101000 || reg_ins_31_26 == 6'b101001 || reg_ins_31_26 == 6'b101011 || reg_ins_31_26 == 6'b100000 || reg_ins_31_26 == 6'b100001 || reg_ins_31_26 == 6'b100011) begin
		reg_file_out1 = {27'b0, reg_file_in1};
		reg_file_out2 = reg_file[reg_file_in2];
	end else begin
		reg_file_out1 = reg_file[reg_file_in1];
		reg_file_out2 = reg_file[reg_file_in2];
	end
	if (reg_ins_31_26 == 6'b111110) begin // jr
		reg_file_out1 = reg_file[reg_file_in1];
	end
end

always @(negedge clk) begin
	if (regwrite == 1'b1) begin
		reg_file[reg_file_in3] = reg_file_in4;
	end
	if (reg_ins_31_26 == 6'b000011) begin
		reg_file[6'd31] = pc+3'b100;
	end
end

endmodule
