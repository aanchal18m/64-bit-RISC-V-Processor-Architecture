module fetch_dec(
	output reg [31:0] ixreg,
	output reg [63:0] pcOutreg,
	input [31:0] ix,
	input [63:0] pcOut,
	input fdWrite,
	input rst, input clk
);

	always @(posedge clk) begin
		if(rst) begin
			pcOutreg <= 64'd0;
			ixreg <= 32'd0;
		end else if(fdWrite) begin
			pcOutreg <= pcOut;
			ixreg <= ix;
		end
	end

endmodule
