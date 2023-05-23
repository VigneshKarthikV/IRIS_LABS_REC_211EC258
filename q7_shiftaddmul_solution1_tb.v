`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2023 22:46:55
// Design Name: 
// Module Name: shiftandmultb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module q7_shiftaddmul_solution1_tb;
parameter n = 8;
reg start;
reg clk;
reg reset;
reg [n-1:0]i_B;
reg [n-1:0]i_Q;
wire stop;
wire [(n*2)-1:0]o_A;
q7_shiftaddmul_solution1 dut1(.start(start), .clk(clk), .reset(reset), .i_B(i_B), .i_Q(i_Q), .stop(stop), .o_A(o_A));
initial begin
forever #10 clk = ~clk;
end
initial begin
clk = 0;
start = 0;
reset = 1;
i_B = 0;
i_Q = 0;
#20;
reset = 0;
i_B = 17;
i_Q = 46;
start = 0;
#40;
start = 1;
#200;
$finish;
end
endmodule