`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2016 05:51:51 PM
// Design Name: 
// Module Name: gen_info
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


module gen_info(input logic CLK, input logic [3:0] col[63:0], input logic [3:0] row[63:0], output logic [63:0] info, output logic [3:0] x,y);
    logic [5:0] index;
    logic [5:0] count;
    logic [3:0] x;
    logic [3:0] y;
    logic [63:0] out;
    
    initial begin
        count <= 6'b0;
    end
    
    always_ff @(posedge CLK) begin
        if(col[count] > 4'b0000) begin
            x <= col[count];
            y <= row[count];
            index <= x[0 +: 3] * 6'd8 + y[0 +: 3];
            out[index] <= 1'b1; 
        end
    end
    
    always_ff @ (posedge CLK)
        if(count < 6'b111111)
            count <= count+ 1;
        else
            count <= 6'b000000;
            
    always_ff @(posedge CLK)
        info <= out;
endmodule
