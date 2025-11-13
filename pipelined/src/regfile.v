module regfile(
	output reg [63:0] rd1,
	output reg [63:0] rd2,
	input [4:0] ra1,
	input [4:0] ra2,
	input [4:0] wa,
	input [63:0] wd,
	input regWrite,
	input rst, input clk
);

	reg [63:0] regarr [31:0];
	always @(posedge clk) begin
		if(rst) begin
			rd1 <= 64'd0;
			rd2 <= 64'd0;
			regarr[0] = 0;
			regarr[2] = 16;
			regarr[3] = 3;
		end else if(regWrite && wa) regarr[wa] <= wd;
	end
	always @(*) begin
		rd1 = regarr[ra1];
		rd2 = regarr[ra2];
	end
endmodule
