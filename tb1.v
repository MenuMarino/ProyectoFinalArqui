module tb;

// 	PC 
reg clk;
wire [31:0] pc_out;

// INSTRUCTION MEMORY
reg [31:0] pc;
wire [31:26] ins_31_26;
wire [25:21] ins_25_21;
wire [20:16] ins_20_16;
wire [15:11] ins_15_11;
wire [15:0] ins_15_0;
wire [5:0] ins_5_0;
wire [25:0] ins_25_0;

// BRANCH MUX 
reg [31:0] branch_mux_in1; // pc+=4
reg sel; // 0 if pc += 4, 1 if branch
wire [31:0] branch_mux_out; 

// JUMP MUX
wire [31:0] jump_mux_out; // new pc

// JUMP AND
wire jump_and_out;

// JUMP ADDER
wire [31:0] jump_adder_out; // new pc with jump

// REG FILE MUX
wire [4:0] reg_file_mux_out; // rt/rd as destination register

// REG FILE
wire [31:0] reg_file_out1; // read 1
wire [31:0] reg_file_out2; // read 2

// SIGN EXTEND
wire [31:0] sign_extend_out;

// CONTROL
wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] Jump, ALUOp; 

// ALU CONTROL
wire [3:0] alucontrol_out; // control para el ALU

// ALU
wire alu_out1; // zero
wire [31:0] alu_out2; // result

// ALU MUX
wire [31:0] alu_mux_out; // second operand for ALU

// DATA MEMORY
wire [31:0] data_memory_out; // read from read address

// WRITE BACK MUX
wire [31:0] write_back_mux_out;

// ADD_4
reg [31:0] add_pc;
wire [31:0] add_pc4;

// INSTANCIACIONES

// pc, instruction_memory, branch_mux, jump_mux, jump_and, jump_adder
pc tb1(branch_mux_out, clk, pc_out);
instruction_memory tb2(pc, clk, ins_31_26, ins_25_21, ins_20_16, ins_15_11, ins_15_0, ins_5_0, ins_25_0);
branch_mux tb3(pc, jump_adder_out, jump_and_out, branch_mux_out);
jump_mux tb4(reg_file_out1, pc, ins_25_0, branch_mux_out, Jump, jump_mux_out);
jump_and tb5(Branch, alu_out1, jump_and_out);
jump_adder tb6(pc, sign_extend_out, jump_adder_out);

// reg_file_mux, reg_file, control, alucontrol, alu, alu_mux, sign_extend
reg_file_mux tb7(ins_20_16, ins_15_11, RegDst, reg_file_mux_out);
reg_file tb8(pc, ins_31_26, clk, RegWrite, ins_25_21, ins_20_16,reg_file_mux_out, write_back_mux_out, reg_file_out1, reg_file_out2);
sign_extend tb9(ins_15_0, sign_extend_out);
control tb10(ins_31_26, RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump, ALUOp);
alucontrol tb11(ins_5_0, ALUOp, ins_31_26, alucontrol_out);
alu_mux tb12(reg_file_out2, sign_extend_out, ALUSrc, alu_mux_out);
alu tb13(reg_file_out1, alu_mux_out, alucontrol_out, alu_out1, alu_out2);

// data_memory, data_memory_mux, add_4
data_memory tb14(ins_31_26, MemWrite, MemRead, alu_out2, reg_file_out2, data_memory_out);
write_back_mux tb15(data_memory_out, alu_out2, MemtoReg, write_back_mux_out);
add_4 tb16(pc, add_pc4);

always begin
	#500 clk = ~clk;
end

initial begin
	// add
	$display("Add: ");	
	clk = 1'b1;
	pc = 32'b0;
	#480
	// sub
	
	$monitoroff;
	#520
	$monitoron;
	$display("Sub: ");
	pc = jump_mux_out;
	#480
	// and
	
    
	$monitoroff;
	#520
	$monitoron;
	$display("And: ");
	pc = jump_mux_out;
	#480
	// nor
    
    
	$monitoroff;
	#520
	$monitoron;
	$display("Nor: ");
	pc = jump_mux_out;
	#480
	// or
    
    
	$monitoroff;
	#520
	$monitoron;
	$display("Or: ");
	pc = jump_mux_out;
	#480
	// slt
    
    
	$monitoroff;
	#520
	$monitoron;
	$display("Slt: ");
	pc = jump_mux_out;
	#480
	// addi
    
    
	$monitoroff;
	#520
	$monitoron;
	$display("Addi: ");
	pc = jump_mux_out;
	#480
	// subi
    
    
	$monitoroff;
	#520
	$monitoron;
	$display("Subi: ");
	pc = jump_mux_out;
	#480
	// andi
    
    
	$monitoroff;
	#520
	$monitoron;
	$display("Andi: ");
	pc = jump_mux_out;
	#480
	// ori
    
    
	$monitoroff;
	#520
	$monitoron;
	$display("Ori: ");
	pc = jump_mux_out;
	#480
	// slti
    
    
	$monitoroff;
	#520
	$monitoron;
	$display("Slti: ");
	pc = jump_mux_out;
	#1
	$finish;
end

initial begin
	$monitor("Opcode: %b | Operand1: %b | Operand2: %b | Result: %d \n", ins_31_26,reg_file_out1, alu_mux_out, write_back_mux_out);
end

endmodule
