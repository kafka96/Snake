`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2016 03:56:24 PM
// Design Name: 
// Module Name: apple_gen
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


module apple_gen(input logic CLK, input logic en, input logic [63:0] info, output logic [2:0] c,r);
    logic [2:0] col;
    logic [2:0] c_out;
    logic [2:0] r_out;
    logic [2:0] row;
    logic [5:0] count;
    
    initial begin
    col <= 3'b001;
    row <= 3'b111;
    c_out <= 3'b000;
    r_out <= 3'b000;
    count <= 6'b000000;
    en <= 1'b0;
    end
    
    always_ff @(posedge en) begin
            c <= c_out;
            r <= r_out;
        end
        
    always_ff @(posedge CLK) 
        if(row < 3'b111)
            row <= row + 1;
        else begin
            row <= 3'b000;
            if(col < 3'b111)
                col <= col + 1;
            else 
                col <= 3'b000;            
            end
        
    always_ff @(posedge CLK) begin
        count <= row * 4'd8 + col;
        if(info[count] == 1'b0) begin
            c_out <= col;
            r_out <= row;
        end
        
    end
    
endmodule
