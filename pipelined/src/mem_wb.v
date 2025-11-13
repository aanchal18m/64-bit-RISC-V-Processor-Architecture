module mem_wb(
	output reg regWritereg,
	output reg memToRegreg,
	output reg [63:0] rdOutreg,
	output reg [63:0] ALUresregreg,
	output reg [4:0] writeregIn,
	input regWrite,
	input memToReg,
	input [63:0] rdOut,
	input [63:0] ALUresreg,
	input [4:0] instr2,
	input rst, input clk
);

	always @(posedge clk) begin
		if(rst) begin
			regWritereg <= 0;
			memToRegreg <= 0;
			rdOutreg <= 64'd0;
			ALUresregreg <= 64'd0;
			writeregIn <= 5'd0;
		end else begin
			regWritereg <= regWrite;
			memToRegreg <= memToReg;
			rdOutreg <= rdOut;
			ALUresregreg <= ALUresreg;
			writeregIn <= instr2;
		end
	end

endmodule
