`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2016 11:30:17 PM
// Design Name: 
// Module Name: clk_converter
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


module clk_converter(input logic clk, clr, input logic [26:0]size, output logic y);
    logic [26:0] count, nextcount;
    
    always_ff @(posedge clk)begin
        if(clr)begin
            count <= 0;
            y <= 0;
            end
        else if(count == size)begin
            count <= 0;
            y <= ~y;
            end
        else if(count == size / 2)begin
            count <= nextcount;
            y <= ~y;
            end
        else
            count <= nextcount;
            
    end  
   
    always_comb
        nextcount = count + 1;
endmodule
