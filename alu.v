module alu(alu_in1, alu_in2, alu_in3, alu_out1, alu_out2);

input wire [31:0] alu_in1, alu_in2; // operands
input wire [3:0] alu_in3; // alu control

output reg alu_out1; // zero
output reg signed [31:0] alu_out2; // result

always @(*) begin // FALTA EL OVERFLOW
	case (alu_in3)
		4'b0010: begin // add addi loads stores
			alu_out2 = alu_in1 + alu_in2;
		end
		4'b0110: begin // sub subi beq
			alu_out2 = alu_in1 - alu_in2;
			if (alu_out2 == 1'b0) begin
				alu_out1 = 1'b1;
			end else begin 
				alu_out1 = 1'b0;
			end	
		end
		4'b1000: begin // bne
			alu_out2 = alu_in1 - alu_in2;
			if (alu_out2 != 1'b0) begin
				alu_out1 = 1'b1;
			end else begin
				alu_out1 = 1'b0;
			end
		end
		4'b0000: begin // and
			alu_out2 = alu_in1 & alu_in2;
		end
		4'b0001: begin // or
			alu_out2 = alu_in1 | alu_in2;
		end
		4'b0111: begin // slt
			if (alu_in1 < alu_in2) begin
				alu_out2 = 1'b1;
			end else begin
				alu_out2 = 1'b0;
			end
		end
		4'b1100: begin // nor
			alu_out2 = ~(alu_in1 | alu_in2);
		end
		4'b1110: begin // bgez
			if (alu_in1 >= 32'b0) begin
				alu_out1 = 1'b1;
			end else begin
				alu_out1 = 1'b0;
			end
		end
		4'b1111: begin // lui
			alu_out2 = alu_in2<<16;	
		end
	endcase
end

endmodule
