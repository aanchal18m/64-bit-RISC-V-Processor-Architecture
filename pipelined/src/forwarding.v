module forwarding(
	output [1:0] forwardA,
	output [1:0] forwardB,
	input mw_regWrite,
	input [4:0] mw_rd,
	input em_regWrite,
	input [4:0] em_rd,
	input [4:0] de_rs1,
	input [4:0] de_rs2
);

	assign forwardA = ((em_regWrite == 1'b1) & (em_rd != 5'h00) & (em_rd == de_rs1)) ? 2'b10 :
						((mw_regWrite == 1'b1) & (mw_rd != 5'h00) & (mw_rd == de_rs1)) ? 2'b01 : 2'b00;
	assign forwardB = ((em_regWrite == 1'b1) & (em_rd != 5'h00) & (em_rd == de_rs2)) ? 2'b10 :
						((mw_regWrite == 1'b1) & (mw_rd != 5'h00) & (mw_rd == de_rs2)) ? 2'b01 : 2'b00;

endmodule
