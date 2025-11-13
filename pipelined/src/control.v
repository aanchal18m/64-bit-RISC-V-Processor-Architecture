module control(
	output branch, 
	output memRead, 
	output memToReg, 
	output [1:0] aluOp, 
	output memWrite, 
	output aluSrc, 
	output regWrite, 
	input [6:0] opcode
);

reg [7:0] ctrls; //{branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite}

always @(*) begin
	case (opcode)
		7'b0000011:	ctrls = 8'b0_1_1_00_0_1_1;	// I-type (ld)
		7'b0100011:	ctrls = 8'b0_0_0_00_1_1_0;	// S-type (sd)
		7'b0110011:	ctrls = 8'b0_0_0_10_0_0_1;	// R-type (add, sub, and, or)
		7'b1100011:	ctrls = 8'b1_0_x_01_0_0_0;	// B-type (beq)
		default:	ctrls = 8'b0_0_0_00_0_0_0;
	endcase
end

assign {branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite} = ctrls;

endmodule
