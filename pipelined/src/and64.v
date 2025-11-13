module and64(
	output [63:0] C,
	input [63:0] A,
	input [63:0] B
);

	genvar i;
	generate
		for(i = 0; i < 64; i = i+1) begin
			and(C[i], A[i], B[i]);
		end
	endgenerate

endmodule
