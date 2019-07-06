module control(input [31:26] control_in, output RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, output [1:0] Jump, ALUOp);

wire [31:26] control_in;
reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
reg [1:0] ALUOp, Jump;

always @(*) begin
	case (control_in)
		6'b000000: begin // add sub and or slt nor
			ALUOp = 2'b10;

			Jump = 2'b00;
			RegDst = 1'b1;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b0;
			RegWrite = 1'b1;
		end
		6'b001000: begin // addi
			
			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		6'b111111: begin // subi
			
			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end 
		6'b001100: begin // andi
			
			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end 
		6'b001101: begin // ori
			
			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end 
		6'b001010: begin // slti
			
			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		6'b100011: begin // lw

			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b1;
			MemtoReg = 1'b1;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		6'b100001: begin // lh

			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b1;
			MemtoReg = 1'b1;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		6'b100000: begin // lb

			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b1;
			MemtoReg = 1'b1;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		6'b101011: begin // sw

			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b1;
			ALUSrc = 1'b1;
			RegWrite = 1'b0;
		end
		6'b101001: begin // sh

			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b1;
			ALUSrc = 1'b1;
			RegWrite = 1'b0;
		end
		6'b101000: begin // sb

			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b1;
			ALUSrc = 1'b1;
			RegWrite = 1'b0;
		end
		6'b001111: begin // lui

			Jump = 2'b00;
			RegDst = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
		end
		6'b000100: begin // beq
			ALUOp = 2'b01;

			Jump = 2'b00;
			//RegDst = 1'b0;
			Branch = 1'b1;
			//MemRead = 1'b0;
			//MemtoReg = 1'b0;
			//MemWrite = 1'b0;
			ALUSrc = 1'b0;
			//RegWrite = 1'b1;
		end
		6'b000101: begin // bne
			//ALUOp = 2'b01;

			Jump = 2'b00;
			//RegDst = 1'b0;
			Branch = 1'b1;
			//MemRead = 1'b0;
			//MemtoReg = 1'b0;
			//MemWrite = 1'b0;
			ALUSrc = 1'b0;
			//RegWrite = 1'b1;
		end
		6'b000001: begin // bgez
			//ALUOp = 2'b01;

			Jump = 2'b00;
			//RegDst = 1'b0;
			Branch = 1'b1;
			//MemRead = 1'b0;
			//MemtoReg = 1'b0;
			//MemWrite = 1'b0;
			ALUSrc = 1'b0;
			//RegWrite = 1'b1;
		end
		6'b000010: begin // j
			//ALUOp = 2'b01;

			Jump = 2'b11;
			//RegDst = 1'b0;
			Branch = 1'b0;
			//MemRead = 1'b0;
			//MemtoReg = 1'b0;
			//MemWrite = 1'b0;
			//ALUSrc = 1'b0;
			//RegWrite = 1'b1;
		end
		6'b000011: begin // jal
			//ALUOp = 2'b01;

			Jump = 2'b01;
			//RegDst = 1'b0;
			Branch = 1'b0;
			//MemRead = 1'b0;
			//MemtoReg = 1'b0;
			//MemWrite = 1'b0;
			//ALUSrc = 1'b0;
			//RegWrite = 1'b1;
		end
		6'b111110: begin // jr
			//ALUOp = 2'b01;

			Jump = 2'b10;
			//RegDst = 1'b0;
			Branch = 1'b0;
			//MemRead = 1'b0;
			//MemtoReg = 1'b0;
			//MemWrite = 1'b0;
			//ALUSrc = 1'b0;
			//RegWrite = 1'b1;
		end
	endcase	
end
endmodule
