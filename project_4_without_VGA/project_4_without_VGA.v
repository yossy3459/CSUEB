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


module project_4_without_VGA(
    input Clk,
    input Rst,
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
    output CONVST
    );

    wire dbClock;

    dacTimingManager dacTimingManager(.Clk(Clk), .Rst(Rst), .dacFr(dacFr), .CS(CS), .WR(WR), .AB(AB), .PD(PD), .LDAC(LDAC), .CLR(CLR), .dbClock(dbClock));
    dataCreator dataCreator(.Rst(Rst), .Fsel(Fsel), .DB(DB), .dbClock(dbClock));
    adcTimingManager adcTimingManager(.Clk(Clk), .Rst(Rst), .adcFr(adcFr), .D(D), .RD(RD), .CONVST(CONVST));

             
endmodule