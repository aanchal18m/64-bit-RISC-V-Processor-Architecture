module decode(
	output regWrite,
	output memToReg,
	output branch,
	output memRead,
	output memWrite,
	output aluSrc,
	output [1:0] aluOp,
	output [63:0] rd1,
	output [63:0] rd2,
	output [63:0] imm,
	output funct7_5,
	output [2:0] funct3,
	output [4:0] wa,
	input regWrite_d,
	input [31:0] ix,
	input [4:0] wa_d,
	input [63:0] wd_d,
	input rst, input clk
);

	control c1(branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite, ix[6:0]);
	regfile rgf1(rd1, rd2, ix[19:15], ix[24:20], wa_d, wd_d, regWrite_d, rst, clk);
	immgen im1(imm, ix);
	assign funct7_5 = ix[30];
	assign funct3 = ix[14:12];
	assign wa = ix[11:7];

endmodule
