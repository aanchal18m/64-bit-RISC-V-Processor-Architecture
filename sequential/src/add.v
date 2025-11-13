module add(
	output ov,
	output [63:0] C,
	input [63:0] A,
	input [63:0] B
);

	wire [63:0] P, G;
	wire [64:0] c;
	wire [63:0] pg;
	wire t1, t2;

	assign c[0] = 0;
	genvar i;
	generate
		for(i = 0; i < 64; i = i+1) begin
			xor(P[i], A[i], B[i]);
			and(G[i], A[i], B[i]);
			and(pg[i], P[i], c[i]);
			xor(C[i], P[i], c[i]);
			or(c[i+1], pg[i], G[i]);
		end
	endgenerate

	xnor(t1, A[63], B[63]);
	xor(t2, A[63], C[63]);
	and(ov, t1, t2);

endmodule
