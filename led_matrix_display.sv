`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2016 02:19:24 PM
// Design Name: 
// Module Name: led_matrix_display
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


module led_matrix_display(input logic CLK, input logic [63:0] info, input logic [2:0] c,r, output logic [7:0]row, output logic ST_CP, SH_CP, OE, MR, 
                   output logic data);
           logic [23:0] out;
           logic [7:0] col;
           logic [7:0] green;
           
           initial begin
           MR <= 1'b1;
           OE <= 1'b0;
           col <= 8'b10000000;
           out <= 24'b01111111_10000000_00000000;
           green <= 8'b00000000;
           end
           
           
           always_ff @(posedge ST_CP)
               case(col)
               8'b10000000: begin
                    if(c == 3'b011)
                        green[r] <= 1'b1;
                    else
                        green <= 8'b0;
                    out <= {info[16 +: 8], 8'b0, green};
                    col <= 8'b01000000;
               end
               8'b01000000: begin
                    if( c== 3'b100)
                        green[r] <= 1'b1;
                    else
                        green <= 8'b0;
                    out <= {info[24 +: 8], 8'b0, green};
                    col <= 8'b00100000;
               end
               8'b00100000: begin
                    if(c == 3'b101)
                        green[r] <= 1'b1;
                    else
                        green <= 8'b0;
                    out <= {info[32 +: 8], 8'b0, green};
                    col <= 8'b00010000;
               end
               8'b00010000: begin
                    if(c == 3'b110)
                        green[r] <= 1'b1;
                    else
                        green <= 8'b0;
                    out <= {info[40 +: 8], 8'b0, green};
                    col <= 8'b00001000;
               end
               8'b00001000: begin
                    if(c == 3'b111)
                        green[r] <= 1'b1;
                    else
                        green <= 8'b0;
                    out <= {info[48 +: 8], 8'b0, green};
                    col <= 8'b00000100;
               end
               8'b00000100: begin
                    if(c == 3'b000)
                        green[r] <= 1'b1;
                    else
                        green <= 8'b0;
                    out <= {info[56 +: 8], 8'b0, green};
                    col <= 8'b00000010;
               end
               8'b00000010: begin
                    if(c == 3'b001)
                        green[r] <= 1'b1;
                    else
                        green <= 8'b0;
                    out <= {info[0 +: 8], 8'b0, green};
                    col <= 8'b00000001;
               end
               8'b00000001: begin
                    if(c == 3'b010)
                        green[r] <= 1'b1;
                    else
                        green <= 8'b0;
                    out <= {info[8 +: 8], 8'b0, green};
                    col <= 8'b10000000;
               end
               endcase
           
           assign row = col;
           disp_col c1( CLK, out, ST_CP, SH_CP, data);
endmodule

