module datamem(
	output reg [63:0] rdOut,
	input [63:0] adrs,
	input [63:0] writedata2In,
	input memRead,
	input memWrite,
	input rst, input clk
);

	integer i;
	reg [7:0] regarr [1023:0];	//1kB
	always @(*) begin
		if(rst) begin
			rdOut = 64'd0;
			for(i = 0; i < 1024; i = i+1) regarr[i] = 8'd0;
		end else if(memRead)
			rdOut = {regarr[adrs+7], regarr[adrs+6], regarr[adrs+5], regarr[adrs+4], regarr[adrs+3], regarr[adrs+2], regarr[adrs+1], regarr[adrs]};
	end
	always @(posedge clk)
		if(memWrite) {regarr[adrs+7], regarr[adrs+6], regarr[adrs+5], regarr[adrs+4], regarr[adrs+3], regarr[adrs+2], regarr[adrs+1], regarr[adrs]} <= writedata2In;
endmodule
