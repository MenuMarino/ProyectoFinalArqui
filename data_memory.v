module data_memory(opcode, memwrite, memread, data_memory_in1, data_memory_in2, data_memory_out);

input wire [31:26] opcode;
input wire memwrite, memread;
input wire [31:0] data_memory_in1; // read/write address
input wire [31:0] data_memory_in2; // write data
output reg [31:0] data_memory_out; // read output

reg [7:0] data_memory_normal [0:127]; // mitad normal
reg [7:0] data_memory_sp [128:255]; // mitad sp

initial begin
	$readmemb("data_memory_normal.txt", data_memory_normal);
	$readmemb("data_memory_sp.txt", data_memory_sp);
end

always @(*) begin
	if (memread == 1'b1) begin
		case (opcode)
			6'b100011: begin // lw
				data_memory_out[31:24] = data_memory_normal[data_memory_in1];
				data_memory_out[23:16] = data_memory_normal[data_memory_in1+2'b01];
				data_memory_out[15:8] = data_memory_normal[data_memory_in1+2'b10];
				data_memory_out[7:0] = data_memory_normal[data_memory_in1+2'b11];
			end
			6'b100001: begin // lh
				data_memory_out[31:24] = data_memory_normal[data_memory_in1];
				data_memory_out[23:16] = data_memory_normal[data_memory_in1+2'b01];
				data_memory_out[15:0] = 16'b0; 
			end
			6'b100000: begin // lb
				data_memory_out[31:24] = data_memory_normal[data_memory_in1];
				data_memory_out[23:0] = 24'b0;  
			end
		endcase
	end
	else if (memwrite == 1'b1) begin
	  case (opcode)
	  	6'b101011: begin // sw
	  		data_memory_normal[data_memory_in1] = data_memory_in2[31:24];
	  		data_memory_normal[data_memory_in1+2'b01] = data_memory_in2[23:16];
	  		data_memory_normal[data_memory_in1+2'b10] = data_memory_in2[15:8];
	  		data_memory_normal[data_memory_in1+2'b11] = data_memory_in2[7:0];
	  	end
	  	6'b101001: begin // sh
	  		data_memory_normal[data_memory_in1] = data_memory_in2[31:24];
	  		data_memory_normal[data_memory_in1+2'b01] = data_memory_in2[23:16];		
	  	end
	  	6'b101000: begin // sb
	  		data_memory_normal[data_memory_in1] = data_memory_in2[31:24];	
	  	end
	  endcase
	end 
end

endmodule
