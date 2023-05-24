`timescale 1ns / 1ns
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2023 22:14:09
// Design Name: 
// Module Name: shiftandmul
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


module q7_shiftaddmul_solution1(start, clk, reset, i_B, i_Q, stop, o_A);
parameter n = 8;
input wire start;
input wire clk;
input wire reset;
input wire [n-1:0]i_B;
input wire [n-1:0]i_Q;
output wire stop;
output [(n*2)-1:0]o_A;
reg stop_reg;
reg [(n*2)-1:0]A;
reg [(n*2)-1:0]B;
reg [(n)-1:0]Q;
reg [n:0]N;

assign o_A = A;
assign stop = stop_reg;
always @(negedge reset) begin
A = 0;
B = 0;
Q = 0;
end
always @(posedge clk) begin
if(!reset) begin
case(start)
1'b0: begin
B = i_B;
Q = i_Q;
N = n;
stop_reg = 0;
A = 0;
end
1'b1: begin
if(Q[0] == 1) begin
A = A + B;
end
N = N - 1;
B = B << 1;
Q = Q >> 1;
end
endcase
if(N == 0) begin
stop_reg = 1;
end
end
end
endmodule