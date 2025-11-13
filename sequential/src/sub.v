module sub(
	output ov,
	output [63:0] C,
	input [63:0] A,
	input [63:0] B
);

	wire [63:0] B_dash, B_complement;
	wire carry;
	
	genvar i;
	generate
		for(i = 0; i < 64; i = i+1) assign B_dash[i] = ~B[i];
	endgenerate
	
	add a1(carry, B_complement, B_dash, 64'b1);
	add a2(ov, C, A, B_complement);

endmodule
