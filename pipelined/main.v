module top(
	input rst, input clk
);

	wire [31:0] ix, ixreg;
	wire [63:0] pcOut, pcOutreg, pcOutregreg, rd1, rd2, imm, pcOff, pcOffreg, ALUres, rd1reg, rd2reg, immreg, rdOut, ALUresreg, rd2regreg, writedata1In, ALUresregreg, rdOutreg;
	wire regWrite, regWritereg, memToReg, memToRegreg, branch, branchreg, memRead, memReadreg, memWrite, memWritereg, aluSrc, funct7_5, zero, ov, aluSrcreg, funct7_5reg, pcSrc, branchregreg, zeroreg, regWriteregreg, memToRegregreg, regWriteregregreg, memToRegregregreg, memReadregreg, memWriteregreg, pcWrite, fdWrite, stall;
	wire [1:0] aluOp, aluOpreg, forwardA, forwardB;
	wire [2:0] funct3, funct3reg;
	wire [4:0] wa, instr1, instr2, writeregIn, ra1reg, ra2reg;

	hazards hz(stall, pcWrite, fdWrite, memReadreg, instr1, ixreg[19:15], ixreg[24:20]);
	
	forwarding fw(forwardA, forwardB, regWriteregregreg, writeregIn, regWriteregreg, instr2, ra1reg, ra2reg);

	fetch fet(ix, pcOut, pcOffreg, pcSrc, pcWrite, rst, clk);
	
	fetch_dec fd(ixreg, pcOutreg, ix, pcOut, fdWrite, rst, clk);
	
	decode dec(regWrite, memToReg, branch, memRead, memWrite, aluSrc, aluOp, rd1, rd2, imm, funct7_5, funct3, wa, regWriteregregreg, ixreg, writeregIn, writedata1In, rst, clk);
	
	dec_exec de(regWritereg, memToRegreg, branchreg, memReadreg, memWritereg, aluSrcreg, aluOpreg, pcOutregreg, rd1reg, rd2reg, immreg, funct7_5reg, funct3reg, instr1, ra1reg, ra2reg, regWrite, memToReg, branch, memRead, memWrite, aluSrc, aluOp, pcOutreg, rd1, rd2, imm, funct7_5, funct3, wa, ixreg[19:15], ixreg[24:20], stall, rst, clk);	

	execute exec(pcOff, ALUres, zero, ov, pcOutregreg, rd1reg, rd2reg, immreg, aluSrcreg, aluOpreg, funct7_5reg, funct3reg, forwardA, forwardB, ALUresreg, rdOutreg);

	exec_mem em(regWriteregreg, memToRegregreg, branchregreg, memReadregreg, memWriteregreg, pcOffreg, zeroreg, ALUresreg, rd2regreg, instr2, regWritereg, memToRegreg, branchreg, memReadreg, memWritereg, pcOff, zero, ALUres, rd2reg, instr1, rst, clk);

	memory mem(rdOut, pcSrc, branchregreg, zeroreg, ALUresreg, rd2regreg, memReadregreg, memWriteregreg, rst, clk);

	mem_wb mw(regWriteregregreg, memToRegregregreg, rdOutreg, ALUresregreg, writeregIn, regWriteregreg, memToRegregreg, rdOut, ALUresreg, instr2, rst, clk);

	writeback wb(writedata1In, memToRegregregreg, rdOutreg, ALUresregreg);

endmodule
