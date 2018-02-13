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
    output CLR
    );

    wire dbClock;

    timingManager timingManager(.Clk(Clk), .Rst(Rst), .Fr(Fr), .CS(CS), .WR(WR), .AB(AB), .PD(PD), .LDAC(LDAC), .CLR(CLR), .dbClock(dbClock));
    dataCreator dataCreator(.Rst(Rst), .Fsel(Fsel), .DB(DB), .dbClock(dbClock));
             
endmodule