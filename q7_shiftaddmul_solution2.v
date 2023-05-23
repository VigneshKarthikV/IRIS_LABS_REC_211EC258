`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:44 11/26/2021 
// Design Name: 
// Module Name:    project 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module q7_shiftaddmul_solution2(clk, reset, start, b_in, q_in, stop, a_out);
parameter n = 8;
input clk;
input reset;
input start;
input [n-1:0]b_in;
input [n-1:0]q_in;
output stop;
output [(n*2)-1:0]a_out;
wire q0;
wire shift;
wire load;
Control_Unit M0_Controller(clk, start, reset, q0, add, shift, load, stop);
Datapath_Unit M1_Datapath(clk, reset, shift, add, load, b_in, q_in, q0, a_out);
endmodule

module Datapath_Unit(clk, reset, shift, add, load, input_b, input_q, q0, output_a);
parameter n = 4;
input clk;
input reset;
input shift;
input add;
input load;
input [n-1:0]input_b;
input [n-1:0]input_q;
output q0;
output reg [(n*2)-1:0]output_a;
reg [(n*2)-1:0]ALU_b;
reg [n-1:0]ALU_q;
assign q0 = ALU_q[0];

always @(posedge clk or posedge reset) begin
if(reset) begin
ALU_b <= 0;
ALU_q <= 0;
output_a <= 0;
end
else if(load) begin
ALU_b <= input_b;
ALU_q <= input_q;
output_a <= 0;
end
else if(q0) begin
output_a <= output_a + ALU_b;
ALU_b = ALU_b << 1;
ALU_q = ALU_q >> 1;
end
else if(shift) begin
ALU_b = ALU_b << 1;
ALU_q = ALU_q >> 1;
end
end
endmodule

module Control_Unit(clk, start, reset, q0, add, shift, load, stop);
parameter n = 4;
input clk;
input start;
input reset;
input q0;
output reg add;
output reg shift;
output reg load;
output reg stop;

reg [3:0]ps, ns;
parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8;
always @(posedge clk or posedge reset) begin
if(reset) begin
stop = 0;
ps <= s0;
end
else begin
ps <= ns;
end
end
always @(ps, start, q0) begin
//stop = 0;
shift = 0;
add = 0;
load = 0;
case(ps)
s0: if(start) begin ns <= s1; load = 1; end
    else ns <= s0;
s1: if(q0) begin add = 1; ns <= s2;end
    else begin shift = 1; ns <= s3;end
s2: begin shift = 1; ns <= s3;end
s3: if(q0) begin add = 1; ns <= s4;end
    else begin shift = 1; ns <= s5;end
s4: begin shift = 1; ns <= s5;end
s5: if(q0) begin add = 1; ns <= s6;end
    else begin shift = 1; ns <= s7;end
s6: begin shift = 1; ns <= s7;end
s7: if(q0) begin add = 1; ns <= s8;end
    else begin ns <= s8;end
s8: if(start) begin load = 1;ns <= s1;end
    else begin ns <= s8;stop = 1;end
default: begin ns <= s0; end
endcase
end
endmodule