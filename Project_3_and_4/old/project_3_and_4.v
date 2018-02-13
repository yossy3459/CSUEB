`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2017 01:13:50 PM
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


module project_3_and_4(
    input Clk,
    input dacRst,
    input adcRst,
    input vgaRst,
    input [1:0] Fsel,
    input [2:0] dacFr, 
    input [2:0] adcFr,
    input [7:0] D,
    output [7:0] DB,
    output CS,
    output WR,
    output AB,
    output PD,
    output LDAC,
    output CLR,
    output RD,
    output CONVST,
    output horizontalSync,
    output verticalSync,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue
    );

    wire dbClock;
    wire [9:0] horizontalCountWire;
    wire [9:0] verticalCountWire;
    wire [7:0] curveData;

    dacTimingManager dacTimingManager(.Clk(Clk), .dacRst(dacRst), .dacFr(dacFr), .CS(CS), .WR(WR), .AB(AB), .PD(PD), .LDAC(LDAC), .CLR(CLR), .dbClock(dbClock));
    dataCreator dataCreator(.dacRstdac(Rst), .Fsel(Fsel), .DB(DB), .dbClock(dbClock));
    adcTimingManager adcTimingManager(.Clk(Clk), .adcRst(adcRst), .adcFr(adcFr), .D(D), .RD(RD), .CONVST(CONVST), .curveData(curveData));

    vgaGenelator vgaGenelator(.Clk(Clk), .vgaRst(vgaRst), .curveData(curveData), .horizontalCount(horizontalCountWire), .verticalCount(verticalCountWire), .red(red), .green(green), .blue(blue));
    horizontalCounter horizontalCounter(.Clk(Clk), .vgaRst(vgaRst), .out(horizontalSync), .horizontalCount(horizontalCountWire));
    verticalCounter verticalCounter(.Clk(Clk), .vgaRst(vgaRst), .horizontalClock(horizontalSync), .out(verticalSync), .verticalCount(verticalCountWire));     
         
endmodule