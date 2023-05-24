`timescale 1ns / 1ns
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 12:57:31
// Design Name: 
// Module Name: q3_dff
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


module q3_dff(clk, reset, d, q);
input wire clk;
input wire reset;
input wire d;
output reg q;

always @(posedge clk or negedge reset) begin
if(~reset) begin
q <= 0;
end
else begin
q <= d;
end
end
endmodule