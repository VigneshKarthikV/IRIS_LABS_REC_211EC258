`timescale 1ns / 1ns
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 13:25:15
// Design Name: 
// Module Name: q6_seqdetect
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


module q6_seqdetect(clk, reset, x, y);
input wire clk;
input wire reset;
input wire x; 
output wire y;
reg [2:0]ps, ns;
reg y_out;
parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4;
assign y = y_out;
always @(posedge clk) begin
if(~reset) begin
ps <= s0;
y_out <= 0;
end
else begin
ps <= ns;
end
end
always @(x or ps) begin
case(ps)
s0: begin if(~x) ns <= s1; else ns <= s0; y_out = 0;end
s1: begin if(~x) ns <= s2; else ns <= s4; y_out = 0;end
s2: begin ns <= s3; y_out = 1;end
s3: begin if(~x) ns <= s1; else ns <= s0; y_out = 1;end
s4: begin if(~x) ns <= s3; else ns <= s0; y_out = 0;end
default: begin ns <= s0; y_out = 0; end
endcase
end
endmodule