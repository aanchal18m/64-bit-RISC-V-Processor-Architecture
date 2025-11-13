module alu(
	output reg [63:0] C,
	output zero,
	output reg ov,
	input [63:0] A,
	input [63:0] B,
	input [3:0] ALU_control
);

	wire [63:0] Cadd, Csub, Cor, Cand;
	wire ovadd, ovsub;
	add af(ovadd, Cadd, A, B);
	sub sf(ovsub, Csub, A, B);
	or64 of(Cor, A, B);
	and64 anf(Cand, A, B);
	
	always @(*) begin
		case(ALU_control)
			4'b0010: {C, ov} = {Cadd, ovadd};
			4'b0110: {C, ov} = {Csub, ovsub};
			4'b0001: C = Cor;
			4'b0000: C = Cand;
			default: C = 64'bx;
		endcase
	end
	assign zero = (C == 64'd0);

endmodule
