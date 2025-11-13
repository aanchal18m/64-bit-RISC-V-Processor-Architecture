module hazards(
	output reg stall,
	output reg pcWrite,
	output reg fdWrite,
	input de_memRead,
	input [4:0] de_rd,
	input [4:0] fd_rs1,
	input [4:0] fd_rs2
);
	
	always @(*) begin
		if(de_memRead && ((de_rd == fd_rs1) || (de_rd == fd_rs2))) begin
			stall = 1;
			pcWrite = 0;
			fdWrite = 0;
		end else begin
			stall = 0;
			pcWrite = 1;
			fdWrite = 1;
		end
	end

endmodule
