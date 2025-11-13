module execute(
	output [63:0] pcOffe,
	output [63:0] ALUres,
	output zero,
	output ov,
	input [63:0] pcOut,
	input [63:0] rd1,
	input [63:0] rd2,
	input [63:0] imm,
	input aluSrc,
	input [1:0] aluOp,
	input funct7_5,
	input [2:0] funct3,
	input [1:0] forwardA,
	input [1:0] forwardB,
	input [63:0] em_aluRes,
	input [63:0] wb_rdOut
);

	wire [63:0] alu2;
	wire [3:0] ALUControl;
	wire carry;
	
	wire [63:0] alu_a;
	assign alu_a = (forwardA == 2'b10) ? em_aluRes :
                   (forwardA == 2'b01) ? wb_rdOut :
                   rd1;
                   
    wire [63:0] forwarded_B;
    assign forwarded_B = (forwardB == 2'b10) ? em_aluRes :
                         (forwardB == 2'b01) ? wb_rdOut :
                         rd2;

	wire [63:0] alu_b;
	busmux m1(alu_b, imm, forwarded_B, aluSrc);
	alucontrol alc1(ALUControl, aluOp, funct3, funct7_5);
	alu alu1(ALUres, zero, ov, alu_a, alu_b, ALUControl);
	add a1(carry, pcOffe, pcOut, {imm[62:0], 1'b0});
	
endmodule
