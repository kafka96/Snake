`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2016 02:38:07 PM
// Design Name: 
// Module Name: display_score
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


module display_score(input logic CLK, input logic [3:0] Digit_In, 
        output logic [3:0] AN, output logic [6:0] C, output logic DP);
        
        
        wire [26:0] speed = 27'b101111101011110000100000000;
        //wire [26:0] speed = 27'b000000000000000000000001010; //speed needed for simulation
        wire flash_clk;
        wire [3:0] en = {flash_clk, 1'b0, 1'b0, 1'b1};
        
        
                
        clk_converter c1(CLK, 0, speed, flash_clk);
        
        
        
endmodule
