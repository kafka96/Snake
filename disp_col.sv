`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2016 08:58:17 AM
// Design Name: 
// Module Name: disp_col
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


module disp_col(input logic CLK, input logic [24:0] out, output logic ST_CP, SH_CP, output logic data);
       logic [7:0]count;
       logic in;
       
       logic [26:0] size;
       initial begin
           ST_CP <= 1'b0;
           data <= 1'b0;
           count = 8'd1;
           in <= 1'b0;
           size = 27'b000000000000000000110100011;
       end
       
       always_ff @(posedge SH_CP) begin
           case(count)
            0: in <= out[count];
            1: in <= out[count];
            2: in <= out[count];
            3: in <= out[count];
            4: in <= out[count];
            5: in <= out[count];
            6: in <= out[count];
            7: in <= out[count];
            8: in <= out[count];
            9: in <= out[count];
            10: in <= out[count];
            11: in <= out[count];
            12: in <= out[count];
            13: in <= out[count];
            14: in <= out[count];
            15: in <= out[count];
            16: in <= out[count];
            17: in <= out[count];
            18: in <= out[count];
            19: in <= out[count];
            20: in <= out[count];
            21: in <= out[count];
            22: in <= out[count];
            23: in <= out[count];
            24: in <= 1'b1;
           
           endcase
           
           if(count <= 8'd24) begin
                ST_CP <= 1'b0;
                count <= count + 1;       
           end
           else if( (out[16 +: 8] == 8'b11111111) && (count <= 8'd25) )begin
                count <= count + 1;
                ST_CP <= 1'b0;
                end
           else begin
                ST_CP <= 1'b1;
                count <= 8'd0;
           end
           
           data <= in;
       end
       
     clk_converter c1(CLK, 0, size, SH_CP);
endmodule
