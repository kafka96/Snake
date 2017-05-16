`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2016 01:53:02 AM
// Design Name: 
// Module Name: get_dir
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


module get_dir(input logic CLK, key_clk, datain, output logic [2:0] dir, output logic [1:0]level, output logic pause, reset);
    
    logic [7:0]data;
    logic [7:0] prevdata;
    logic [2:0]new_dir;
    logic [2:0]prev_dir;
    logic reset;
    logic pause;
    
    key_input key(key_clk, datain, data);
    
    initial begin
    data <= 8'b01110101;
    prevdata <= 8'b01110101;
    dir <= 3'b100;
    new_dir <= 3'b100;
    prev_dir <= 3'b100;    
    level <= 2'b00;
    end
    
    always_ff @ (posedge CLK)
    if(prev_dir != new_dir && ( prev_dir != (4'b111 - new_dir) ) )begin
        dir <= new_dir;
        prev_dir <= new_dir;
        end
    else
        dir <= dir;
        
    always_ff @(posedge CLK)
    case(data)
    8'b01110101: new_dir <= 3'b100;
    8'b01110010: new_dir <= 3'b011;
    8'b01110100: new_dir <= 3'b001;
    8'b01101011: new_dir <= 3'b110;
    8'b01001101: new_dir <= 3'b000;
    default: new_dir <= new_dir;
    endcase
    
    always_ff @(posedge CLK) 
       //if(test) begin
        if(data == 8'b00010110)
            level <= 2'b00;
        else if(data == 8'b00011110)
            level <= 2'b01;
        else if(data == 8'b00100110)
            level <= 2'b10;
        else if(data == 8'b01001101)
            pause <= 2'b1;
        else if(data == 8'b00100001)
            pause <= 2'b0;
            
       
        
            
    
    
    /*
        
    always_ff @(posedge CLK)
        if(prevdata != data) begin
            prevdata <= data;
            test <= 1'b1;
        end
        else
            test <= 1'b0;
      */  
    
endmodule