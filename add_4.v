module add_4(add_pc, add_pc4);

input [31:0] add_pc;
output [31:0] add_pc4;

assign add_pc4 = add_pc + 3'd4;

endmodule