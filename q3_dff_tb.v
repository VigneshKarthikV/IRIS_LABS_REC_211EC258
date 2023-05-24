`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 13:01:10
// Design Name: 
// Module Name: q3_dff_tb
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


module q3_dff_tb;
reg clk, reset, d;
wire q;
reg [1:0]i;
q3_dff dut1(clk, reset, d, q);
initial begin
clk = 0;
forever #3 clk = ~clk;
end
initial begin
for(i = 0;i <= 3;i = i + 1) begin
#5 {reset, d} = i;
end
$finish;
end
endmodule