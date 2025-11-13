module dec_exec(
	output reg regWritereg,
	output reg memToRegreg,
	output reg branchreg,
	output reg memReadreg,
	output reg memWritereg,
	output reg aluSrcreg,
	output reg [1:0] aluOpreg,
	output reg [63:0] pcOutreg,
	output reg [63:0] rd1reg,
	output reg [63:0] rd2reg,
	output reg [63:0] immreg,
	output reg funct7_5reg,
	output reg [2:0] funct3reg,
	output reg [4:0] wareg,
	output reg [4:0] ra1reg,
	output reg [4:0] ra2reg,
	input regWrite,
	input memToReg,
	input branch,
	input memRead,
	input memWrite,
	input aluSrc,
	input [1:0] aluOp,
	input [63:0] pcOut,
	input [63:0] rd1,
	input [63:0] rd2,
	input [63:0] imm,
	input funct7_5,
	input [2:0] funct3,
	input [4:0] wa,
	input [4:0] ra1,
	input [4:0] ra2,
	input stall,
	input rst, input clk
);

	always @(posedge clk) begin
		if(rst || stall) begin
			regWritereg <= 0;
			memToRegreg <= 0;
			branchreg <= 0;
			memReadreg <= 0;
			memWritereg <= 0;
			aluSrcreg <= 0;
			aluOpreg <= 2'd0;
			pcOutreg <= 64'd0;
			rd1reg <= 64'd0;
			rd2reg <= 64'd0;
			immreg <= 64'd0;
			funct7_5reg <= 0;
			funct3reg <= 3'd0;
			wareg <= 5'd0;
			ra1reg <= 5'd0;
			ra2reg <= 5'd0;
		end else if(!stall) begin
			regWritereg <= regWrite;
			memToRegreg <= memToReg;
			branchreg <= branch;
			memReadreg <= memRead;
			memWritereg <= memWrite;
			aluSrcreg <= aluSrc;
			aluOpreg <= aluOp;
			pcOutreg <= pcOut;
			rd1reg <= rd1;
			rd2reg <= rd2;
			immreg <= imm;
			funct7_5reg <= funct7_5;
			funct3reg <= funct3;
			wareg <= wa;
			ra1reg <= ra1;
			ra2reg <= ra2;
		end
	end

endmodule
