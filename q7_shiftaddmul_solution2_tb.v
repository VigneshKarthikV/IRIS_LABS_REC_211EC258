`timescale 1ns / 1ns
`default_nettype none
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:03:21 11/27/2021
// Design Name:   multiplier
// Module Name:   D:/PEC/7th SEMESTER/HDL based system design/Lab/project_verilog/multiplier_tb.v
// Project Name:  project_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module q7_shiftaddmul_solution2_tb;
   parameter n = 8;
	reg [n-1:0] b_in;
	reg [n-1:0] q_in;
	reg clk;
	reg start;
	reg reset;
	wire [(n*2)-1:0]a_out;
	wire stop;

q7_shiftaddmul_solution2 dut1 (.clk(clk), .reset(reset), .start(start), .b_in(b_in), .q_in(q_in), .stop(stop), .a_out(a_out));
	initial
	begin
	forever 
		#50 clk= ~clk;
	end
	initial begin
		b_in = 0;
		q_in = 0;
		clk = 0;
#10		reset = 1;
#75		reset = 0;
#25		start = 1;
        b_in = 8'h0f;
		q_in = 8'h0e;
#100    start = 0;
		#(100*n)
		$finish;
	end
endmodule