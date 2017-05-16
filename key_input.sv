`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2016 03:31:57 PM
// Design Name: 
// Module Name: key_input
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


module key_input(input logic CLK, input logic datain, output logic [7:0] data);

    logic [3:0]b;
    logic [7:0] cur_data;
    logic sh;
    
    initial begin
    b <= 4'h1;
    sh <= 1'b0;
    cur_data <= 8'hf0;
    data <= 8'hf0;
    end;
    
    always_ff @(negedge CLK)
    begin
        case(b)
            1:;
            2:cur_data[0] <= datain;
            3:cur_data[1] <= datain;
            4:cur_data[2] <= datain;
            5:cur_data[3] <= datain;
            6:cur_data[4] <= datain;
            7:cur_data[5] <= datain;
            8:cur_data[6] <= datain;
            9:cur_data[7] <= datain;
            10: sh <= 1'b1; 
            11: sh <= 1'b0; 
        endcase
        
        if(b <= 10)
            b <= b + 1;
        else if(b == 11)
            b <= 1;            
    end
    
    always_ff @(posedge sh)
        data <= cur_data;
    
endmodule
