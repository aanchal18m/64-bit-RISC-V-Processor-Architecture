module alucontrol(
	output reg [3:0] ALUControl,
	input [1:0] ALUOp,
	input [2:0] funct3,
	input funct7_5
);

	always @(*) begin
		case (ALUOp)
			2'b00:		ALUControl = 4'b0010;								// add (ld, sd)
			2'b01:		ALUControl = 4'b0110;								// sub (beq)
			2'b10:		begin												// R-type
				case (funct3)
					3'b000:		ALUControl = funct7_5 ? 4'b0110 : 4'b0010;	// sub : add
					3'b110:		ALUControl = 4'b0001;						// or
					3'b111:		ALUControl = 4'b0000;						// and
					default:	ALUControl = 4'bxxxx;
				endcase
			end
			default:	ALUControl = 4'bxxxx;
		endcase
	end

endmodule
