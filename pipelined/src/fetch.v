module fetch(
	output [31:0] ix,
	output [63:0] pcOut,
	input [63:0] pcOff,
	input pcSrc,
	input pcWrite,
	input rst, input clk
);

	wire [63:0] pcPlus4, pcPrev, pcNext;
	wire ov;
	
	busmux m1(pcPrev, pcOff, pcPlus4, pcSrc);
	pc pc1(pcNext, pcPrev, pcWrite, rst, clk);
	ixmem ixmem1(ix, pcNext, rst, clk);
	add add1(ov, pcPlus4, pcNext, 64'd4);
	assign pcOut = pcNext;

endmodule
