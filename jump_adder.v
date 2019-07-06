module jump_adder(input wire [31:0] jump_adder_in1, input wire [31:0] jump_adder_in2, output reg [31:0] jump_adder_out);

reg [31:0] sll; 
reg [31:0] pc4; 

always @(*) begin // al 1ero le suma 4 y al 2do lo multiplica por 4
	sll = jump_adder_in2 << 2;
	pc4 = jump_adder_in1 + 3'd4;
	jump_adder_out = sll+pc4;
end 

endmodule
