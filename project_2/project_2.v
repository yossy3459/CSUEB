`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2017 04:59:43 PM
// Design Name: 
// Module Name: project_2
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


module project_2(
    input Clk,
    input Rst,
    input [1:0] Fsel,
    input [2:0] Fr,
    output [7:0] DB,
    output CS,
    output WR,
    output AB,
    output PD,
    output LDAC,
    output CLR,
    output VDD,
    output REFIN,
    output VoutA,
    output VoutB,
    output DGND
    );
    
    // declation
    reg [3:0] clockCount; 
    reg [3:0] shapeCount;
    reg [3:0] x;
    
    reg [1:0] Fsel;
    reg [2:0] Fr;
    reg [7:0] DB;
    reg CS;
    reg WR;
    reg AB;
    reg PD;
    reg LDAC;
    reg CLR;
    reg VDD;
    reg REFIN;
    reg VoutA;
    reg VoutB;
    reg DGND;
        
    // main process
        always @(posedge Clk or negedge Rst) begin
            // Reset => initialize of internal counter
            if (!Rst) begin
                clockCount <= 0;
                shapeCount <= 0;
            end
            
            // main loop
            else begin
                // increment of counter
                clockCount <= clockCount + 1;
                shapeCount <= shapeCount + 1;
            
                // initialize of output
                if ( clockCount == 0 ) begin
                    AB <= 0;
                    DB <= 0;
                    CS <= 0;
                    WR <= 0;

                end
                
                // If clockCount equals 1, shape module writes DB. 
                
                if ( clockCount == 2 ) begin
                    WR <= ~WR; // disable
                end
                
                if ( clockCount == 3 ) begin
                    AB <= ~AB; // disable
                    CS <= ~CS; // disable
                end
                
                if ( clockCount == 5 ) begin
                    LDAC <= 0;  // enable
                    CLR <= 0;  // enable
                end 
                    
                if ( clockCount == 7 ) begin
                    LDAC <= 1;  // enable
                    CLR <= 1;  // enable
                end
            end
        end
endmodule
