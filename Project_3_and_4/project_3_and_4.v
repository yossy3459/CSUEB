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
    input Ack,
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
    wire vgaClock;
    wire [9:0] horizontalCountWire;
    wire [9:0] verticalCountWire;
    wire [7:0] curveData;
    wire hColorClock;
    wire vColorClock;
    // wire [8:0] verticalLineNum;
    wire [9:0] hColorCount;
    wire [9:0] vColorCount;
    wire [9:0] adcToVgaCount;


    dacTimingManager dacTimingManager(.Clk(Clk), .dacRst(dacRst), .dacFr(dacFr), .CS(CS), .WR(WR), .AB(AB), .PD(PD), .LDAC(LDAC), .CLR(CLR), .dbClock(dbClock));
    dataCreator dataCreator(.dacRst(dacRst), .Fsel(Fsel), .DB(DB), .dbClock(dbClock));
    adcTimingManager adcTimingManager(.Clk(Clk), .adcRst(adcRst), .adcFr(adcFr), .D(D), .RD(RD), .CONVST(CONVST), .curveData(curveData), .adcToVgaCount(adcToVgaCount));

    vgaGenelator vgaGenelator(.Clk(Clk), .vgaClock(vgaClock), .vgaRst(vgaRst), .curveData(curveData), .red(red), .green(green), .blue(blue), .hColorClock(hColorClock), .vColorClock(vColorClock), .adcToVgaCount(adcToVgaCount), .hColorCount(horizontalCountWire), .vColorCount(verticalCountWire));
    horizontalCounter horizontalCounter(.Clk(Clk), .vgaRst(vgaRst), .out(horizontalSync), .horizontalCount(horizontalCountWire), .hColorClock(hColorClock), .hColorCount(hColorCount), .vgaClock(vgaClock));
    verticalCounter verticalCounter(.Clk(Clk), .vgaRst(vgaRst), .horizontalClock(horizontalSync), .out(verticalSync), .verticalCount(verticalCountWire), .vColorClock(vColorClock), .vColorCount(vColorCount)/*, .verticalLineNum(verticalLineNum)*/);     
         
endmodule