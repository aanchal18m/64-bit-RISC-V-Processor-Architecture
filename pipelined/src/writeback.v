module writeback(
	output [63:0] writedata1In,
	input memToReg,
	input [63:0] mux3In1,
	input [63:0] mux3In0
);

	busmux m3(writedata1In, mux3In1, mux3In0, memToReg);

endmodule
