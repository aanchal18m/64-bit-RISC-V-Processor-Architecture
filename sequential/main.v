module top(input rst, input clk);
	wire [63:0] pcPrev, pcPlus4, pcPlusOff, pcNext, rd1, rd2, wd, imm, aluIn2, ALUres, rdOut;
	wire [31:0] ix;
	wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero, ov, pcov1, pcov2, pcSrc;
	wire [3:0] ALUControl;
	wire [1:0] ALUOp;

	add a1(pcov1, pcPlus4, pcNext, 64'd4);
	ixmem im1(ix, pcNext, rst, clk);
	control ctrl1(Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ix[6:0]);
	immgen imm1(imm, ix);
	add a2(pcov2, pcPlusOff, pcNext, {imm[62:0], 1'b0});
	regfile rf1(rd1, rd2, ix[19:15], ix[24:20], ix[11:7], wd, RegWrite, rst, clk);
	busmux m2(aluIn2, imm, rd2, ALUSrc);
	alucontrol alctrl1(ALUControl, ALUOp, ix[14:12], ix[30]);
	alu alu1(ALUres, zero, ov, rd1, aluIn2, ALUControl);
	and(pcSrc, Branch, zero);
	busmux m1(pcPrev, pcPlusOff, pcPlus4, pcSrc);
	datamem dm1(rdOut, ALUres, rd2, MemRead, MemWrite, rst, clk);
	busmux m3(wd, rdOut, ALUres, MemtoReg);
	pc pc1(pcNext, pcPrev, rst, clk);

endmodule
