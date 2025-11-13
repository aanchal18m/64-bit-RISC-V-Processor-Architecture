`timescale 1ns / 1ps

module tb;

	reg clk, rst;
	wire ov;

	top uut(rst, clk);

	always #5 clk = ~clk;

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0, tb);
		clk = 0;
		rst = 1; #10
		rst = 0; #200
		$finish;
	end

endmodule
