module alucontrol(input [5:0] alucontrol_in1, input [1:0] alucontrol_in2, input [31:26] opcode, output [3:0] alucontrol_out);

wire [5:0] alucontrol_in1; // func field 
wire [1:0] alucontrol_in2; // op field que viene del control (ALUOp)
wire [31:26] opcode; // OPCODE
reg [3:0] alucontrol_out; // control para el ALU

always @(*) begin
	case (alucontrol_in2)
		2'b00: begin // lw sw
			alucontrol_out = 4'b0010;
		end
		2'b01: begin // beq
			alucontrol_out = 4'b0110;
		end
		2'b10: begin // R-type
			case (alucontrol_in1)
				6'b100000: begin // add
					alucontrol_out = 4'b0010;
				end
				6'b100010: begin // sub
					alucontrol_out = 4'b0110;
				end
				6'b100100: begin // and
					alucontrol_out = 4'b0000;
				end
				6'b100101: begin // or 
					alucontrol_out = 4'b0001;
				end
				6'b101010: begin // slt
					alucontrol_out = 4'b0111;
				end
				6'b100111: begin // nor
					alucontrol_out = 4'b1100;
				end
			endcase
		end
	endcase
	case (opcode) 
		6'b001000: begin // addi
			alucontrol_out = 4'b0010;	
		end
		6'b111111: begin // subi
			alucontrol_out = 4'b0110;	
		end
		6'b001100: begin // andi
			alucontrol_out = 4'b0000;	
		end
		6'b001101: begin // ori
			alucontrol_out = 4'b0001;	
		end
		6'b001010: begin // slti
			alucontrol_out = 4'b0111;	
		end
		6'b001111: begin // lui
			alucontrol_out = 4'b1111;
		end
		6'b000001: begin // bgez
			alucontrol_out = 4'b1110;
		end
		6'b100000: begin // lb
			alucontrol_out = 4'b0010;	
		end
		6'b101000: begin // sb
			alucontrol_out = 4'b0010;	
		end
		6'b100001: begin // lh
			alucontrol_out = 4'b0010;	
		end
		6'b101001: begin // sh
			alucontrol_out = 4'b0010;	
		end
		6'b100011: begin // lw
			alucontrol_out = 4'b0010;	
		end
		6'b101011: begin // sw
			alucontrol_out = 4'b0010;	
		end
		6'b000101: begin // bne	
			alucontrol_out = 4'b1000;
		end
	endcase
end

endmodule
