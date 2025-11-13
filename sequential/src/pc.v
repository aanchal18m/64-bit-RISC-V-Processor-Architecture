module pc(
	output reg [63:0] pcNext,
	input [63:0] pcPrev,
	input rst, input clk
);

	always @(posedge clk) begin
		if(rst) pcNext <= 64'd0;
		else pcNext <= pcPrev;
	end

endmodule
