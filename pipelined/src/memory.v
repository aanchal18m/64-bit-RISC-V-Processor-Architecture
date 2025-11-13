module memory(
	output [63:0] rdOut,
	output pcSrc,
	input branchIn1,
	input branchIn2,
	input [63:0] datamemadd,
	input [63:0] writedata2In,
	input memRead,
	input memWrite,
	input rst, input clk
);

	and(pcSrc, branchIn1, branchIn2);
	datamem d1(rdOut, datamemadd, writedata2In, memRead, memWrite, rst, clk);

endmodule
