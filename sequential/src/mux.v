module busmux(
	output [63:0] Y,
	input [63:0] X1,
	input [63:0] X0,
	input S
);

	wire [63:0] ins0, ins1;
	wire Sbar;

	not(Sbar, S);
	genvar i;
	generate
	for(i = 0; i < 64; i = i+1) begin
		and(ins0[i], Sbar, X0[i]);
		and(ins1[i], S, X1[i]);
		or(Y[i], ins0[i], ins1[i]);
	end
	endgenerate

endmodule
