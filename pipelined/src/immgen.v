module immgen(
	output reg [63:0] imm,
	input [31:0] ix
);

	reg [11:0] imm12;

	always @(*) begin
		case (ix[6:0])
			7'b0000011:	imm12 <= ix[31:20];								// I-type (ld)
			7'b0100011:	imm12 <= {ix[31:25], ix[11:7]};					// S-type (sd)
			7'b1100011:	imm12 <= {ix[31], ix[7], ix[30:25], ix[11:8]};	// B-type (beq)
			default:	imm12 <= 12'b0;									// R-type (add, sub, and, or)
		endcase
	end

	always @(*) begin
		imm <= {{52{imm12[11]}}, imm12};
	end

endmodule
