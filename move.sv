`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2016 12:04:06 AM
// Design Name: 
// Module Name: move
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


module move(input logic CLK, input logic [3:0] dir, input logic en, input logic [2:0] head_c, head_r, tail_c, tail_r,
                output logic [2:0] hc, hr, tc, tr);
    
    always_ff @(posedge CLK) begin
        case(dir)
        3'b011: begin
            hr <= head_r + 1;
            hc <= head_c;
            tc <= tail_c;
            
            if(!en)
                tr <= tail_r + 1;
        end
        endcase
    end
    
  
    
endmodule
