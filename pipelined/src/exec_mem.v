module exec_mem(
	output reg regWritereg,
	output reg memToRegreg,
	output reg branchreg,
	output reg memReadreg,
	output reg memWritereg,
	output reg [63:0] pcOffreg,
	output reg zeroreg,
	output reg [63:0] ALUresreg,
	output reg [63:0] rd2reg,
	output reg [4:0] wareg,
	input regWrite,
	input memToReg,
	input branch,
	input memRead,
	input memWrite,
	input [63:0] pcOff,
	input zero,
	input [63:0] ALUres,
	input [63:0] rd2,
	input [4:0] wa,
	input rst, input clk
);

	always @(posedge clk) begin
		if(rst) begin
			regWritereg <= 0;
			memToRegreg <= 0;
			branchreg <= 0;
			memReadreg <= 0;
			memWritereg <= 0;
			pcOffreg <= 64'd0;
			zeroreg <= 0;
			ALUresreg <= 64'd0;
			rd2reg <= 64'd0;
			wareg <= 5'd0;
		end else begin
			regWritereg <= regWrite;
			memToRegreg <= memToReg;
			branchreg <= branch;
			memReadreg <= memRead;
			memWritereg <= memWrite;
			pcOffreg <= pcOff;
			zeroreg <= zero;
			ALUresreg <= ALUres;
			rd2reg <= rd2;
			wareg <= wa;
		end
	end

endmodule
