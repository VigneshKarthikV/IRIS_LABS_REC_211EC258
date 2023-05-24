`timescale 1ns / 1ns
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 13:51:04
// Design Name: 
// Module Name: q6_seqdetect_tb
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


module q6_seqdetect_tb;
reg clk;
reg reset;
reg x;
wire y;

q6_seqdetect dut1(clk, reset, x, y);
initial begin
clk = 0;
forever #3 clk = ~clk;
end
initial begin
reset = 0;
#10;
reset = 1;   
@(posedge clk) x <= 0;
@(posedge clk) x <= 1;
@(posedge clk) x <= 0;
@(posedge clk) x <= 1;
@(posedge clk) x <= 1;
@(posedge clk) x <= 1;
@(posedge clk) x <= 1;
@(posedge clk) x <= 0;
@(posedge clk) x <= 0;
@(posedge clk) x <= 1;
@(posedge clk) x <= 0;
@(posedge clk) x <= 0;
@(posedge clk) x <= 0;
@(posedge clk) x <= 0;
#100;
$finish;
end
endmodule