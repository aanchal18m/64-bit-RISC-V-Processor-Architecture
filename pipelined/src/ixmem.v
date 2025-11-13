module ixmem(
	output reg [31:0] ix,
	input [63:0] pcNext,
	input rst, input clk
);

	reg [31:0] regarr [8191:0]; //32kB

	initial $readmemh("testcode.hex", regarr);
	always @(posedge clk) begin
		if(rst) ix <= 32'd0;
		else ix <= regarr[pcNext[14:2]];
	end

endmodule
