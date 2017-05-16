`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2016 02:13:48 PM
// Design Name: 
// Module Name: game
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


module game(input logic CLK, input logic key_clk, input logic datain, switch, 
        output logic [5:0] out_, //test output
        output logic [7:0]row, output logic ST_CP, SH_CP, OE, MR, output logic data, //matrix output
        output logic [3:0] AN, output logic [6:0] C, output logic DP); //7 segment output
        
        
        logic [63: 0]info;
        logic [63: 0] o_info;
        logic [2:0]dir;
        
        logic enab;
        
        logic [3:0] cs1, cs2, cs3;
        logic [5:0] scount;
        
        logic apple_en;
        
        logic res;
        logic [12:0] count4;
        logic test2;
        logic [3:0] score;
        
        logic pause;
        
        logic c1, three;
        
        logic level1, level2, level3;
        
        logic [2:0] head_c;
        logic [2:0] head_r;
        
        logic [2:0] tail_c;
        logic [2:0] tail_r;
                
        logic [26:0] speed1;
        logic [26:0] speed2;
        logic [26:0] speed3;
        
        logic [5:0] head_index;
        logic [5:0] tail_index;
        logic [5:0] index;
        logic [5:0] index2;
        
        logic switch;
        logic [2:0] c;
        logic [2:0] r;
        
        logic test;
        logic over;
        
        logic fast;
        logic slow;
        logic reset;
        logic gameover;
        
        reg [2:0] snake_col[63:0];
        reg [2:0] snake_row[63:0]; 
        
        logic [5:0] size;
        logic [5:0] count;
        logic [5:0] count2;
        logic [5:0] count3;
        logic [5:0] count4;
        
        logic [7:0] data;
        
        //clocks
        logic level1;
        logic level2;
        logic level3;
        logic new_clk;
        
        logic [1:0] level;
        
        initial begin
            dir <= 3'b100; //up
            level <= 2'b00;
            
            head_c <= 3'b001;
            head_r <= 3'b010;
            
            cs1 <= 4'b0;
            cs2 <= 4'b0;
            cs3 <= 4'b0;
            scount <= 6'b0;
            
            res <= 1'b0;
            over <= 1'b0;
            
            test <= 1'b1;
            
            gameover <= 1'b0;
            
            count2 <= 6'b0;
            count3 <= 6'b1;
            index <= 6'b001001;
            size <= 6'b000010;
            count <= 6'b0;
            info <= 64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000;
            
            snake_col[0] <= 3'b001;
            snake_row[0] <= 3'b010;
            
            snake_col[1] <= 3'b001;
            snake_row[1] <= 3'b001;
            
            snake_col[2] <= 3'b001;
            snake_row[2] <= 3'b000;
            
            test2 <= 1'b1;
            
            speed1 <= 27'b001111101011110000100000000;
            speed2 <= 27'b001000101011110000100000000;
            speed3 <= 27'b000110001011110000100000000;
            
            c <= 3'b001;
            r <= 3'b111;
        end
        
        //resetting and game over;
        /*
        always_ff @(posedge reset or posedge CLK)
        if(reset) begin
            snake_col[0] <= 3'b001;
            snake_row[0] <= 3'b010;
            
            snake_col[1] <= 3'b001;
            snake_row[1] <= 3'b001;
            
            snake_col[2] <= 3'b001;
            snake_row[2] <= 3'b000;
            size <= 6'b000010;
        end
        */
        
        always_ff@(posedge CLK)
            if(over)
                o_info <= 64'b00111100_01000010_10010011_10000101_10000101_10010011_01000010_00111100;
            else
                o_info <= info;
        
        
        always_ff @(posedge CLK)
            if(!over)
                if(count < size) begin
                    index <= snake_col[count] * 4'd8 + snake_row[count];
                    count <= count + 1; 
                    info[index] <= 1'b1;
                end
                else begin                
                    count <= 6'b0;
                    index2 <= tail_c * 4'd8 + tail_r;
                    info[index2] <= 1'b0;
                end
        
        
        
        
        
        //Move
        
        always_ff @(posedge new_clk)
            if(!over && !pause)
                case(dir)
                3'b100: begin //up
                    head_c <= snake_col[0];
                    head_r <= snake_row[0] + 1;
                end
                3'b001: begin  //right
                    head_c <= snake_col[0] + 1;
                    head_r <= snake_row[0];
                end
                3'b110: begin  //left
                    head_c <= snake_col[0] - 1;
                    head_r <= snake_row[0];                
                end
                3'b011: begin //down
                    head_c <= snake_col[0];
                    head_r <= snake_row[0] - 1;
                end
                3'b000: begin //pause
                    head_c <= snake_col[0];
                    head_r <= snake_row[0];
                end
                
                
                endcase
           
        always_ff @(posedge new_clk)
            if(!over && !pause)
                if(count2 > 6'b0) begin
                    snake_col[count2] <= snake_col[count2 - 1];
                    snake_row[count2] <= snake_row[count2 - 1];
                    count2 <= count2 - 1;
                end
                else begin
                    count2 <= size;
                    snake_col[0] <= head_c;
                    snake_row[0] <= head_r;
                    tail_c <= snake_col[size];
                    tail_r <= snake_row[size];
                end
           
        
        
        //Clock assingin
        always_ff @(posedge CLK)
        case(level)
        2'b00: new_clk <= level1;
        2'b01: new_clk <= level2;
        2'b10: new_clk <= level3;
        endcase
        
        
        always_ff @(posedge apple_en) begin
            cs1 <= cs1 + 1;
            if(cs1 == 4'b1001) begin
                cs1 <= 4'b0;
                cs2 <= cs2 + 1;
            end
            
            if(cs2 == 4'b1001) begin
                cs2 <= 4'b0;
                cs3 <= cs3 + 1;
            end            
            
        end
            
        always_ff @(posedge reset)
            res <= 1'b1;
            
        always_ff @(posedge gameover)
            over <= 1'b1;
            
        
        
        /*
        always_ff @ (posedge _1_sec) begin
            head_c <= hc;
            head_r <= hr;
            tail_c <= tc;
            tail_r <= tr;
        end
            
        always_ff @ (posedge _1_sec) begin
            head_index <= head_c * 4'b1000 + head_r;
            tail_index <= tail_c * 4'b1000 + tail_r;
            
            info[head_index] <= 1'b1;
            
            if(!apple_en)
                info[tail_index] <= 1'b0;
            
        end
        
        always_ff @(posedge CLK)
            head_i <= head_c;
            
        */
          
        always_ff@(posedge CLK)
            out_ <= {level, 2'b0, over};
            
        
        
            
         
        //checking
        always_ff @(posedge new_clk) 
            if(snake_col[0] == c && snake_row[0] == r && test) begin
                apple_en <= 1'b1;
                size <= size + 1;
                test <= 1'b0;
            end            
            else begin
                apple_en <= 1'b0;
                test <= 1'b1;
                
                end
                
                
                
                
        
        
        
            
        
            
        
        //checkong collision
        always_ff @(posedge CLK) begin
            if(count3 < size)
                count3 <= count3 + 1;
            else
                count3 <= 6'b1;
        end
            
        always_ff @(posedge CLK)
            if(head_c == snake_col[count3] && head_r == snake_row[count3] && !apple_en)
                gameover <= 1'b1;
        
                           
        //assingning the score       
        always_ff @(posedge CLK)
            score <= size - 2;
        
        //module instantinaitons
        clk_converter sec1(CLK, 0,  speed1, level1);
        clk_converter sec2(CLK, 0,  speed2, level2);
        clk_converter sec3(CLK, 0,  speed3, level3);
        
        apple_gen apple(CLK, apple_en, info, c, r);
        led_matrix_display display(CLK, o_info, c, r, row, ST_CP, SH_CP, OE, MR, data);
        get_dir dir1(CLK, key_clk, datain, dir, level, pause, reset);
        display_controller d1(CLK, 0, 4'b1111, {2'b0, level}, cs3, cs2, cs1, AN, C, DP);
endmodule
